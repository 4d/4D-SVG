//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_DEFINE_STYLE_WITH_ARRAYS
  // ID[AA4F52ED75B64039B44EF9B59A0D05B1]
  // Created 20/06/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Allows style definition with 2 arrays: attribute's names and attribute's values.
  // If the svgObjectReference is the root, the style is defined as a style element in the def section (Internal Style Sheet). In this case the className parameter is mandatory (error if not)
  // The line "SVG_Define_style_with_arrays ($Root->$tTxt_attributeNames;->$tTxt_attributeValues;"title")" will give:
  //       <defs id="4D">
  //            <style type="text/css">.title{fill:black;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;}</style>
  //       </defs>
  // The style will then be assigned to an element with SVG_SET_CLASS ( $elementRef ; "title")
  // If the svgObjectReference is an element, the style is defined as a style attribute for this element (Inline Style).
  // The line "SVG_Define_style_with_arrays ($elementRef; ->$tTxt_attributeNames; ->$tTxt_attributeValues)" will give:
  //       <element style="fill:black;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;"…>…</element>
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_POINTER:C301($2)
C_POINTER:C301($3)
C_TEXT:C284($4)
C_TEXT:C284($5)
C_TEXT:C284($6)
C_TEXT:C284($7)

C_BOOLEAN:C305($Boo_inline)
C_LONGINT:C283($Lon_i;$Lon_parameters)
C_POINTER:C301($Ptr_attributes;$Ptr_values)
C_TEXT:C284($Dom_defs;$Dom_root;$Dom_style;$kTxt_currentMethod;$Txt_class;$Txt_ID)
C_TEXT:C284($Txt_media;$Txt_style;$Txt_svgObject;$Txt_title;$Txt_type)

If (False:C215)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS ;$0)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS ;$1)
	C_POINTER:C301(SVG_DEFINE_STYLE_WITH_ARRAYS ;$2)
	C_POINTER:C301(SVG_DEFINE_STYLE_WITH_ARRAYS ;$3)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS ;$4)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS ;$5)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS ;$6)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS ;$7)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Define_style"  //Nom methode courante

If (Asserted:C1132($Lon_parameters>=3;Get localized string:C991("error_missingParameter")))
	
	$Txt_svgObject:=$1
	
	$Ptr_attributes:=$2
	$Ptr_values:=$3
	
	$Txt_type:="text/css"
	
	If ($Lon_parameters>=4)
		
		$Txt_class:=$4
		
		If ($Lon_parameters>=5)
			
			$Txt_type:=$5
			
			If ($Lon_parameters>=6)
				
				$Txt_media:=$6
				
				If ($Lon_parameters>=7)
					
					$Txt_title:=$7
					
				End if 
			End if 
		End if 
	End if 
	
	For ($Lon_i;1;Size of array:C274($Ptr_attributes->);1)
		
		$Txt_style:=$Txt_style+$Ptr_attributes->{$Lon_i}+":"+$Ptr_values->{$Lon_i}+";"
		
	End for 
	
	  //determine if it is an inline style {
	$Dom_root:=DOM Get root XML element:C1053($Txt_svgObject)
	$Boo_inline:=($Dom_root#$Txt_svgObject)
	  //}
	
	If (Not:C34($Boo_inline)\
		 & ($Lon_parameters<4))
		
		ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 

  // ----------------------------------------------------

Component_errorHandler ("init";$kTxt_currentMethod)

If ($Boo_inline)
	
	DOM SET XML ATTRIBUTE:C866($Txt_svgObject;\
		"style";$Txt_style)
	
Else 
	
	$Txt_style:="."+$Txt_class+"{"+$Txt_style+"}"
	
	  //Find the 'defs' node...
	$Dom_defs:=DOM Find XML element:C864($Dom_root;"svg/defs")
	
	  //create not exist.
	If (OK=0)
		
		$Dom_defs:=DOM Create XML element:C865($Dom_root;"defs")
		
	End if 
	
	If (OK=1)
		
		$Dom_style:=DOM Find XML element by ID:C1010($Dom_defs;$Txt_ID)
		
		If (OK=1)  //Delete the existing symbol
			
			DOM REMOVE XML ELEMENT:C869($Dom_style)
			
		End if 
	End if 
	
	  //Create the style
	$Dom_style:=DOM Create XML element:C865($Dom_defs;"style";\
		"type";$Txt_type)
	
	If (OK=1)
		
		DOM SET XML ELEMENT VALUE:C868($Dom_style;$Txt_style)
		
		If (OK=1)\
			 & (Length:C16($Txt_media)>0)
			
			ARRAY TEXT:C222($tTxt_medias;0x0000)
			COLLECTION TO ARRAY:C1562(Storage:C1525.svg["media"];$tTxt_medias)
			
			If (Find in array:C230($tTxt_medias;$Txt_media)>0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_style;\
					"media";$Txt_media)
				
			Else 
				
				ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
				
			End if 
			
			  //#ACI0091143
			CLEAR VARIABLE:C89($tTxt_medias)
			
		End if 
		
		If (OK=1)\
			 & (Length:C16($Txt_title)>0)
			
			DOM SET XML ATTRIBUTE:C866($Dom_style;\
				"title";$Txt_title)
			
		End if 
	End if 
	
	If (OK=1)
		
		$0:=$Dom_style
		
	End if 
End if 

ASSERT:C1129(Component_errorHandler ("deinit"))

  // ----------------------------------------------------
  // End