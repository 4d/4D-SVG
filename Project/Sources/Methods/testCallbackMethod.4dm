//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : testCallbackMethod
// Created 21/06/10 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($Txt_ID : Text)

var $kTxt_picture : Text
var $Lon_event; $Lon_i : Integer

$Lon_event:=Form event code:C388

$kTxt_picture:="viewerPicture"

Case of 
		
		//_________________________________
	: (Length:C16($Txt_ID)=0)
		
		For ($Lon_i; 1; 3; 1)
			
			SVG SET ATTRIBUTE:C1055(*; $kTxt_picture; "rec_"+String:C10($Lon_i); \
				"stroke"; "inherit")
			
		End for 
		
		//_________________________________
		
	: ($Lon_event=On Mouse Move:K2:35)
		
		// Boucle ($Lon_i;1;3;1)
		//
		// SVG FIXER ATTRIBUT(*;$kTxt_picture;"rec_"+Chaine($Lon_i);"stroke";"inherit")
		//
		// Fin de boucle
		//
		// SVG FIXER ATTRIBUT(*;$kTxt_picture;$Txt_ID;"stroke";"red")
		
		//_________________________________
	: ($Lon_event=On Clicked:K2:4)
		
		// ALERTE("id: "+$Txt_ID)
		
		SVG SET ATTRIBUTE:C1055(*; $kTxt_picture; $Txt_ID; \
			"filter"; "#Shadow")
		
		// SVG FIXER ATTRIBUT(*;$kTxt_picture;$Txt_ID;"class";"selected")
		//_________________________________
End case 