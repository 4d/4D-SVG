//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_Get_class
  // Database: 4D SVG
  // ID[764215E82F134BE0A78F53FDB5AFC609]
  // Created 15-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // SVG_Get_class (object reference {; array text}) -> class
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_POINTER:C301($2)

C_LONGINT:C283($Lon_error;$Lon_parameters)
C_POINTER:C301($Ptr_classesNamesArray)
C_TEXT:C284($Dom_svgObject;$Txt_class;$Txt_Error_Method)

ARRAY TEXT:C222($tTxt_classes;0)

If (False:C215)
	C_TEXT:C284(SVG_Get_class ;$0)
	C_TEXT:C284(SVG_Get_class ;$1)
	C_POINTER:C301(SVG_Get_class ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Dom_svgObject:=$1
	
	If ($Lon_parameters>=2)
		
		$Ptr_classesNamesArray:=$2  //{array text} will be populated with all class names
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		$Txt_Error_Method:=Method called on error:C704
		ON ERR CALL:C155("xToolBox_NO_ERROR")
		DOM GET XML ATTRIBUTE BY NAME:C728($Dom_svgObject;"class";$Txt_class)
		ON ERR CALL:C155($Txt_Error_Method)
		
		If ($Lon_parameters>=2)
			
			If (Not:C34(Is nil pointer:C315($Ptr_classesNamesArray)))
				
				$Lon_error:=Rgx_SplitText (" ";$Txt_class;->$tTxt_classes)
				
				If ($Lon_error=0)
					
					  //%W-518.1
					COPY ARRAY:C226($tTxt_classes;$Ptr_classesNamesArray->)
					  //%W+518.1
					
				End if 
			End if 
		End if 
		
		$0:=$Txt_class  //class attribute
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;Current method name:C684))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  //Parameters Missing
	
End if 