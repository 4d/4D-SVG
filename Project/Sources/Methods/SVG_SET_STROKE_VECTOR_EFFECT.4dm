//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_SET_STROKE_VECTOR_EFFECT
  // Database: 4D SVG
  // ID[DF7B46A6912E4733857DFF50A77FE3D7]
  // Created #29-7-2019 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Value:  non-scaling-stroke | none | inherit
  // Initial:  none
  // Applies to:  graphics elements
  // Inherited:  no
  // ----------------------------------------------------
  // The SVG_SET_STROKE_VECTOR_EFFECT command is use to set the stroke-vector-effect
  // attribute value of a graphic element. If svgObject is not the reference of a
  // graphic element, an error is generated. If the attribute already exists, its
  // value is replaced.
  // The optional value parameter indicates the value to be used for the attribute.
  // If this parameter is omitted, the attribute is removed.
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)

C_TEXT:C284($Dom_object;$Txt_Name)

If (False:C215)
	C_TEXT:C284(SVG_SET_STROKE_VECTOR_EFFECT ;$1)
	C_TEXT:C284(SVG_SET_STROKE_VECTOR_EFFECT ;$2)
End if 

  // ----------------------------------------------------
If (Count parameters:C259>=1)
	
	  // Required parameters
	$Dom_object:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_object);Get localized string:C991("error_badReference")))
		
		DOM GET XML ELEMENT NAME:C730($Dom_object;$Txt_Name)
		
		ARRAY TEXT:C222($tTxt_objects;0x0000)
		COLLECTION TO ARRAY:C1562(Storage:C1525.svg["graphics"];$tTxt_objects)
		
		If (Find in array:C230($tTxt_objects;$Txt_Name)>0)
			
			If (Count parameters:C259>=2)
				
				ARRAY TEXT:C222($tTxt_values;0x0000)
				COLLECTION TO ARRAY:C1562(Storage:C1525.svg["vector-effect"];$tTxt_values)
				$tTxt_values{0}:=$2
				
				If (Find in array:C230($tTxt_values;$tTxt_values{0})>0)
					
					Component_errorHandler ("init";Current method name:C684)
					
					DOM SET XML ATTRIBUTE:C866($Dom_object;\
						"vector-effect";$tTxt_values{0})
					
					ASSERT:C1129(Component_errorHandler ("deinit"))
					
				Else 
					
					ASSERT:C1129(Component_putError (8857;Current method name:C684))  // Invalid Value for an Argument
					
				End if 
				
			Else 
				
				  // Remove
				Component_errorHandler ("ERROR_OFF")
				DOM REMOVE XML ATTRIBUTE:C1084($Dom_object;"vector-effect")
				Component_errorHandler ("ERROR_ON")
				
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8854;Current method name:C684))  // Impossible to apply this Command for this Node
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;Current method name:C684))  // The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  // Parameters Missing
	
End if 

  // ----------------------------------------------------
  // Return
  // <NONE>
  // ----------------------------------------------------
  // End