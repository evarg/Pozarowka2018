wUstawieniaWidocznosciAtrybutow : dialog { 
		:row{
			width = 30;
			label = "Atrybut RAW";
			: button { 
				label="On";
				key="kRAWOn";
				width = 20;
				fixed_width = true;				
			}
			: button { 
				label="Off";
				key="kRAWOff";
				width = 20;
				fixed_width = true;				
			}
		}
		
		:row{
			label = "Atrybut CENTRALA";
			: button { 
				label="On";
				key="kCENTRALAOn";
				width = 20;
				fixed_width = true;				
			}
			: button { 
				label="Off";
				key="kCENTRALAOff";
				width = 20;
				fixed_width = true;				
			}
		}

		:row{
			label = "Atrybut PLAN";
			: button { 
				label="On";
				key="kPLANOn";
				width = 20;
				fixed_width = true;				
			}
			: button { 
				label="Off";
				key="kPLANOff";
				width = 20;
				fixed_width = true;				
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