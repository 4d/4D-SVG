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
C_TEXT:C284($0)
C_REAL:C285($1)
C_REAL:C285($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_BOOLEAN:C305($5)
C_LONGINT:C283($6)

C_BOOLEAN:C305($Boo_viewBox)
C_LONGINT:C283($Lon_parameters;$Lon_preserveAspectRatio)
C_REAL:C285($Num_height;$Num_width)
C_TEXT:C284($kTxt_currentMethod;$Txt_buffer;$Txt_description;$Txt_metaData;$Txt_nodeReference;$Txt_rootReference)
C_TEXT:C284($Txt_title)

If (False:C215)
	C_TEXT:C284(SVG_New ;$0)
	C_REAL:C285(SVG_New ;$1)
	C_REAL:C285(SVG_New ;$2)
	C_TEXT:C284(SVG_New ;$3)
	C_TEXT:C284(SVG_New ;$4)
	C_BOOLEAN:C305(SVG_New ;$5)
	C_LONGINT:C283(SVG_New ;$6)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New"  // Nom methode courante

If ($Lon_parameters>=2)  // Predefined width & height
	
	$Num_width:=$1
	$Num_height:=$2
	
	If ($Lon_parameters>=3)  // Document title
		
		$Txt_title:=$3
		
		If ($Lon_parameters>=4)  // Document description
			
			$Txt_description:=$4
			
			If ($Lon_parameters>=5)  // ViewBox
				
				$Boo_viewBox:=$5
				
				If ($Lon_parameters>=6)  // PreserveAspectRatio
					
					$Lon_preserveAspectRatio:=$6
					
				End if 
			End if 
		End if 
	End if 
End if 

Component_errorHandler ("init";$kTxt_currentMethod)

$Txt_rootReference:=DOM Create XML Ref:C861("svg";"http://www.w3.org/2000/svg")

If (OK=1)
	
	DOM SET XML DECLARATION:C859($Txt_rootReference;Storage:C1525.svg.encoding;True:C214)
	XML SET OPTIONS:C1090($Txt_rootReference;XML indentation:K45:34;2-Num:C11(Storage:C1525.svg.options ?? 5))
	
End if 

If (OK=1)
	
	If (Storage:C1525.svg.options ?? 16)
		
		  // Add the xmlns:link
		DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
			"xmlns:xlink";"http://www.w3.org/1999/xlink")
		
	End if 
End if 

Case of 
		
		  //______________________________________________________
	: (OK=0)
		
		  //______________________________________________________
	: (SVG_Lon_Error#0)\
		 | ($Txt_rootReference="0000000000000000")
		
		OK:=0
		
		  //______________________________________________________
	Else 
		
		If (Not:C34(Storage:C1525.svg.options ?? 8))
			
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"viewport-fill";"white")
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"viewport-fill-opacity";1)
			
		End if 
		
		If (Storage:C1525.svg.options ?? 11)
			
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"shape-rendering";"crispEdges")
			
		End if 
		
		  // Dimensions {
		If ($Num_width>0)
			
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"width";String:C10($Num_width;"&xml"))
			
			If (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
					"height";String:C10($Num_height;"&xml"))
				
			End if 
		End if 
		  //}
		
		  // ViewBox {
		If (OK=1)\
			 & ($Boo_viewBox)
			
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
				"viewBox";"0 0 "+String:C10($Num_width;"&xml")+" "+String:C10($Num_height;"&xml"))
			
		End if 
		  //}
		
		  // PreserveAspectRatio {
		Case of 
				
				  //______________________________________________________
			: (OK=0)
				
				  //______________________________________________________
			: ($Lon_preserveAspectRatio=0)
				
				  //______________________________________________________
			: ($Lon_preserveAspectRatio=Scaled to fit:K6:2)
				
				DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
					"preserveAspectRatio";"none")
				
				  //______________________________________________________
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Txt_rootReference;\
					"preserveAspectRatio";"xMidYMid")
				
				  //______________________________________________________
		End case 
		  //}
		
		  // Title {
		If (OK=1)\
			 & (Length:C16($Txt_title)>0)
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_rootReference;"/svg/title")
			
			If (OK=1)
				
				DOM SET XML ELEMENT VALUE:C868($Txt_nodeReference;$Txt_title)
				
			End if 
		End if 
		  //}
		
		  // Desc {
		If (OK=1)\
			 & (Length:C16($Txt_description)>0)
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_rootReference;"/svg/desc")
			
			If (OK=1)
				
				DOM SET XML ELEMENT VALUE:C868($Txt_nodeReference;$Txt_description)
				
			End if 
		End if 
		  //}
		
		  // 4D tag line {
		If (OK=1)\
			 & (Structure file:C489#Structure file:C489(*))
			
			$Txt_metaData:=DOM Create XML element:C865($Txt_rootReference;"metadata";\
				"xmlns";"http://www.4D.com/4DSVG")
			
			If (OK=1)
				
				$Txt_nodeReference:=DOM Create XML element:C865($Txt_metaData;"generator")
				
				If (OK=1)
					
					DOM SET XML ELEMENT VALUE:C868($Txt_nodeReference;Storage:C1525.svg.generator)
					
					If (OK=1)
						
						$Txt_nodeReference:=DOM Create XML element:C865($Txt_metaData;"about")
						
						If (OK=1)
							
							DOM SET XML ELEMENT VALUE:C868($Txt_nodeReference;"4D SVG is the quintessential vector drawing tool for 4D developers.")
							
							If (OK=1)
								
								$Txt_nodeReference:=DOM Create XML element:C865($Txt_metaData;"generation")
								
								If (OK=1)
									
									XML SET OPTIONS:C1090($Txt_nodeReference;XML date encoding:K45:24;XML UTC:K45:28)
									XML SET OPTIONS:C1090($Txt_nodeReference;XML time encoding:K45:30;XML duration:K45:33)
									
									DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
										"system";Storage:C1525.svg.system;\
										"date";Current date:C33;\
										"time";Current time:C178)
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		  //}
		
		  // Defs {
		If (OK=1)
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_rootReference;"/svg/defs";\
				"id";"4D")
			
			If (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"id";"4D")
				
			End if 
		End if 
		  //}
		
		  //______________________________________________________
End case 

If (OK=1)
	
	  // Store the reference {
	Use (Storage:C1525.svg)
		
		If (Storage:C1525.svg.docs=Null:C1517)
			
			Storage:C1525.svg.docs:=New shared collection:C1527
			
		End if 
		
		Storage:C1525.svg.docs.push($Txt_rootReference)
		
	End use 
	  //}
	
	$0:=$Txt_rootReference
	
Else 
	
	  // Keep the error {
	ASSERT:C1129(Component_errorHandler ("keep"))
	  //}
	
End if 

ASSERT:C1129(Component_errorHandler ("deinit"))