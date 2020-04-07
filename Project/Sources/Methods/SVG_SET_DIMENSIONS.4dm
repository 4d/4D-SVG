//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_DIMENSIONS
  // Created 17/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_TEXT:C284($4)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_height;$Num_width)
C_TEXT:C284($kTxt_currentMethod;$Txt_objectID;$Txt_unit)

If (False:C215)
	C_TEXT:C284(SVG_SET_DIMENSIONS ;$1)
	C_REAL:C285(SVG_SET_DIMENSIONS ;$2)
	C_REAL:C285(SVG_SET_DIMENSIONS ;$3)
	C_TEXT:C284(SVG_SET_DIMENSIONS ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_DIMENSIONS"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Txt_objectID:=$1
	$Num_width:=$2
	
	$Num_height:=-1
	
	If ($Lon_parameters>=3)
		
		$Num_height:=$3
		
		If ($Lon_parameters>=4)
			
			$Txt_unit:=$4
			
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
		
		If (Position:C15($Txt_unit+"|";"px|pt|pc|cm|mm|in|%|")>0)  //True even if $Txt_unit is empty :-)
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			If ($Num_width#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"width";String:C10($Num_width;"&xml")+$Txt_unit)
				
			End if 
			
			If (OK=1)\
				 & ($Num_height#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"height";String:C10($Num_height;"&xml")+$Txt_unit)
				
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 