//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_ADD_NAMESPACE
  // ID[6B8569F99C4B44F488A9EFBEAB2CBE0A]
  // Created 04/07/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // SVG_ADD_NAME_SPACE ( svg_ref ; prefix {; URI })
  // Adds xmlns attribute to the root of the DOM tree (xmlns:prefix="URI")
  // If svg_ref is not the reference of an element "svg" the attribute is added to the root of the tree.
  // Prefix could be a constant :
  //        svgNS for the standard SVG namespace. (http:  //www.w3.org/2000/svg)
  //        xlinkNS for the standard XLink namespace. (http:  //www.w3.org/1999/xlink)
  // If prefix is not a constant, URI is mandatory otherwise an error is generated
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_name;$Txt_prefix;$Txt_URI)

If (False:C215)
	C_TEXT:C284(SVG_ADD_NAMESPACE ;$1)
	C_TEXT:C284(SVG_ADD_NAMESPACE ;$2)
	C_TEXT:C284(SVG_ADD_NAMESPACE ;$3)
End if 


  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_ADD_NAMESPACE"  //Nom methode courante

If (Asserted:C1132($Lon_parameters>=2;Get localized string:C991("error_missingParameter")))
	
	$Dom_svgObject:=$1
	$Txt_prefix:=$2
	
	Case of 
			
			  //______________________________________________________
		: ($Txt_prefix="svgNS")  //The standard SVG namespace.
			
			$Txt_prefix:="xmlns"
			$Txt_URI:="http://www.w3.org/2000/svg"
			
			  //______________________________________________________
		: ($Txt_prefix="xlinkNS")  //The standard XLink namespace.
			
			$Txt_prefix:="xmlns:xlink"
			$Txt_URI:="http://www.w3.org/1999/xlink"
			
			  //______________________________________________________
		: ($Txt_prefix="4dNS")  //The ns4d namespace.
			
			$Txt_prefix:="xmlns:ns4d"
			$Txt_URI:="http://www.4d.com"
			
			  //______________________________________________________
		: ($Lon_parameters<3)
			
			ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
			
			  //______________________________________________________
		Else 
			
			$Txt_prefix:=Choose:C955(Position:C15("xmlns:";$2)=1;$2;"xmlns:"+$2)
			$Txt_URI:=$3
			
			  //______________________________________________________
	End case 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

  // ----------------------------------------------------

If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	  //Be sure to be at the root
	DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
	
	If ($Txt_name#"svg")
		
		$Dom_svgObject:=DOM Get root XML element:C1053($Dom_svgObject)
		
	End if 
	
	If (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($Dom_svgObject;\
			$Txt_prefix;$Txt_URI)
		
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
	
End if 

  // ----------------------------------------------------
  // End