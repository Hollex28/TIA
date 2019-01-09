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
	)
	(:functions
		(Cviaje ?c1 ?c2 - ciudad)
		(Tviaje ?c1 ?c2 - ciudad)
		(Cbus)
		(TBus)
		(CCargaL)
		(TCagasL)
		(CCargaP)
		(TCagasP)
		(TDescagasL)
		(CDescargasL)
		(TDescagasP)
		(CDescargasP)
		(CSubir)
		(TSubir)
		(CBajar)
		(TBajar)
		(CTotal)
	)
	(:durative-action Conduce
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
	(:durative-action Pescargar
        :parameters (?p - pesada ?t - transporte ?c - ciudad)
        :duration (= ?duration (TcagasP))
        :condition (and
            (at start (at ?p ?c))
            (at start (at ?t ?c))
			(at start (LibreDesPes ?c)))
        :effect (and
            (at start (not (at ?p ?c)))
			(at start (not (LibreDesPes ?c)))
			(at end (LibreDesPes ?c))
            (at end (in ?p ?t))
            (at end (increase (Ctotal) (CCargaP))))
    )
	(:durative-action Ligcargar
        :parameters (?l - ligera ?t - transporte ?c - ciudad)
        :duration (= ?duration (TCagasL))
        :condition (and
            (at start (at ?l ?c))
            (at start (at ?t ?c)))
        :effect (and
            (at start (not (at ?l ?c)))
            (at end (in ?l ?t))
            (at end (increase (Ctotal) (CCagasL))))
    )
(:durative-action LigDescarga
        :parameters (?l - ligera ?t - transporte ?c - ciudad)
        :duration (= ?duration (TDescagasL))
        :condition (and
            (at start (in ?l ?t))
            (at start (at ?t ?c)))
        :effect (and
            (at start (not (in ?l ?t)))
            (at end (at ?l ?c))
            (at end (increase (Ctotal) (CCargaL))))
    )
(:durative-action PesDescarga
        :parameters (?p - pesada ?t - transporte ?c - ciudad)
        :duration (= ?duration (TdescagasP))
        :condition (and
            (at start (in ?p ?t))
            (at start (at ?t ?c))
			(at start (LibreDesPes ?c)))
        :effect (and
            (at start (not (in ?p ?t)))
			(at start (not(LibreDesPes ?c)))
            (at end (at ?p ?c))
            (at end (increase (Ctotal) (CCargaP))))
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
    (:durative-action UsarBus
        :parameters (?con - conductor ?origen ?destino - ciudad)
        :duration (= ?duration (Tbus))
        :condition (and
            (at start (at ?con ?origen))
            (over all (hayruta ?origen ?destino)))
        :effect (and
            (at start (not (at ?con ?origen)))
            (at end (at ?con ?destino))
            (at end (increase (Ctotal) (Cbus))))
    )
)
	

