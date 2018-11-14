(deffunction fuzzify (?fztemplate ?value ?delta)

        (bind ?low (get-u-from ?fztemplate))
        (bind ?hi  (get-u-to   ?fztemplate))

        (if (<= ?value ?low)
          then
            (assert-string
              (format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
          else
            (if (>= ?value ?hi)
              then
                (assert-string
                   (format nil "(%s (%g 0.0) (%g 1.0))"
                               ?fztemplate (- ?hi ?delta) ?hi))
              else
                (assert-string
                   (format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))"
                               ?fztemplate (max ?low (- ?value ?delta))
                               ?value (min ?hi (+ ?value ?delta)) ))
            )
        )
 )
(deftemplate VEHICULO
	(slot id (type SYMBOL))
	(slot distancia (type FLOAT))
	(slot velocidad-relativa (type FLOAT))
	(slot presion-freno (type SYMBOL) (default nil))
	(slot warning (type SYMBOL) (default OFF)))
	 

(deftemplate fdistancia 0 50 metros
(	(cerca (0 1)(15 0))
	(medio (10 0)(25 1)(35 1)(40 0))
	(lejos (35 0)(50 1))))

(deftemplate fvelocidad-relativa -30 30 km/h
(	(alejando (-30 1)(0 0))
	(constante (-10 0)(0 1)(10 0))
	(acercando (0 0)(30 1))))

(deftemplate fpresion-freno 0 100 %
(	(nula (z 10 25))
	(media (pi 25 65))
	(alta (s 65 90))))
	
	
(deffunction leerDatos () ;lee de consola un valor crisp y aserta su valor fusificado
 (printout t "Introduzca la Distancia en metros" crlf)
 (bind ?Rdistancia (read))
 (printout t "Introduzca la Velocidad Relativa en Km/H" crlf)
 (bind ?RVelocidad (read))
 (printout t "Escribe un indentificador" crlf)
 (bind ?RID (read))
 (assert ( VEHICULO ( id ?RID )( distancia ?Rdistancia )( velocidad-relativa ?RVelocidad )))
 (fuzzify fvelocidad-relativa ?RVelocidad 0.1)
 (fuzzify fdistancia ?Rdistancia 0.1)
 )
 
 ; Reflas de inferencia difusa
 
 (defrule inicios
	(initial-fact)
	=>
	(leerDatos)
 )
 
 (defrule cerca-alejando
	(velocidad-relativa alejando)
	(distancia cerca)
	=>
	(assert (fpresion-freno nula)))

	(defrule medio-alejando
	(fvelocidad-relativa alejando)
	(fdistancia medio)
	=>
	(assert (fpresion-freno nula)))
	
	 (defrule lejos-alejando
	(fvelocidad-relativa alejando)
	(fdistancia lejos)
	=>
	(assert (fpresion-freno nula)))
	
	 (defrule cerca-constante
	(fvelocidad-relativa constante)
	(fdistancia cerca)
	=>
	(assert (fpresion-freno more-or-less media)))
	
	 (defrule medio-constante
	(fvelocidad-relativa constante)
	(fdistancia medio)
	=>
	(assert (fpresion-freno nula)))
	
	 (defrule lejos-constante
	(fvelocidad-relativa constante)
	(fdistancia lejos)
	=>
	(assert (fpresion-freno nula)))
	
	 (defrule cerca-acercando
	(fvelocidad-relativa acercando)
	(fdistancia cerca)
	=>
	(assert (fpresion-freno alta)))
	
	(defrule medio-acercando
	(fvelocidad-relativa acercando)
	(fdistancia medio)
	=>
	(assert (fpresion-freno media)))
	
	(defrule lejos-acercando
	(fvelocidad-relativa acercando)
	(fdistancia lejos)
	=>
	(assert (fpresion-freno more-or-less media)))
	  
	
	(defrule presionado
	?vh <- (VEHICULO (presion-freno nil))
	?pf <- (fpresion-freno ?)
	=>
	(modify ?vh (presion-freno ?pf)))
	
	(defrule luzwarning
	?vh <- (VEHICULO (warning OFF))
	(fpresion-freno very alta)
	=>
	(modify ?vh (warning ON)))

	
	(defrule fuzzy1
		(declare (salience -2))
		?vh <- ( VEHICULO ( id ?Identidad )( distancia ?Distance )( velocidad-relativa ?RelativeVel ) (presion-freno ?f)(warning ?w))
	=>
		(bind ?e (maximum-defuzzify ?f))
		(printout t "El vehiculo " ?Identidad " Con una velocidad relativa de " ?RelativeVel " y una distancia de " ?Distance " tiene que frenar con una presion " ?e " maximum-defuzzify "crlf)
		(bind ?j (moment-defuzzify ?f))
		(printout t "El vehiculo " ?Identidad " Con una velocidad relativa de " ?RelativeVel " y una distancia de " ?Distance " tiene que frenar con una presion " ?j " moment-defuzzify " crlf)
		(printout t "El warning del vehiculo se encuenta " ?w crlf)
	)
 
 

