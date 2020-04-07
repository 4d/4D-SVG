//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_GET_ATTRIBUTES
  // Created 23/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_POINTER:C301($2)
C_POINTER:C301($3)

C_LONGINT:C283($Lon_attributes;$Lon_i;$Lon_parameters)
C_POINTER:C301($Ptr_arrayNames;$Ptr_arrayValues)
C_TEXT:C284($kTxt_currentMethod;$Txt_nodeReference;$Txt_value)

If (False:C215)
	C_TEXT:C284(SVG_GET_ATTRIBUTES ;$1)
	C_POINTER:C301(SVG_GET_ATTRIBUTES ;$2)
	C_POINTER:C301(SVG_GET_ATTRIBUTES ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_GET_ATTRIBUTES"  // Current method name

If ($Lon_parameters>=3)
	
	$Txt_nodeReference:=$1
	$Ptr_arrayNames:=$2
	$Ptr_arrayValues:=$3
	
	If (Asserted:C1132(xml_referenceValid ($Txt_nodeReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Lon_attributes:=DOM Count XML attributes:C727($Txt_nodeReference)
		
		If (OK=1)
			
			  //%W-518.5
			ARRAY TEXT:C222($Ptr_arrayNames->;$Lon_attributes)
			ARRAY TEXT:C222($Ptr_arrayValues->;$Lon_attributes)
			  //%W+518.5
			
			For ($Lon_i;1;$Lon_attributes;1)
				
				  // #26-8-2014
				  // restore escaped characters
				  // http://forums.4d.fr/Post/FR/15125439/1/15129432#15129432
				  //DOM GET XML ATTRIBUTE BY INDEX($Txt_nodeReference;$Lon_i;$Ptr_arrayNames->{$Lon_i};$Ptr_arrayValues->{$Lon_i})
				DOM GET XML ATTRIBUTE BY INDEX:C729($Txt_nodeReference;$Lon_i;$Ptr_arrayNames->{$Lon_i};$Txt_value)
				
				  // ACI0092966
				  //$Txt_value:=Replace string($Txt_value;"'";"\"")
				$Txt_value:=Replace string:C233($Txt_value;"&quot;";"\\\"")
				$Txt_value:=Replace string:C233($Txt_value;"&apos;";"'")
				$Txt_value:=Replace string:C233($Txt_value;"&lt;";"<")
				$Txt_value:=Replace string:C233($Txt_value;"&amp;";"&")
				
				  //#ACI0094826 - remove carriage returns
				$Txt_value:=Replace string:C233($Txt_value;"\r";"")
				
				$Ptr_arrayValues->{$Lon_i}:=$Txt_value
				
				If (OK=0)
					
					$Lon_i:=MAXLONG:K35:2-1
					
				End if 
			End for 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  // The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  // Parameters Missing
	
End if 