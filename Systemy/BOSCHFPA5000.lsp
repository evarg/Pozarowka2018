(setq SYSTEM_NAME "BOSCHFPA5000")

(ssp:Log (strcat " - Strat wczytywanie systemu: " SYSTEM_NAME))

(setq BOSCHFPA5000_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\BOSCHFPA5000\\"))


(setq BOSCHFPA5000_LISTA_BLOKOW '(
	"BOSCH_CON"
	"BOSCH_DM210"
	"BOSCH_DO"
	"BOSCH_DOT"
	"BOSCH_DT"
	"BOSCH_I2"
	"BOSCH_I8R1"
	"BOSCH_NAC"
	"BOSCH_RHV"
	"BOSCH_RLV1"
	"BOSCH_RLV8"
	"BOSCH_WZ"
	"BOSCH_AF"
))

(defun boschfpa5000:BlokiLista ()
	(ssp:BlokiLista BOSCHFPA5000_LISTA_BLOKOW)
)	
	
(defun boschfpa5000:BlokiWczytajZDysku ()
	(ssp:BlokiWczytajZDysku BOSCHFPA5000_LISTA_BLOKOW BOSCHFPA5000_PATH_BLOKI)
)	
	
(defun boschfpa5000:ParametrOn ( sNazwa )
	(ssp:ParametrListaOn BOSCHFPA5000_LISTA_BLOKOW sNazwa)
)	
	
(defun boschfpa5000:ParametrOff ( sNazwa )
	(ssp:ParametrListaOff BOSCHFPA5000_LISTA_BLOKOW sNazwa)
)	
	
(defun boschfpa5000:PobierzListeElementow ()
	(ssp:PobierzListeElementow BOSCHFPA5000_LISTA_BLOKOW)
)	
	
	
	
(ssp:Log (strcat " - Koniec wczytywanie systemu: " SYSTEM_NAME))
