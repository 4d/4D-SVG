//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_SET_DEFAULT_ENCODING
// Created 08/12/09 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($encoding : Text)

$encoding:=$encoding || "UTF-8"

ARRAY TEXT:C222($tTxt_characterEncoding; 0x0000)
COLLECTION TO ARRAY:C1562(Storage:C1525.svg["Character encoding"]; $tTxt_characterEncoding)

Case of 
		
		//……………………………………………………………………………
	: (Length:C16($encoding)=0)  // Restaure default
		
		Use (Storage:C1525.svg)
			
			Storage:C1525.svg.encoding:="UTF-8"
			
		End use 
		
		//……………………………………………………………………………
	: (Find in array:C230($tTxt_characterEncoding; $encoding)>0)
		
		Use (Storage:C1525.svg)
			
			Storage:C1525.svg.encoding:=$encoding
			
		End use 
		
		//……………………………………………………………………………
	Else 
		
		ASSERT:C1129(Component_putError(8857; Current method name:C684))  // Invalid Value for an Argument
		
		//……………………………………………………………………………
End case 

// #ACI0091143
CLEAR VARIABLE:C89($tTxt_characterEncoding)