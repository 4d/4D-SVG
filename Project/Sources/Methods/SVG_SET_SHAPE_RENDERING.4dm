//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SET_SHAPE_RENDERING
  // Created 08/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // http://www.yoyodesign.org/doc/w3c/svg1/painting.html#ShapeRenderingProperty
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_object;$kTxt_currentMethod;$Txt_Name;$Txt_rendering)

If (False:C215)
	C_TEXT:C284(SVG_SET_SHAPE_RENDERING ;$1)
	C_TEXT:C284(SVG_SET_SHAPE_RENDERING ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SET_SHAPE_RENDERING"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Dom_object:=$1
	$Txt_rendering:=$2
	
	If (Asserted:C1132(xml_referenceValid ($Dom_object);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_object;$Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["shapes"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			  //#ACI0093130
			  //change "optimize-speed" to "optimizeSpeed" into the list "shape-rendering"
			ARRAY TEXT:C222($tTxt_shapeRendering;0x0000)
			COLLECTION TO ARRAY:C1562(Storage:C1525.svg["shape-rendering"];$tTxt_shapeRendering)
			
			Case of 
					
					  //……………………………………………………………………………
				: (Length:C16($Txt_rendering)=0)
					
					Component_errorHandler ("ERROR_OFF")
					DOM REMOVE XML ATTRIBUTE:C1084($Dom_object;"shape-rendering")
					Component_errorHandler ("ERROR_ON")
					
					  //……………………………………………………………………………
				: (Find in array:C230($tTxt_shapeRendering;$Txt_rendering)>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_object;\
						"shape-rendering";$Txt_rendering)
					
					  //……………………………………………………………………………
				Else 
					
					ASSERT:C1129(Component_putError (8857;$kTxt_currentMethod))  //Invalid Value for an Argument
					
					  //……………………………………………………………………………
			End case 
			
			  //#ACI0091143
			CLEAR VARIABLE:C89($tTxt_shapeRendering)
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854;$kTxt_currentMethod))  //Impossible to apply this Command for this Node
			
		End if 
		
		  //#ACI0091143
		CLEAR VARIABLE:C89($tTxt_objects)
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 