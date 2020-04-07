//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_GET_DEFAULT_BRUSHES
  // Created 21/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Return the default values for the fill and stroke colors
  // ----------------------------------------------------
C_POINTER:C301($1)
C_POINTER:C301($2)

C_LONGINT:C283($Lon_parameters)
C_POINTER:C301($Ptr_fillColor;$Ptr_strokeColor)
C_TEXT:C284($kTxt_currentMethod)

If (False:C215)
	C_POINTER:C301(SVG_GET_DEFAULT_BRUSHES ;$1)
	C_POINTER:C301(SVG_GET_DEFAULT_BRUSHES ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Ptr_strokeColor:=$1
	
	If (Type:C295($Ptr_strokeColor->)=Is text:K8:3)
		
		$Ptr_strokeColor->:=Storage:C1525.svg.strokeColor
		
		If ($Lon_parameters>=2)
			
			$Ptr_fillColor:=$2
			
			If (Type:C295($Ptr_fillColor->)=Is text:K8:3)
				
				$Ptr_fillColor->:=Storage:C1525.svg.fillColor
				
			Else 
				
				ASSERT:C1129(Component_putError (8851;$kTxt_currentMethod))  //Invalid Type for an Argument
				
			End if 
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8851;$kTxt_currentMethod))  //Invalid Type for an Argument
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 