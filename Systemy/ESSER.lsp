(setq SYSTEM_NAME "ESSER")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq ESSER_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\ESSER\\"))


(setq ESSER_LISTA_BLOKOW '(
		"ESSER_12R" 
		"ESSER_4G2R" 
		"ESSER_MCP" 
		"ESSER_O" 
		"ESSER_O2T" 
		"ESSER_O2TW" 
		"ESSER_TAL" 
		"ESSER_Wireless" 
		"ESSER_WZ" 
		"ESSER_FCT"
	))

(defun ESSER:BlokiLista ()
	(ssp:BlokiLista ESSER_LISTA_BLOKOW)
)	
	
(defun ESSER:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku ESSER_LISTA_BLOKOW ESSER_PATH_BLOKI)
)	
	
(defun ESSER:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn ESSER_LISTA_BLOKOW sNazwa)
)	
	
(defun ESSER:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff ESSER_LISTA_BLOKOW sNazwa)
)	
	
(defun ESSER:PobierzListeElementow ()
	(ssp:PobierzListeElementow ESSER_LISTA_BLOKOW)
)	
	
	
	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))
