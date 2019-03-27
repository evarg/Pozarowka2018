(setq SYSTEM_NAME "EST3")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq EST3_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\EST3\\"))


(setq EST3_LISTA_BLOKOW '(
		"EST3_271"
		"EST3_CC1"
		"EST3_CR"
		"EST3_CT1"
		"EST3_CT2"
		"EST3_IB"
		"EST3_IO"
		"EST3_IZ"
		"EST3_PHS"
		"EST3_PS"
		"EST3_WZ"
	))

(defun est:BlokiLista ()
	(ssp:BlokiLista EST3_LISTA_BLOKOW)
)	
	
(defun est:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku EST3_LISTA_BLOKOW EST3_PATH_BLOKI)
)	
	
(defun est:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn EST3_LISTA_BLOKOW sNazwa)
)	
	
(defun est:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff EST3_LISTA_BLOKOW sNazwa)
)	
	
(defun est:PobierzListeElementow ()
	(ssp:PobierzListeElementow EST3_LISTA_BLOKOW)
)	
	
	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))