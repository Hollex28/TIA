(define (domain Logistica)
	(:requirements :durative-actions :typing :fluents)
	(:types carga transporte conductor ciudad - objeto
	(ligera pesada - carga)
	)
	(:predicates 
		(Esto ?x - (either conductor carga trasporte) esta en ?c - ciudad)
    	(Conductor ?c - conductor conduce ?t - transporte)	
	)
	(:functions
		(CargarLigeraTransporte ?t - transporte ?c - ligera)
		(GruaCiudadLibre ?c)
		(CargarPesadoTransporte ?t - transporte ?c - pesada)
		(DesCargarPesadoTransporte ?t - transporte ?c - pesada)
		(DesCargarLigeraTransporte ?t - transporte ?c - ligera)
		(Pilotar ?c - conductor ?t - transporte)
		(Salir ?c - conductor ?t - transporte)
		(DistanciaEntreCiudades ?c1 - ciudad ?c2 -ciudad)
)
