wAktywnySystem : dialog { 
		label = "Aktywny system";
		
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
		
		: button {
			label = "Anuluj";
			mnemonic = "C";
			key = "Anuluj";
			is_cancel = true;
			width = 20;
			fixed_width = true;
			alignment = "center";
		}
}