(setq SYSTEM_NAME "POLON4900")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq POLON4900_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\POLON4000\\"))


(setq POLON4900_LISTA_BLOKOW '(
		"POLON_ACR" 
		"POLON_DIO" 
		"POLON_DOR" 
		"POLON_DUR" 
		"POLON_EKS" 
		"POLON_EWK" 
		"POLON_EWS" 
		"POLON_RADIO" 
		"POLON_ROP" 
		"POLON_SAL" 
		"POLON_TUN" 
		"POLON_WZ"  
		"POLON_UCS"  
		"POLON_DOT"  
	))

(defun polon4900:BlokiLista ()
	(ssp:BlokiLista POLON4900_LISTA_BLOKOW)
)	
	
(defun polon4900:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku POLON4900_LISTA_BLOKOW POLON4900_PATH_BLOKI)
)	
	
(defun polon4900:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn POLON4900_LISTA_BLOKOW sNazwa)
)	
	
(defun polon4900:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff POLON4900_LISTA_BLOKOW sNazwa)
)	
	
(defun polon4900:PobierzListeElementow ()
	(ssp:PobierzListeElementow POLON4900_LISTA_BLOKOW)
)	
	
	
	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))
