//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_New
// Created 16/03/06, 10:07:53
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Modified by Vincent de Lachaux (16/04/08)
// 2004 -> v11
// ----------------------------------------------------
// Modified by Vincent de Lachaux (08/07/08)
// Added viewBox and preserveAspectRatio
// ----------------------------------------------------
#DECLARE($width : Real; $height : Real; $title : Text; $description : Text; $viewBox : Boolean; $preserveAspectRatio : Integer) : Text

var $CURRENT_METHOD; $node; $root; $Txt_metaData : Text

Compiler_SVG

$CURRENT_METHOD:="SVG_New"

Component_errorHandler("init"; $CURRENT_METHOD)

$root:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg")

If (Bool:C1537(OK))
	
	DOM SET XML DECLARATION:C859($root; Storage:C1525.svg.encoding; True:C214)
	XML SET OPTIONS:C1090($root; XML indentation:K45:34; 2-Num:C11(Storage:C1525.svg.options ?? 5))
	
End if 

If (Bool:C1537(OK))\
 && (Storage:C1525.svg.options ?? 16)
	
	// Add the xmlns:link
	DOM SET XML ATTRIBUTE:C866($root; \
		"xmlns:xlink"; "http://www.w3.org/1999/xlink")
	
End if 

Case of 
		
		//______________________________________________________
	: (Not:C34(Bool:C1537(OK)))
		
		// <NOTHING MORE TO DO>
		
		//______________________________________________________
	: (SVG_Lon_Error#0)\
		 | ($root="0000000000000000")
		
		OK:=0
		
		//______________________________________________________
	Else 
		
		If (Not:C34(Storage:C1525.svg.options ?? 8))
			
			DOM SET XML ATTRIBUTE:C866($root; \
				"viewport-fill"; "white")
			
			DOM SET XML ATTRIBUTE:C866($root; \
				"viewport-fill-opacity"; 1)
			
		End if 
		
		If (Storage:C1525.svg.options ?? 11)
			
			DOM SET XML ATTRIBUTE:C866($root; \
				"shape-rendering"; "crispEdges")
			
		End if 
		
		// Mark:-Dimensions
		If ($width>0)
			
			DOM SET XML ATTRIBUTE:C866($root; \
				"width"; String:C10($width; "&xml"))
			
			If (Bool:C1537(OK))
				
				DOM SET XML ATTRIBUTE:C866($root; \
					"height"; String:C10($height; "&xml"))
				
			End if 
		End if 
		
		// Mark:-ViewBox
		If (Bool:C1537(OK))\
			 && ($viewBox)
			
			DOM SET XML ATTRIBUTE:C866($root; \
				"viewBox"; "0 0 "+String:C10($width; "&xml")+" "+String:C10($height; "&xml"))
			
		End if 
		
		// Mark:-PreserveAspectRatio
		Case of 
				
				//______________________________________________________
			: (Not:C34(Bool:C1537(OK)))
				
				// <NOTHING MORE TO DO>
				
				//______________________________________________________
			: ($preserveAspectRatio=0)
				
				//______________________________________________________
			: ($preserveAspectRatio=Scaled to fit:K6:2)
				
				DOM SET XML ATTRIBUTE:C866($root; \
					"preserveAspectRatio"; "none")
				
				//______________________________________________________
			Else 
				
				DOM SET XML ATTRIBUTE:C866($root; \
					"preserveAspectRatio"; "xMidYMid")
				
				//______________________________________________________
		End case 
		
		// Mark:-Title
		
		If (Bool:C1537(OK))\
			 && (Length:C16($title)>0)
			
			$node:=DOM Create XML element:C865($root; "/svg/title")
			
			If (Bool:C1537(OK))
				
				DOM SET XML ELEMENT VALUE:C868($node; $title)
				
			End if 
		End if 
		
		// Mark:-Desc
		If (Bool:C1537(OK))\
			 && (Length:C16($description)>0)
			
			$node:=DOM Create XML element:C865($root; "/svg/desc")
			
			If (Bool:C1537(OK))
				
				DOM SET XML ELEMENT VALUE:C868($node; $description)
				
			End if 
		End if 
		
		// Mark:-4D tag line
		If (Bool:C1537(OK))\
			 & (Structure file:C489#Structure file:C489(*))
			
			$Txt_metaData:=DOM Create XML element:C865($root; "metadata"; \
				"xmlns"; "http://www.4D.com/4DSVG")
			
			If (Bool:C1537(OK))
				
				$node:=DOM Create XML element:C865($Txt_metaData; "generator")
				
				If (Bool:C1537(OK))
					
					DOM SET XML ELEMENT VALUE:C868($node; Storage:C1525.svg.generator)
					
					If (Bool:C1537(OK))
						
						$node:=DOM Create XML element:C865($Txt_metaData; "about")
						
						If (Bool:C1537(OK))
							
							DOM SET XML ELEMENT VALUE:C868($node; "4D SVG is the quintessential vector drawing tool for 4D developers.")
							
							If (Bool:C1537(OK))
								
								$node:=DOM Create XML element:C865($Txt_metaData; "generation")
								
								If (Bool:C1537(OK))
									
									XML SET OPTIONS:C1090($node; XML date encoding:K45:24; XML UTC:K45:28)
									XML SET OPTIONS:C1090($node; XML time encoding:K45:30; XML duration:K45:33)
									
									DOM SET XML ATTRIBUTE:C866($node; \
										"system"; Storage:C1525.svg.system; \
										"date"; Current date:C33; \
										"time"; Current time:C178)
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		
		// Mark:-Defs
		If (Bool:C1537(OK))
			
			$node:=DOM Create XML element:C865($root; "/svg/defs"; \
				"id"; "4D")
			
			If (Bool:C1537(OK))
				
				DOM SET XML ATTRIBUTE:C866($node; \
					"id"; "4D")
				
			End if 
		End if 
		
		//______________________________________________________
End case 

If (Bool:C1537(OK))
	
	// Store the reference
	pushReference($root)
	
	return $root
	
Else 
	
	// Keep the error
	ASSERT:C1129(Component_errorHandler("keep"))
	
End if 

ASSERT:C1129(Component_errorHandler("deinit"))