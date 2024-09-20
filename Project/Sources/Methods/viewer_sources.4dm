//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : viewer_sources
// Database: 4D SVG
// ID[B2753247FA10434DB463ECDA4C0B981C]
// Created #15-5-2013 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($sources : Text) : Text

Case of 
		
		//______________________________________________________
	: (Length:C16($sources)=0)\
		 | (Length:C16($sources)>MAXTEXTLENBEFOREV11:K35:3)
		
		//______________________________________________________
	: (Position:C15("xmlns:sodipodi"; $sources)>0)
		
		//______________________________________________________
	: (Position:C15("xmlns:inkscape"; $sources)>0)
		
		//______________________________________________________
	Else 
		
		$sources:=xmlColoredSyntax($sources)
		
		//________________________________________
End case 

//#ACI0086921
return $sources