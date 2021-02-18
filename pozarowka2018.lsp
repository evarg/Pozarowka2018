; CHANGELOG
;
; 2018-11-23 - rozpoczecie pisania
; 2018-11-23 - ssp::WczytajSystemy()
;


; sciezki dostepu
(setq PATH_SKRYPT "d:\\repozytorium\\AutoLisp\\pozarowka2018\\")
(setq PATH_BLOKI (strcat PATH_SKRYPT "Bloki\\"))
(setq PATH_SYSTEMY (strcat PATH_SKRYPT "Systemy\\"))

; definicje logow systemowych
(setq LOG_SZEROKOSC 80)

; definicja aktywnego systemu
(setq AKTYWNY_SYSTEM "BRAK")

; lista systemow
(setq SYSTEMY_LISTA '(
		"BOSCHFPA5000"
		"EST3" 
		"POLON4200" 
		"POLON4900" 
		"FP2000" 
		"ESSER"
		"AWEX"
		))

; wczytanie dodatkowych funkcji
(load (strcat PATH_SKRYPT "helper.lsp"))


	
; wczytanie pliku z systemem i nadpisaniem wszystkich zmiennych	
(defun ssp:WczytajSystemy ()
	(ssp:LogLinia)
	(ssp:Log "Wczytanie systemow")
	(setq iLiczbaSystemow (length SYSTEMY_LISTA))
	(setq i 0)
	(repeat iLiczbaSystemow
		(load (strcat PATH_SYSTEMY (nth i SYSTEMY_LISTA) ".lsp"))
		(setq i (+ i 1))
	)
	(ssp:Log (strcat "Wczytanych systemow: " (itoa iLiczbaSystemow)))
	(ssp:LogLinia)
	(print)
)


; wyswielitanie listy blokow ze zmiennej	
(defun ssp:BlokiLista ( aBlokowLista / i iIloscBlokow)
	(ssp:LogLinia)
	(setq iIloscBlokow (length aBlokowLista))
	(setq i 0)
	(repeat iIloscBlokow
		(setq ttt (strcat (nth i aBlokowLista) ""))
		(ssp:Log ttt)
		(setq i (+ i 1))
	)
	(ssp:LogLinia)
	(ssp:Log (strcat "Znalezionych bloków: " (itoa iIloscBlokow)))
	(ssp:LogLinia)
	(print)
)


; wczytuje liste blokow na podstawie aktywnego systemu
(defun ssp:WczytajBlokiAktytwnegoSystemu ()
	(if (= AKTYWNY_SYSTEM "BOSCHFPA5000") 	(boschfpa5000:BlokiWczytajZDysku))
	(if (= AKTYWNY_SYSTEM "EST3") 			(est3:BlokiWczytajZDysku))
	(if (= AKTYWNY_SYSTEM "POLON4200") 		(polon4200:BlokiWczytajZDysku))
	(if (= AKTYWNY_SYSTEM "POLON4900") 		(polon4900:BlokiWczytajZDysku))
	(if (= AKTYWNY_SYSTEM "FP2000") 		(fp2000:BlokiWczytajZDysku))
	(if (= AKTYWNY_SYSTEM "BRAK") 			(print "BRAK :BlokiWczytajZDysku"))
)


; wczytuje z dysku bloki na podstawie zmiennej
(defun ssp:BlokiWczytajZDysku ( tListaBlokow sSciezka )
	;(print tListaBlokow)
	;(print sSciezka)
	(ssp:LogLinia)
	(ssp:Log "Wczytywanie z drysku blokow wg listy")
	(setq iLiczbaBlokow (length tListaBlokow))
	(setq i 0)
	(repeat iLiczbaBlokow
		(setq ttt (strcat sSciezka (nth i tListaBlokow) ".dwg"))
		(command "_insert" ttt '(0.0 0.0 0.0) 1 1 0)
		(entdel (entlast))
		(setq i (+ i 1))
		(ssp:Log ttt)
	)
	(ssp:LogLinia)
	(print)
)


; wyswietla linie na szerokosc i z gwiazdka z przodu i tylu
(defun ssp:Log (tekst)
	(setq wynik (strcat "  * " tekst " "))
	(repeat (- LOG_SZEROKOSC (strlen wynik))
		(setq wynik (strcat wynik " "))
	)
	(setq wynik (strcat wynik " *  "))
	(print wynik)
)


; wyswietla linie na szerokosc z gwiazdek
(defun ssp:LogLinia ()
	(setq wynik "  ")
	(repeat LOG_SZEROKOSC
		(setq wynik (strcat wynik "*"))
	)
	(setq wynik (strcat wynik "  "))
	(print wynik)
)

(defun ssp:ZmienParametryAtrybutuBlokuDXF ( blk attrib attrvalue / end enx )
    (while
        (and
            (null end)
            (= "ATTRIB" (cdr (assoc 0 (setq enx (entget (setq blk (entnext blk)))))))
        )
        (if (= (strcase attrib) (strcase (cdr (assoc 2 enx))))
            (if (entmod (subst (cons 70 attrvalue) (assoc 70 enx) enx))
                (progn
                    (entupd blk)
                    (setq end val)
                )
            )
        )
    )
)

(defun ssp:ZmienParametryAtrybutuBloku (blockname attrname attrvalue / i intBlockCount)
	(setq ssCzujki (ssget "X" '( (0 . "INSERT") )))
	(setq liczbaBlokow (sslength ssCzujki))
	
	(setq i 0)
	(setq rop 0)
	(repeat liczbaBlokow
		(progn
			(setq blok (entget (ssname ssCzujki i)))
			(setq nazwa (cdr (assoc 2 blok)))

			(if (= nazwa blockname)
				(progn
					(ssp:ZmienParametryAtrybutuBlokuDXF (cdr (assoc -1 blok)) attrname attrvalue)
				)
			)

			(setq i (+ i 1))
		)
	)
)

(defun ssp:ParametrSet (sNazwaBloku sNazwaParametru Parametr Wartosc)
	(ssp:ZmienParametryAtrybutuBlokuSet sNazwaBloku sNazwaParametru Parametr Wartosc)
)

(defun ssp:ParametrOn (sNazwaBloku sNazwaParametru)
	(ssp:ZmienParametryAtrybutuBloku sNazwaBloku sNazwaParametru 0)
)

(defun ssp:ParametrOff (sNazwaBloku sNazwaParametru)
	(ssp:ZmienParametryAtrybutuBloku sNazwaBloku sNazwaParametru 1)
)

(defun ssp:ParametrListaOn ( aLista sNazwa )
	(setq iIloscBlokow (length aLista))
	(setq i 0)
	(repeat iIloscBlokow
		(ssp:ParametrOn (nth i aLista) sNazwa)
		(setq i (+ i 1))
	)
	(print)
)	
	
(defun ssp:ParametrListaOff ( aLista sNazwa )
	(setq iIloscBlokow (length aLista))
	(setq i 0)
	(repeat iIloscBlokow
		(ssp:ParametrOff (nth i aLista) sNazwa)
		(setq i (+ i 1))
	)
)	


	
	


(defun ssp:test ()
	(setq ssCzujki (ssget "X" '( (0 . "INSERT") )))
	(setq liczbaBlokow (sslength ssCzujki))
	(print ssCzujki)
	
	(setq i 0)
	(setq rop 0)
	(repeat liczbaBlokow
		(progn
			(setq blok (entget (ssname ssCzujki i)))
		
			(setq nazwa (cdr (assoc 2 blok)))
			(setq handle (cdr (assoc 5 blok)))
			(setq punkt (cdr (assoc 10 blok)))
			(setq kat (cdr (assoc 50 blok)))
			
			(setq x (nth 0 punkt))
			(setq y (nth 1 punkt))

			(setq nrplan (ssp:AtrybutPobierzDXF (ssname ssCzujki i) "owa_obwod"))
			(setq nrcentrala (ssp:AtrybutPobierzDXF (ssname ssCzujki i) "owa_nr"))
			
			(print (strcat nazwa ", " (rtos x) ", " (rtos y) ", " handle ", " (angtos kat) ", " nrplan ", " nrcentrala))
			
			
;			(if (= nazwa blockname)
;				(progn
;					(ChangeBlockAttribDXF (cdr (assoc -1 blok)) attrname attrvalue)
;				)
;			)

			(setq i (+ i 1))
		)
	)
	
;	(print liczbaBlokow "rop=" rop)
	(print)
)	


(defun ssp:AtrybutPobierzDXF ( blok nazwa / end enx )
;	(setq blk (cdr (assoc -1 (entget (car blok)))))

	(setq blk blok)
	
	(while
        (and
            (null end)
            (= "ATTRIB" (cdr (assoc 0 (setq enx (entget (setq blk (entnext blk)))))))
        )
		
        (if (= (strcase nazwa) (strcase (cdr (assoc 2 enx))))
			(setq wynik (cdr (assoc 1 enx)))

        )
    )
	wynik
)


(defun LM:vl-setattributevalue ( blk tag val )
    (setq tag (strcase tag))
    (vl-some
       '(lambda ( att )
            (if (= tag (strcase (vla-get-tagstring att)))
                (progn (vla-put-textstring att val) val)
            )
        )
        (vlax-invoke blk 'getattributes)
    )
)


(defun ssp:AtrybutUstawDXF ( blok nazwa wartosc / end enx )
;	(setq blk (cdr (assoc -1 (entget (car blok)))))

	(setq blk blok)
	
	(while
        (and
            (null end)
            (= "ATTRIB" (cdr (assoc 0 (setq enx (entget (setq blk (entnext blk)))))))
        )
		
        (if (= (strcase nazwa) (strcase (cdr (assoc 2 enx))))
			;(setq wynik (cdr (assoc 1 enx)))
			(setq wynik enx)
        )
    )
	(setq Ost_Popr_List (subst (cons 1 wartosc) (assoc 1 wynik) wynik))
	(entmod Ost_Popr_List)
)


(defun ssp:PobierzListeElementow (lista)
	(setq ssCzujki (ssget "X" '( (0 . "INSERT") )))
	(setq liczbaBlokow (sslength ssCzujki))
	
	(setq i 0)

	(repeat liczbaBlokow
		(progn
			(setq blok (entget (ssname ssCzujki i)))
		
			(setq nazwa (cdr (assoc 2 blok)))
			(setq handle (cdr (assoc 5 blok)))
			(setq punkt (cdr (assoc 10 blok)))
			(setq kat (cdr (assoc 50 blok)))
			
			(setq x (nth 0 punkt))
			(setq y (nth 1 punkt))

			(setq nrplan (ssp:AtrybutPobierzDXF (ssname ssCzujki i) "plan"))
			(setq nrcentrala (ssp:AtrybutPobierzDXF (ssname ssCzujki i) "centrala"))
			
			(setq iLiczbaSystemow (length lista))
			(setq j 0)
			(repeat iLiczbaSystemow
				(if (= (nth j lista) nazwa)
					(print (strcat nazwa ", " (rtos x) ", " (rtos y) ", " handle ", " (angtos kat) ", " nrplan ", " nrcentrala))
				)
				(setq j (+ j 1))
			)

			(setq i (+ i 1))
		)
	)
	
	(print)
)	


; ***********************************************************************************************************************************
; *
; * SEKCJA EKSPERYMENTALNA - START
; * 
; ***********************************************************************************************************************************

(defun ssp:AtrybutParametrZmien (blockname attrname NumerParametru Wartosc / i intBlockCount)
	(setq ssCzujki (ssget "X" '( (0 . "INSERT") )))
	(setq liczbaBlokow (sslength ssCzujki))
	
	(setq i 0)
	(setq rop 0)
	(repeat liczbaBlokow
		(progn
			(setq blok (entget (ssname ssCzujki i)))
			(setq nazwa (cdr (assoc 2 blok)))

			(if (= nazwa blockname)
				(progn
					(ssp:AtrybutParametrZmienDXF (cdr (assoc -1 blok)) attrname NumerParametru Wartosc)
				)
			)

			(setq i (+ i 1))
		)
	)
)

(defun ssp:AtrybutParametrZmienLista ( aLista sNazwa NumerParametru Wartosc)
	(setq iIloscBlokow (length aLista))
	(setq i 0)
	(repeat iIloscBlokow
		(ssp:AtrybutParametrZmien (nth i aLista) sNazwa NumerParametru Wartosc)
		(setq i (+ i 1))
	)
	(print)
)

(defun ssp:AtrybutParametrZmienDXF ( blk attrib NumerParametru Wartosc / end enx )
    (while
        (and
            (null end)
            (= "ATTRIB" (cdr (assoc 0 (setq enx (entget (setq blk (entnext blk)))))))
        )
        (if (= (strcase attrib) (strcase (cdr (assoc 2 enx))))
			(progn 
				(print enx)
				(if (entmod (subst (cons NumerParametru Wartosc) (assoc NumerParametru enx) enx))
					(progn
						(entupd blk)
						(setq end val)
					)
				)
			)
        )
    )
)

; ***********************************************************************************************************************************
; *
; * SEKCJA EKSPERYMENTALNA - STOP
; *
; ***********************************************************************************************************************************


(ssp:WczytajSystemy)