(define (problem ejercicio)
    (:domain Logistica)
    (:objects
        A - ciudad
        B - ciudad
        C - ciudad
        D - ciudad
        E - ciudad

        p1 - ligera
        p2 - ligera
		p3 - pesada
		p4 - pesada

        c1 - conductor
        c2 - conductor

        t1 - transporte
        t2 - transporte)
    (:init
        (at p1 D)
        (at p2 D)
        (at p3 D)
        (at p4 D)
        (at c1 A)
        (at c2 A)
        (at t1 A)
        (at t2 A)

        (= (Cviaje A B) 1)
        (= (Tviaje A B) 4)
        (= (Cviaje A C) 1)
        (= (Tviaje A C) 2)
        (= (Cviaje B C) 3)
        (= (Tviaje B C) 4)
        (= (Cviaje B D) 3)
        (= (Tviaje B D) 3)
        (= (Cviaje B E) 3)
        (= (Tviaje B E) 4)
        (= (Cviaje C E) 6)
        (= (Tviaje C E) 9)

        (= (Cviaje B A) 1)
        (= (Tviaje B A) 4)
        (= (Cviaje C A) 1)
        (= (Tviaje C A) 2)
        (= (Cviaje C B) 3)
        (= (Tviaje C B) 4)
        (= (Cviaje D B) 3)
        (= (Tviaje D B) 3)
        (= (Cviaje E B) 3)
        (= (Tviaje E B) 4)
        (= (Cviaje E C) 6)
        (= (Tviaje E C) 9)

		(= (TAuto A B) 2)
		(= (CAuto A B) 3)
		(= (TAuto B A) 2)
		(= (CAuto B A) 3)
		(= (TAuto B D) 2)
		(= (CAuto B D) 5)
		(= (TAuto D B) 2)
		(= (CAuto D B) 5)
		(= (TAuto D E) 3)
		(= (CAuto D E) 5)
		(= (TAuto E D) 3)
		(= (CAuto E D) 5)
		(= (TAuto E C) 6)
		(= (CAuto E C) 8)
		(= (TAuto C E) 6)
		(= (CAuto C E) 8)


        (hayruta A B)
        (hayruta A C)
        (hayruta B A)
        (hayruta B C)
        (hayruta B D)
        (hayruta B E)
        (hayruta C A)
        (hayruta C B)
        (hayruta C E)
        (hayruta D B)
        (hayruta E B)
        (hayruta E C)

		(hayauto A B)
		(hayauto B A)
		(hayauto B D)
		(hayauto D B)
		(hayauto D E)
		(hayauto E D)
		(hayauto E C)
		(hayauto C E)

		
		(LibreDesPes A)
		(LibreDesPes B)
		(LibreDesPes C)
		(LibreDesPes D)
		(LibreDesPes E)


        (= (CCarga) 4)
        (= (TCagas) 2)
        (= (TDescagas) 2)
        (= (CDescargas) 4)
        (= (TSubir) 1)
        (= (CSubir) 1)
        (= (TBajar) 1)
        (= (CBajar) 1)

        (= (CTotal) 0)
    )
    (:goal (and
        (at p1 C)
        (at p2 C)
	    (at p3 C)
        (at p4 C)
        (at t2 A)
        (at c1 B)
    ))
    (:metric minimize (+ (* 0.2 (total-time)) (* 0.3 (Ctotal))))
)
