//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : viewer_sources
  // Database: 4D SVG
  // ID[B2753247FA10434DB463ECDA4C0B981C]
  // Created #15-5-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Txt_sources)

If (False:C215)
	C_TEXT:C284(viewer_sources ;$0)
	C_TEXT:C284(viewer_sources ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Txt_sources:=$1
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: (Length:C16($Txt_sources)=0)\
		 | (Length:C16($Txt_sources)>MAXTEXTLENBEFOREV11:K35:3)
		
		  //______________________________________________________
	: (Position:C15("xmlns:sodipodi";$Txt_sources)>0)
		
		  //______________________________________________________
	: (Position:C15("xmlns:inkscape";$Txt_sources)>0)
		
		  //______________________________________________________
	Else 
		
		$Txt_sources:=xmlColoredSyntax ($Txt_sources)
		
		  //________________________________________
End case 

  //#ACI0086921
  //$0:="<span style='font-size:"+String(<>sourceFontSize)+"pt;'>"+$Txt_buffer+"</span>"
$0:=$Txt_sources

  // ----------------------------------------------------
  // End