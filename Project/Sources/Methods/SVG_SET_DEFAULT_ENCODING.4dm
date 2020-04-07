//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_DEFAULT_ENCODING
  // Created 08/12/09 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_encoding)

If (False:C215)
	C_TEXT:C284(SVG_SET_DEFAULT_ENCODING ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

  // ----------------------------------------------------

If ($Lon_parameters>=1)
	
	$Txt_encoding:=$1
	
End if 

If (Length:C16($Txt_encoding)=0)
	
	$Txt_encoding:="UTF-8"
	
End if 

ARRAY TEXT:C222($tTxt_characterEncoding;0x0000)
COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Character encoding"];$tTxt_characterEncoding)

Case of 
		
		  //……………………………………………………………………………
	: (Length:C16($Txt_encoding)=0)  // Restaure default
		
		Use (Storage:C1525.svg)
			
			Storage:C1525.svg.encoding:="UTF-8"
			
		End use 
		
		  //……………………………………………………………………………
	: (Find in array:C230($tTxt_characterEncoding;$Txt_encoding)>0)
		
		Use (Storage:C1525.svg)
			Storage:C1525.svg.encoding:=$Txt_encoding
			
		End use 
		
		  //……………………………………………………………………………
	Else 
		
		ASSERT:C1129(Component_putError (8857;$kTxt_currentMethod))  // Invalid Value for an Argument
		
		  //……………………………………………………………………………
End case 

  //#ACI0091143
CLEAR VARIABLE:C89($tTxt_characterEncoding)