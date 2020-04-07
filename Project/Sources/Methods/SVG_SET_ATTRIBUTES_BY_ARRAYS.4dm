//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_ATTRIBUTES_BY_ARRAYS
  // Created 21/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_POINTER:C301($2)
C_POINTER:C301($3)

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($kTxt_currentMethod;$Txt_objectID;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_SET_ATTRIBUTES_BY_ARRAYS ;$1)
	C_POINTER:C301(SVG_SET_ATTRIBUTES_BY_ARRAYS ;$2)
	C_POINTER:C301(SVG_SET_ATTRIBUTES_BY_ARRAYS ;$3)
End if 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=3)
	
	$Txt_objectID:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		For ($Lon_i;1;Size of array:C274($2->);1)
			
			If (Size of array:C274($3->)>=$Lon_i)
				
				  // #26-8-2014
				  // store non valid value as CDATA
				  // http://forums.4d.fr/Post/FR/15125439/1/15129432#15129432
				  //DOM SET XML ATTRIBUTE($Txt_objectID;$2->{$Lon_i};$3->{$Lon_i})
				$Txt_value:=$3->{$Lon_i}
				
				  // escape the invalid characters
				  //ACI0092966
				  //$Txt_value:=Replace string($Txt_value;"&";"&amp;")
				  //$Txt_value:=Replace string($Txt_value;"<";"&lt;")
				  //$Txt_value:=Replace string($Txt_value;"'";"&apos;")
				  //$Txt_value:=Replace string($Txt_value;"\\\"";"&quot;")
				$Txt_value:=Replace string:C233($Txt_value;"\"";"'")
				$Txt_value:=Replace string:C233($Txt_value;"&";"&amp;")
				$Txt_value:=Replace string:C233($Txt_value;"<";"&lt;")
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					$2->{$Lon_i};$Txt_value)
				
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					$2->{$Lon_i};"")
				
			End if 
		End for 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 