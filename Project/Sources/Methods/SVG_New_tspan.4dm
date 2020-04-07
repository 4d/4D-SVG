//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_tspan
  // Created 18/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (04/07/11)
  // 1] now allowed with textArea
  // 2] Added alternative syntax to set embedded style
  // SVG_New_tspan($Dom_svg;"Hello World !"; x ; y ; style_definition)
  // ----------------------------------------------------
  // Description
  // Create a tspan node
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_TEXT:C284($5)
C_LONGINT:C283($6)
C_LONGINT:C283($7)
C_LONGINT:C283($8)
C_TEXT:C284($9)

C_LONGINT:C283($Lon_Aligment;$Lon_Font_Size;$Lon_opacity;$Lon_parameters;$Lon_Styles;$Lon_x)
C_REAL:C285($Num_interlining;$Num_stretch;$Num_x;$Num_y)
C_TEXT:C284($Dom_svgObject;$Dom_svgReference;$kTxt_currentMethod;$Txt_Color;$Txt_Font_Name;$Txt_Name)
C_TEXT:C284($Txt_style;$Txt_text)

If (False:C215)
	C_TEXT:C284(SVG_New_tspan ;$0)
	C_TEXT:C284(SVG_New_tspan ;$1)
	C_TEXT:C284(SVG_New_tspan ;$2)
	C_REAL:C285(SVG_New_tspan ;$3)
	C_REAL:C285(SVG_New_tspan ;$4)
	C_TEXT:C284(SVG_New_tspan ;$5)
	C_LONGINT:C283(SVG_New_tspan ;$6)
	C_LONGINT:C283(SVG_New_tspan ;$7)
	C_LONGINT:C283(SVG_New_tspan ;$8)
	C_TEXT:C284(SVG_New_tspan ;$9)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New_tspan"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Lon_Font_Size:=-1
	$Lon_Styles:=-1
	$Lon_Aligment:=-1
	$Num_interlining:=1
	$Num_stretch:=1
	$Num_x:=-1
	
	$Dom_svgObject:=$1
	$Txt_text:=$2  //String to write
	
	If ($Lon_parameters>=3)
		
		$Num_x:=Choose:C955($3=-1;0;$3)  //X position
		
		If ($Lon_parameters>=4)
			
			$Num_y:=Choose:C955($4=-1;0;$4)  //Y position
			
			If ($Lon_parameters>=5)
				
				If (Position:C15("{";$5)=1)  //Embedded style
					
					$Txt_style:=Replace string:C233(Substring:C12($5;2);"}";"")
					
				Else 
					
					$Txt_Font_Name:=$5  //Default is Time New Roman
					
					If ($Lon_parameters>=6)
						
						$Lon_Font_Size:=Choose:C955($6=-1;0;$6)  //Default is 12 pt
						
						If ($Lon_parameters>=7)
							
							$Lon_Styles:=$7  //Default is standard
							
							If ($Lon_parameters>=8)
								
								$Lon_Aligment:=$8  //Default is start (Left)
								
								If ($Lon_parameters>=9)
									
									$Txt_Color:=$9  //Front color
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	If (Length:C16($Txt_style)=0)
		
		$Lon_Font_Size:=Choose:C955($Lon_Font_Size=-1;12;$Lon_Font_Size)
		$Num_y:=$Num_y+$Lon_Font_Size
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_Name)
		
		If (Position:C15($Txt_name+"|";"text|tspan|textArea|")>0)
			
			$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject;"tspan")
			
			If (OK=1)
				
				If ($Lon_parameters>=3)\
					 & (($Num_x#0)\
					 | ($Num_y#0))
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"x";$Num_x;\
						"y";$Num_y)
					
				End if 
				
				If (Length:C16($Txt_style)>0)  //Embedded style
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"style";$Txt_style)
					
				Else 
					
					Case of   //font-family
							
							  //.....................................................
						: (OK=0)\
							 | (Length:C16($Txt_Font_Name)=0)
							
							  //.....................................................
						Else 
							
							$Txt_Font_Name:=fontReplaceArial ($Txt_Font_Name)
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"font-family";$Txt_Font_Name)
							
							  //.....................................................
					End case 
					
					Case of   //fill (color)
							
							  //.....................................................
						: (OK=0)\
							 | (Length:C16($Txt_Color)=0)
							
							  //.....................................................
						Else 
							
							$Lon_x:=Position:C15(":";$Txt_Color)
							
							If ($Lon_x>0)
								
								$Lon_opacity:=Num:C11(Substring:C12($Txt_Color;$Lon_x+1))
								$Txt_Color:=Lowercase:C14(Substring:C12($Txt_Color;1;$Lon_x-1))
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
									"fill";$Txt_Color)
								
								If (OK=1)
									
									DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
										"fill-opacity";$Lon_opacity/100)
									
								End if 
								
							Else 
								
								If ($Txt_Color="url(@")
									
									DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
										"fill";$Txt_Color)
									
								Else 
									
									DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
										"fill";Lowercase:C14($Txt_Color))
									
								End if 
							End if 
							
							  //.....................................................
					End case 
					
					Case of   //text-decoration, font-style & font-weight
							
							  //.....................................................
						: (OK=0)\
							 | ($Lon_Styles<0)
							
							  //.....................................................
						: ($Lon_Styles=0)
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"text-decoration";"none")
							
							If (OK=1)
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
									"font-style";"normal")
								
								If (OK=1)
									
									DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
										"font-weight";"normal")
									
								End if 
							End if 
							
							  //.....................................................
						Else 
							
							If ($Lon_Styles>=8)  //line-through
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
									"text-decoration";"line-through")
								$Lon_Styles:=$Lon_Styles-8
								
							End if 
							
							If ($Lon_Styles>=4)  //underline
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
									"text-decoration";"underline")
								$Lon_Styles:=$Lon_Styles-4
								
							End if 
							
							If ($Lon_Styles>=2)  //italic
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
									"font-style";"italic")
								$Lon_Styles:=$Lon_Styles-2
								
							End if 
							
							If ($Lon_Styles=1)  //bold
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
									"font-weight";"bold")
								
							End if 
							
							  //.....................................................
					End case 
					
					Case of   //font-size
							
							  //.....................................................
						: (OK=0)\
							 | ($Lon_Font_Size<=0)
							
							  //.....................................................
						Else 
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"font-size";$Lon_Font_Size)
							
							  //.....................................................
					End case 
					
					Case of   //text-anchor
							
							  //.....................................................
						: (OK=0)\
							 | ($Lon_Aligment<0)
							
							  //.....................................................
						: ($Lon_Aligment=Align center:K42:3)
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"text-anchor";"middle")
							
							  //.....................................................
						: ($Lon_Aligment=Align right:K42:4)
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"text-anchor";"end")
							
							  //.....................................................
						: ($Lon_Aligment=Align left:K42:2)
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"text-anchor";"start")
							
							  //.....................................................
						Else 
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
								"text-anchor";"inherit")
							
							  //.....................................................
					End case 
				End if 
				
				If (OK=1)
					
					  // 25-1-2017 - Encode special characters
					  // #ACI0097138
					  //$Txt_text:=xml_Escape_characters ($Txt_text)
					
					DOM SET XML ELEMENT VALUE:C868($Dom_svgReference;$Txt_text)
					
				End if 
				
				If (OK=1)
					
					  //Set the id
					If (Storage:C1525.svg.options ?? 1)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
							"id";$Dom_svgReference)
						
					End if 
					
					If (OK=1)
						
						$0:=$Dom_svgReference
						
					End if 
				End if 
			End if 
			
		Else 
			
			ASSERT:C1129(Component_putError (8854))  //Impossible to apply this Command for this Node
			
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 