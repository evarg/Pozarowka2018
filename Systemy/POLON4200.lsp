(setq SYSTEM_NAME "POLON4200")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq POLON4200_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\POLON4200\\"))


(setq POLON4200_LISTA_BLOKOW '(
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

(defun polon4200:BlokiLista ()
	(ssp:BlokiLista POLON4200_LISTA_BLOKOW)
)	
	
(defun polon4200:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku POLON4200_LISTA_BLOKOW POLON4200_PATH_BLOKI)
)	
	
(defun polon4200:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn POLON4200_LISTA_BLOKOW sNazwa)
)	
	
(defun polon4200:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff POLON4200_LISTA_BLOKOW sNazwa)
)	
	
(defun polon4200:PobierzListeElementow ()
	(ssp:PobierzListeElementow POLON4200_LISTA_BLOKOW)
)	
	
	
	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))
