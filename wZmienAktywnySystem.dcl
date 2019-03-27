wZmienAktywnySystem : dialog { 
		label = "Wybor aktywnego systemu";

		:row{
			width = 30;
			label = "Aktywny system";
			: edit_box { 
				edit_limit = 30;
				edit_width = 30;
				key = "AktywnySystem";
				mnemonic = "D";
			}
		}
		
		:row{
			width = 30;
			label = "Bosch FPA-5000";
			: button { 
				label="Przelacz";
				key="bBOSCHFPA500";
				width = 20;
				fixed_width = true;				
			}
		}
		
		:row{
			width = 30;
			label = "EST-3";
			: button { 
				label="Przelacz";
				key="bEST3";
				width = 20;
				fixed_width = true;				
			}
		}

		:row{
			width = 30;
			label = "Polon-Alfa 4200";
			: button { 
				label="Przelacz";
				key="bPOLON4200";
				width = 20;
				fixed_width = true;				
			}
		}

		:row{
			width = 30;
			label = "Polon-Alfa 4900";
			: button { 
				label="Przelacz";
				key="bPOLON4900";
				width = 20;
				fixed_width = true;				
			}
		}

		:row{
			width = 30;
			label = "FP2000";
			: button { 
				label="Przelacz";
				key="bFP2000";
				width = 20;
				fixed_width = true;	
				alignment = "right";				
			}
		}

		: button {
			label = "Zamknij";
			mnemonic = "C";
			key = "Anuluj";
			is_cancel = true;
			width = 20;
			fixed_width = true;
			alignment = "center";
		}
}