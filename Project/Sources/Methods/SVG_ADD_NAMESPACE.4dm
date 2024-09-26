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
#DECLARE($svgObject : Text; $prefix : Text; $URI : Text)

var $CURRENT_METHOD; $name : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_ADD_NAMESPACE"

If (Asserted:C1132(Count parameters:C259>=2; Localized string:C991("error_missingParameter")))
	
	Case of 
			
			//______________________________________________________
		: ($prefix="svgNS")  // The standard SVG namespace.
			
			$prefix:="xmlns"
			$URI:="http://www.w3.org/2000/svg"
			
			//______________________________________________________
		: ($prefix="xlinkNS")  // The standard XLink namespace.
			
			$prefix:="xmlns:xlink"
			$URI:="http://www.w3.org/1999/xlink"
			
			//______________________________________________________
		: ($prefix="4dNS")  // The ns4d namespace.
			
			$prefix:="xmlns:ns4d"
			$URI:="http://www.4d.com"
			
			//______________________________________________________
		: (Count parameters:C259<3)
			
			ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
			
			//______________________________________________________
		Else 
			
			$prefix:=Position:C15("xmlns:"; $prefix)=1 ? $prefix : "xmlns:"+$prefix
			
			//______________________________________________________
	End case 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $CURRENT_METHOD))  // Parameters Missing
	
End if 

// ----------------------------------------------------

If (Asserted:C1132(xml_referenceValid($svgObject); Localized string:C991("error_badReference")))
	
	Component_errorHandler("init"; $CURRENT_METHOD)
	
	// Be sure to be at the root
	DOM GET XML ELEMENT NAME:C730($svgObject; $name)
	
	If ($name#"svg")
		
		$svgObject:=DOM Get root XML element:C1053($svgObject)
		
	End if 
	
	If (OK=1)
		
		DOM SET XML ATTRIBUTE:C866($svgObject; \
			$prefix; $URI)
		
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8852; $CURRENT_METHOD))  // The reference is not a svg object
	
End if 