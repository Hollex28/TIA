(define (problem ejercicio)
    (:domain Logistica)
    (:objects
        A - ciudad
        B - ciudad
        C - ciudad
        D - ciudad
        E - ciudad

        p1 - pesada
        p2 - ligera

        c1 - conductor
        c2 - conductor

        t1 - transporte
        t2 - transporte)
    (:init
        (at p1 A)
        (at p2 D)
        (at c1 C)
        (at c2 D)
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
		
		(LibreDesPes A)
		(LibreDesPes B)
		(LibreDesPes C)
		(LibreDesPes D)
		(LibreDesPes E)

        (= (Cbus) 3)
        (= (Tbus) 10)
        (= (CCargaL) 2)
        (= (TCagasL) 1)
        (= (CCargaP) 4)
        (= (TCagasP) 2)
        (= (TDescagasL) 1)
        (= (CDescargasL) 2)
        (= (TDescagasP) 2)
        (= (CDescargasP) 4)
        (= (TSubir) 1)
        (= (CSubir) 1)
        (= (TBajar) 1)
        (= (CBajar) 1)

        (= (CTotal) 0)
    )
    (:goal (and
        (at p1 E)
        (at p2 C)
        (at t2 A)
        (at c1 B)
    ))
    (:metric minimize (+ (* 0.2 (total-time)) (* 0.5 (Ctotal))))
)
