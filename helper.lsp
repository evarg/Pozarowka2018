(print "Wczytany helper.lsp")

; zamienia liste na stringa
; (GR:lst->str '("1" "2" "3" "4" "5") "!")
; "1!2!3!4!5"

(defun GR:lst2str ( lst del / str )
    (setq str (car lst))
    (foreach itm (cdr lst) (setq str (strcat str del itm)))
    str
)

;zamienia stringa na liste
; (GR:str->lst "1!2!3!4!5" "!")
; ("1" "2" "3" "4" "5")

(defun GR:str2lst ( str del / len lst pos )
    (setq len (1+ (strlen del)))
    (while (setq pos (vl-string-search del str))
        (setq lst (cons (substr str 1 pos) lst)
              str (substr str (+ pos len))
        )
    )
    (reverse (cons str lst))
)

(defun ssp:DCL_UstawieniaWidocznosciAtrybutow()
	(setq dcl_id (load_dialog (strcat PATH_SKRYPT "wUstawieniaWidocznosciAtrybutow.dcl")))
	(new_dialog "wUstawieniaWidocznosciAtrybutow" dcl_id)

	(action_tile "kRAWOn" "(ssp:ParametrListaOn BOSCHFPA5000_LISTA_BLOKOW \"raw\" )") 
	(action_tile "kRAWOff" "(ssp:ParametrListaOff BOSCHFPA5000_LISTA_BLOKOW \"raw\" )") 
	
	(action_tile "kCENTRALAOn" "(ssp:ParametrListaOn BOSCHFPA5000_LISTA_BLOKOW \"centrala\" )") 
	(action_tile "kCENTRALAOff" "(ssp:ParametrListaOff BOSCHFPA5000_LISTA_BLOKOW \"centrala\" )") 

	(action_tile "kPLANOn" "(ssp:ParametrListaOn BOSCHFPA5000_LISTA_BLOKOW \"plan\" )") 
	(action_tile "kPLANOff" "(ssp:ParametrListaOff BOSCHFPA5000_LISTA_BLOKOW \"plan\" )") 
	
	(start_dialog)

	(unload_dialog dcl_id)
)

(defun ssp:DCL_AktywnySystem()
	(setq dcl_id (load_dialog (strcat PATH_SKRYPT "wAktywnySystem.dcl")))
	(new_dialog "wAktywnySystem" dcl_id)
	(set_tile "AktywnySystem" AKTYWNY_SYSTEM)	
	
	(start_dialog)

	(unload_dialog dcl_id)
)

(defun ssp:DCL_ZmienAktywnySystem()
	(setq dcl_id (load_dialog (strcat PATH_SKRYPT "wZmienAktywnySystem.dcl")))
	(new_dialog "wZmienAktywnySystem" dcl_id)
	(set_tile "AktywnySystem" AKTYWNY_SYSTEM)	

	(action_tile "bBOSCHFPA500" 
		"
			(setq AKTYWNY_SYSTEM \"BOSCHFPA500\")
			(set_tile \"AktywnySystem\" AKTYWNY_SYSTEM)
		"
	) 

	(action_tile "bEST3" 
		"
			(setq AKTYWNY_SYSTEM \"EST3\")
			(set_tile \"AktywnySystem\" AKTYWNY_SYSTEM)
		"
	) 

	(action_tile "bPOLON4200" 
		"
			(setq AKTYWNY_SYSTEM \"POLON4200\")
			(set_tile \"AktywnySystem\" AKTYWNY_SYSTEM)
		"
	) 

	(action_tile "bPOLON4900" 
		"
			(setq AKTYWNY_SYSTEM \"POLON4900\")
			(set_tile \"AktywnySystem\" AKTYWNY_SYSTEM)
		"
	) 

	(action_tile "bFP2000" 
		"
			(setq AKTYWNY_SYSTEM \"FP2000\")
			(set_tile \"AktywnySystem\" AKTYWNY_SYSTEM)
		"
	) 

	
	(start_dialog)

	
	
	
	(unload_dialog dcl_id)
)


(defun ssp:DCL_ParametryElementuLiniowego()

	(setq dcl_id (load_dialog (strcat PATH_SKRYPT "wParametryElementuLiniowego.dcl")))
	
	(setq nastepny 1)

	(while (not(>= 0 nastepny))
		(setq blok (entsel))
		
		(setq 
		
			ii_raw (ssp:AtrybutPobierzDXF (car blok) "raw")
			ii_centrala (ssp:AtrybutPobierzDXF (car blok) "centrala")
			ii_plan (ssp:AtrybutPobierzDXF (car blok) "plan")
		)
				
		(new_dialog "Najprostszy" dcl_id)
		
		(set_tile "i_raw" ii_raw)
		(set_tile "i_centrala" ii_centrala)
		(set_tile "i_plan" ii_plan)
		
		(action_tile "ZiW" 
			"
				(setq nii_raw (get_tile \"i_raw\"))
				(ssp:AtrybutUstawDXF (car blok) \"raw\" nii_raw)

				(setq nii_centrala (get_tile \"i_centrala\"))
				(ssp:AtrybutUstawDXF (car blok) \"centrala\" nii_centrala)

				(setq nii_plan (get_tile \"i_plan\"))
				(ssp:AtrybutUstawDXF (car blok) \"plan\" nii_plan)

				(setq nastepny 1)
				(done_dialog 2)
			"
		) 

		(action_tile "ZiZ" 
			"
 				(setq nii_raw (get_tile \"i_raw\"))
				(ssp:AtrybutUstawDXF (car blok) \"raw\" nii_raw)

				(setq nii_centrala (get_tile \"i_centrala\"))
				(ssp:AtrybutUstawDXF (car blok) \"centrala\" nii_centrala)

				(setq nii_plan (get_tile \"i_plan\"))
				(ssp:AtrybutUstawDXF (car blok) \"plan\" nii_plan)

				(setq nastepny 0)
				(done_dialog 1)
			"
		) 

		(action_tile "Anuluj" 
			"
				(setq nastepny 0)
				(done_dialog -1)
			"
		) 
		
		(start_dialog)
	)	

	(unload_dialog dcl_id)

)