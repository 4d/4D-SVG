
BRING TO FRONT:C326(Current process:C322)

Case of 
		  //______________________________________________________
	: (Form event:C388=On Load:K2:1)
		  //C_IMAGE(◊SVG_aboutPicture)
		  //◊SVG_aboutPicture:=◊SVG_aboutPicture*0
		SET TIMER:C645(1)
		  //______________________________________________________
	: (Form event:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		  //$Txt_path:=Dossier 4D(Dossier Resources courant )+
		  //$Txt_path:=$Txt_path+"Images"+Séparateur dossier+"logoSVG.svg"
		  //
		  //LIRE FICHIER IMAGE($Txt_path;$Pic_buffer)
		  //CONVERTIR IMAGE($Pic_buffer;".png")
		  //TRANSFORMER IMAGE($Pic_buffer;Redimensionnement ;256;256)
		  //
		  //
		  //◊SVG_aboutPicture:=SVG_Picture_add_reflection ($Pic_buffer)
		  //______________________________________________________
	: (False:C215)
		  //______________________________________________________
	Else 
		  //______________________________________________________
End case 
