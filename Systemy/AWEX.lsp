(setq SYSTEM_NAME "AWEX")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq AWEX_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\AWEX\\"))


(setq AWEX_LISTA_BLOKOW '(
		"AWEX_022"
		"AWEX_OPT"
		"AWEX_OPTTERM"
		"AWEX_ROP"
		"AWEX_WZ"
	))

(defun awex:BlokiLista ()
	(ssp:BlokiLista AWEX_LISTA_BLOKOW)
)	
	
(defun awex:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku AWEX_LISTA_BLOKOW AWEX_PATH_BLOKI)
)	
	
(defun awex:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn AWEX_LISTA_BLOKOW sNazwa)
)	
	
(defun awex:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff AWEX_LISTA_BLOKOW sNazwa)
)	
	
(defun awex:PobierzListeElementow ()
	(ssp:PobierzListeElementow AWEX_LISTA_BLOKOW)
)	
	
	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))