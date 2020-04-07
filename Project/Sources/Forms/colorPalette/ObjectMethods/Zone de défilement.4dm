Case of 
		  //______________________________________________________
	: (Form event:C388=On Clicked:K2:4)
		  //LIRE POSITION CELLULE LISTBOX(◊tBoo_listbox;$Lon_column;$Lon_line)
		  //MouseX:=20
		  //MouseY:=14
		  //$Pic_Buffer:=◊tPic_Colors{$Lon_line}
		  //$Txt_id:=SVG Chercher ID element par coordonnees($Pic_Buffer;MouseX;MouseY)
		  //Si ($Txt_id#"")
		  //ALERTE($Txt_id)
		  //Fin de si 
		  //______________________________________________________
	: (False:C215)
		  //______________________________________________________
	Else 
		Color_main ("onDrag")
		  //______________________________________________________
End case 