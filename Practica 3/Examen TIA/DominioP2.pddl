(define (domain Logistica)
	(:requirements :durative-actions :typing :fluents)
	(:types carga transporte conductor ciudad - objeto
	ligera pesada - carga
	)
	(:predicates
		(at ?x - (either carga transporte conductor ) ?c - ciudad)
        (in ?p - (either carga conductor) ?t - transporte)
        (hayruta ?c1 ?c2 - ciudad)
		(LibreDesPes ?c1 -ciudad)
		(hayauto ?c1 ?c2 - ciudad)
	)
	(:functions
		(Cviaje ?c1 ?c2 - ciudad)
		(Tviaje ?c1 ?c2 - ciudad)
		(CAuto ?c1 ?c2 - ciudad)
		(TAuto ?c1 ?c2 - ciudad)
		(CCarga)
		(TCagas)
		(TDescagas)
		(CDescargas)
		(CSubir)
		(TSubir)
		(CBajar)
		(TBajar)
		(CTotal)
	)
	(:durative-action ConduceRuta
        :parameters (?t - transporte ?con - conductor ?origen ?destino - ciudad)
        :duration (= ?duration (Tviaje ?origen ?destino))
        :condition (and
            (over all (in ?con ?t))
            (over all (hayruta ?origen ?destino))
            (at start (at ?t ?origen)))
        :effect (and
            (at start (not (at ?t ?origen)))
            (at end   (at ?t ?destino))
            (at end   (increase (Ctotal) (Cviaje ?origen ?destino))))
    )
		(:durative-action ConduceAuto
        :parameters (?t - transporte ?con - conductor ?origen ?destino - ciudad)
        :duration (= ?duration (TAuto ?origen ?destino))
        :condition (and
            (over all (in ?con ?t))
            (over all (hayauto ?origen ?destino))
            (at start (at ?t ?origen)))
        :effect (and
            (at start (not (at ?t ?origen)))
            (at end   (at ?t ?destino))
            (at end   (increase (Ctotal) (CAuto ?origen ?destino))))
    )
	(:durative-action cargar
        :parameters (?c1 - carga ?c2 - carga ?t1 - transporte ?t2 - transporte ?c - ciudad)
        :duration (= ?duration (TCagas))
        :condition (and
            (at start (at ?c2 ?c))
			(at start (at ?c1 ?c))
            (at start (at ?t1 ?c))
			(at start (at ?t2 ?c))
			(at start (LibreDesPes ?c)))
        :effect (and
            (at start (not (at ?c1 ?c)))
			(at start (not (at ?c2 ?c)))
			(at start (not(LibreDesPes ?c)))
			(at end (LibreDesPes ?c))
            (at end (in ?c1 ?t1))
			(at end (in ?c2 ?t2))
            (at end (increase (Ctotal) (CCarga))))
    )
	(:durative-action Descarga
        :parameters (?c1 - carga ?c2 - carga ?t1 - transporte ?t2 - transporte ?c - ciudad)
        :duration (= ?duration (TDescagas))
        :condition (and
            (at start (in ?c1 ?t1))
            (at start (at ?t1 ?c))
            (at start (in ?c2 ?t2))
            (at start (at ?t2 ?c)))
        :effect (and
            (at start (not (in ?c1 ?t1)))
			(at start (not (in ?c2 ?t2)))
            (at end (at ?c1 ?c))
			(at end (at ?c2 ?c))
            (at end (increase (Ctotal) (CCarga))))
    )
    (:durative-action subirse
        :parameters (?con - conductor ?t - transporte ?c - ciudad)
        :duration (= ?duration (TSubir))
        :condition (and
            (at start (at ?t ?c))
            (at start (at ?con ?c)))
        :effect (and
            (at start (not (at ?con ?c)))
            (at end (in ?con ?t))
            (at end (increase (Ctotal) (CSubir))))
    )
    (:durative-action bajarse
        :parameters (?con - conductor ?t - transporte ?c - ciudad)
        :duration (= ?duration (TBajar))
        :condition (and
            (at start (at ?t ?c))
            (at start (in ?con ?t)))
        :effect (and
            (at start (not (in ?con ?t)))
            (at end (at ?con ?c))
            (at end (increase (Ctotal) (CBajar))))
    )
)
	

