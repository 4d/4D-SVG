//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_VIEWPORT_FILL
  // Created 12/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //The SVG_SET_VIEWPORT_FILL command can be used to set the background color of an SVG document having the svgObject reference.
  //If this attribute already exists, its value is replaced by the value passed as parameter.
  //If svgObject is an SVG element that does not accept this attribute, an error is generated.
  //
  // Scalable Vector Graphics (SVG) Tiny 1.2 Specification
  // http://www.w3.org/TR/SVGMobile12/index.html
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (18/11/11)
  // fix : If parameter opacity was set to 0, it was interpreted as 100%
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)
C_LONGINT:C283($3)

C_LONGINT:C283($Lon_opacity;$Lon_parameters;$Lon_x)
C_TEXT:C284($kTxt_currentMethod;$Txt_color;$Txt_name;$Txt_objectID)

If (False:C215)
	C_TEXT:C284(SVG_SET_VIEWPORT_FILL ;$1)
	C_TEXT:C284(SVG_SET_VIEWPORT_FILL ;$2)
	C_LONGINT:C283(SVG_SET_VIEWPORT_FILL ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_VIEWPORT_FILL"  //Nom methode courante

If ($Lon_parameters>=1)
	
	$Lon_opacity:=-1
	
	$Txt_objectID:=$1
	
	If ($Lon_parameters>=2)
		
		$Txt_color:=$2
		
		If ($Lon_parameters>=3)
			
			$Lon_opacity:=$3
			
		End if 
	End if 
	
	If (Length:C16($Txt_color)>0)
		
		If (Asserted:C1132(xml_referenceValid ($Txt_objectID);Get localized string:C991("error_badReference")))
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			DOM GET XML ELEMENT NAME:C730($Txt_objectID;$Txt_name)
			
			If (Position:C15($Txt_name+"|";"svg|animation|image|video|")>0)
				
				  //The optional color parameter indicates the color to be used for the picture background.
				  //If this parameter is omitted or contains an empty string, white will be used.
				
				$Lon_x:=Position:C15(":";$Txt_color)
				
				If ($Lon_x>0)
					
					$Lon_opacity:=Num:C11(Substring:C12($Txt_color;$Lon_x+1))
					$Txt_color:=Substring:C12($Txt_color;1;$Lon_x-1)
					
				End if 
				
				Case of 
						
						  //______________________________________________________
					: (Length:C16($Txt_color)=0)  // default: white
						
						$Txt_color:="white"
						
						  //______________________________________________________
					: ($Txt_color="url(@")
						
						  //______________________________________________________
					Else 
						
						$Txt_color:=Lowercase:C14($Txt_color)
						
						  //______________________________________________________
				End case 
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"viewport-fill";$Txt_color)
				
				If (OK=1)
					
					  //The optional opacity parameter can be used to specify the value of the percentage of opacity to be applied to this fill.
					  //If this parameter is omitted or if no opacity has been specified for the document, the value 100% is used.
					
					If ($Lon_opacity=-1)
						
						Component_errorHandler ("ERROR_OFF")
						DOM GET XML ATTRIBUTE BY NAME:C728($Txt_objectID;"viewport-fill-opacity";$Lon_opacity)
						Component_errorHandler ("ERROR_ON")
						
						$Lon_opacity:=Choose:C955($Lon_opacity>0;$Lon_opacity*100;100)
						
					End if 
				End if 
				
				DOM SET XML ATTRIBUTE:C866($Txt_objectID;\
					"viewport-fill-opacity";$Lon_opacity/100)
				
			Else 
				
				ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
				
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
			
		End if 
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 