(setq SYSTEM_NAME "FP2000")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq FP2000_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\FP2000\\"))

(setq FP2000_LISTA_BLOKOW '(
		"FP2000_DP2061N" 
		"FP2000_DP2061T" 
		"FP2000_DT2063N" 
		"FP2000_DB2016" 
		"FP2000_DM2010" 
		"FP2000_IU2055C" 
		"FP2000_IO2014C" 
		"FP2000_IO2031C" 
		"FP2000_IO2032C" 
		"FP2000_IO2034C" 
		"FP2000_IU2080C" 
		"FP2000_WZ" 
		"FP2000_AS2363"
	))

(defun fp:BlokiLista ()
	(ssp:BlokiLista FP2000_LISTA_BLOKOW)
)	
	
(defun fp:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku FP2000_LISTA_BLOKOW FP2000_PATH_BLOKI)
)
	
(defun fp:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn FP2000_LISTA_BLOKOW sNazwa)
)	
	
(defun fp:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff FP2000_LISTA_BLOKOW sNazwa)
)	
	
(defun fp:PobierzListeElementow ()
	(ssp:PobierzListeElementow FP2000_LISTA_BLOKOW)
)


(defun fp:ParametrRozmiar ( sNazwa Rozmiar )
	(ssp:ParametrRozmiar FP2000_LISTA_BLOKOW sNazwa Rozmiar)
)	
	

	

	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))


	