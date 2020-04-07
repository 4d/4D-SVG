//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_FONT_COLOR
  // Created 16/03/06, 10:07:53
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (10/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_fillOpacity;$Lon_parameters;$Lon_strokeOpacity;$Lon_x)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_fillColor;$Txt_Name;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_SET_FONT_COLOR ;$1)
	C_TEXT:C284(SVG_SET_FONT_COLOR ;$2)
	C_TEXT:C284(SVG_SET_FONT_COLOR ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_FONT_COLOR"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_fillColor:=$2
	$Txt_strokeColor:=$Txt_fillColor
	
	$Lon_fillOpacity:=-1
	$Lon_strokeOpacity:=-1
	
	If ($Lon_parameters>=3)
		
		$Txt_strokeColor:=$3
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		  //       ___________________
		  //  /   ACI0065701
		  // ||   Date 13/04/10
		  //(   ) Vincent de Lachaux
		  //       ___________________
		
		  //Si (Position($Txt_name+"|";"g|svg|text|tspan|")>0)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["text content element"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			  //       ___________________
			
			$Lon_x:=Position:C15(":";$Txt_fillColor)
			
			If ($Lon_x>0)
				
				$Lon_fillOpacity:=Num:C11(Substring:C12($Txt_fillColor;$Lon_x+1))
				$Txt_fillColor:=Lowercase:C14(Substring:C12($Txt_fillColor;1;$Lon_x-1))
				
			Else 
				
				  //Si ($Txt_fillColor#"url(@")
				  //$Txt_fillColor:=Minusc($Txt_fillColor)
				  //Fin de si
				
			End if 
			
			DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
				"fill";$Txt_fillColor)
			
			If (OK=1)\
				 & ($Lon_fillOpacity>0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
					"fill-opacity";$Lon_fillOpacity/100)
				
			End if 
			
			If (Length:C16($Txt_strokeColor)>0)
				
				$Lon_x:=Position:C15(":";$Txt_strokeColor)
				
				If ($Lon_x>0)
					
					$Lon_strokeOpacity:=Num:C11(Substring:C12($Txt_strokeColor;$Lon_x+1))
					$Txt_strokeColor:=Lowercase:C14(Substring:C12($Txt_strokeColor;1;$Lon_x-1))
					
				Else 
					
					If ($Txt_strokeColor#"url(@")
						
						$Txt_strokeColor:=Lowercase:C14($Txt_strokeColor)
						
					End if 
				End if 
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
					"stroke";$Txt_strokeColor)
				
				If (OK=1)\
					 & ($Lon_strokeOpacity>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
						"stroke-opacity";$Lon_strokeOpacity/100)
					
				End if 
				
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
					"stroke";$Txt_fillColor)
				
				If (OK=1)\
					 & ($Lon_fillOpacity>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
						"stroke-opacity";$Lon_fillOpacity/100)
					
				End if 
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 