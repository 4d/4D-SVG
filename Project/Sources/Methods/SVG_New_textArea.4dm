//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_New_textArea
// Created 23/01/08 by Vincent de Lachaux
// ----------------------------------------------------
// Modified by Vincent de Lachaux (08/12/09)
// v12 : Treat the carriage returns as elements "tbreak"
// ----------------------------------------------------
// Modified by Vincent de Lachaux (04/07/11)
// Added alternative syntax to set embedded style
// SVG_New_textArea($Dom_svg;"Hello World !"; x ; y ; width ; height ; style_definition)
// ----------------------------------------------------
// Modified by Vincent de Lachaux (05/07/11)
// Support for styled text
// ----------------------------------------------------
// Description
// Draw a text as textArea in a picture
// ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)
C_TEXT:C284($7)
C_LONGINT:C283($8)
C_LONGINT:C283($9)
C_LONGINT:C283($10)

C_LONGINT:C283($Lon_Font_Size; $Lon_fontAlignment; $Lon_fontStyles; $Lon_opacity; $Lon_parameters; $Lon_x)
C_REAL:C285($Num_height; $Num_width; $Num_x; $Num_y)
C_TEXT:C284($Dom_buffer; $Dom_source; $Dom_svgObject; $Dom_svgReference; $kTxt_currentMethod; $Txt_Buffer)
C_TEXT:C284($Txt_Color; $Txt_Font_Name; $Txt_style; $Txt_text)

If (False:C215)
	C_TEXT:C284(SVG_New_textArea; $0)
	C_TEXT:C284(SVG_New_textArea; $1)
	C_TEXT:C284(SVG_New_textArea; $2)
	C_REAL:C285(SVG_New_textArea; $3)
	C_REAL:C285(SVG_New_textArea; $4)
	C_REAL:C285(SVG_New_textArea; $5)
	C_REAL:C285(SVG_New_textArea; $6)
	C_TEXT:C284(SVG_New_textArea; $7)
	C_LONGINT:C283(SVG_New_textArea; $8)
	C_LONGINT:C283(SVG_New_textArea; $9)
	C_LONGINT:C283(SVG_New_textArea; $10)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New_textArea"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Lon_Font_Size:=-1
	$Lon_fontStyles:=-1
	$Lon_fontAlignment:=-1
	$Num_width:=-1
	$Num_height:=-1
	
	$Dom_svgObject:=$1
	$Txt_text:=$2  //String to write
	
	If (Storage:C1525.svg.options ?? 13)
		
		$Txt_text:=Replace string:C233($Txt_text; " "; Char:C90(0x2001))
		
	End if 
	
	If ($Lon_parameters>=3)
		
		$Num_x:=$3  //X position
		
		If ($Lon_parameters>=4)
			
			$Num_y:=$4  //Y position
			
			If ($Lon_parameters>=5)
				
				$Num_width:=$5
				
				If ($Lon_parameters>=6)
					
					$Num_height:=$6
					
					If ($Lon_parameters>=7)
						
						If (Position:C15("{"; $7)=1)  //Embedded style
							
							$Txt_style:=Replace string:C233(Substring:C12($7; 2); "}"; "")
							
						Else 
							
							$Txt_Font_Name:=$7  //Default is Time New Roman
							
							If ($Lon_parameters>=8)
								
								$Lon_Font_Size:=$8  //Default is 12 pt
								
								If ($Lon_parameters>=9)
									
									$Lon_fontStyles:=$9  //Default is standard
									
									If ($Lon_parameters>=10)
										
										$Lon_fontAlignment:=$10  //Default is start (Left)
										
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid($Dom_svgObject); Get localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		//#ACI0099523
		$Txt_text:=Replace string:C233($Txt_text; "\r\n"; "\r")
		
		//#ACI0093459
		//If (Position("<SPAN ";$Txt_text)>0)  //Styled text
		If (str_styledText($Txt_text))  //Styled text
			
			$Txt_Buffer:=Replace string:C233($Txt_text; "<SPAN"; "<tspan")
			$Txt_Buffer:=Replace string:C233($Txt_Buffer; "</SPAN>"; "</tspan>")
			$Txt_Buffer:=Replace string:C233($Txt_Buffer; "STYLE="; "style=")
			$Txt_Buffer:=Replace string:C233($Txt_Buffer; "color:"; "fill:")
			$Txt_Buffer:=Replace string:C233($Txt_Buffer; "<BR/>"; "<tbreak/>")
			$Txt_Buffer:="<svg xmlns='http://www.w3.org/2000/svg'><textArea>"+$Txt_Buffer+"</textArea></svg>"
			
			$Dom_buffer:=DOM Parse XML variable:C720($Txt_Buffer)
			
			If (OK=1)
				
				$Dom_source:=DOM Find XML element:C864($Dom_buffer; "/svg/textArea")
				
				If (OK=1)
					
					$Dom_svgReference:=DOM Append XML element:C1082($Dom_svgObject; $Dom_source)
					
				End if 
				
				DOM CLOSE XML:C722($Dom_buffer)
				
			End if 
			
		Else 
			
			// 25-1-2017 - Encode special characters
			// #ACI0097138
			//$Txt_text:=xml_Escape_characters ($Txt_text)
			
			$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject; "textArea")
			
			If (OK=1)\
				 & (Length:C16($Txt_text)>0)
				
				// v12 : Treat the carriage returns as elements "tbreak"
				//{------------------------------------------------------------------
				//DOM ECRIRE VALEUR ELEMENT XML($Txt_nodeReference;$Txt_stringToWrite)
				
				Repeat 
					
					$Lon_x:=Position:C15("\r"; $Txt_text)
					
					If ($Lon_x=0)
						
						$Lon_x:=Position:C15("\n"; $Txt_text)
						
					End if 
					
					If ($Lon_x>0)
						
						$Txt_Buffer:=Substring:C12($Txt_text; 1; $Lon_x-1)
						
						If (Length:C16($Txt_Buffer)>0)
							
							$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgReference; XML DATA:K45:12; $Txt_Buffer)
							
						End if 
						
						$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgReference; XML ELEMENT:K45:20; "tbreak")
						
						$Txt_text:=Delete string:C232($Txt_text; 1; Length:C16($Txt_Buffer)+1)
						
					Else 
						
						If (Length:C16($Txt_text)>0)
							
							$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgReference; XML DATA:K45:12; $Txt_text)
							
						End if 
					End if 
				Until ($Lon_x=0)\
					 | (OK=0)
				
			End if 
		End if 
		
		If (OK=1)
			
			If ($Lon_parameters>=3)\
				 & (($Num_x#0)\
				 | ($Num_y#0))
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
					"x"; $Num_x; \
					"y"; $Num_y)
				
			End if 
			
			Case of   //width
					
					//.....................................................
				: (OK=0)
					
					//.....................................................
				: ($Num_width=-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
						"width"; "auto")
					
					//.....................................................
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
						"width"; $Num_width)
					
					//.....................................................
			End case 
			
			Case of   //height
					
					//.....................................................
				: (OK=0)
					
					//.....................................................
				: ($Num_height=-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
						"height"; "auto")
					
					//.....................................................
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
						"height"; $Num_height)
					
					//.....................................................
			End case 
			
			If (Length:C16($Txt_style)>0)  //Embedded style
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
					"style"; $Txt_style)
				
			Else 
				
				Case of   //font-family
						
						//.....................................................
					: (OK=0)\
						 | (Length:C16($Txt_Font_Name)=0)
						
						//.....................................................
					Else 
						
						$Txt_Font_Name:=fontReplaceArial($Txt_Font_Name)
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"font-family"; $Txt_Font_Name)
						
						//.....................................................
				End case 
				
				Case of   //fill (color)
						
						//.....................................................
					: (OK=0)\
						 | (Length:C16($Txt_Color)=0)
						
						//.....................................................
					Else 
						
						$Lon_x:=Position:C15(":"; $Txt_Color)
						
						If ($Lon_x>0)
							
							$Lon_opacity:=Num:C11(Substring:C12($Txt_Color; $Lon_x+1))
							$Txt_Color:=Lowercase:C14(Substring:C12($Txt_Color; 1; $Lon_x-1))
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
								"fill"; $Txt_Color)
							
							If (OK=1)
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
									"fill-opacity"; $Lon_opacity/100)
								
							End if 
							
						Else 
							
							If ($Txt_Color="url(@")
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
									"fill"; $Txt_Color)
								
							Else 
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
									"fill"; Lowercase:C14($Txt_Color))
								
							End if 
						End if 
						
						//.....................................................
				End case 
				
				Case of   //text-decoration, font-style & font-weight
						
						//.....................................................
					: (OK=0)\
						 | ($Lon_fontStyles<0)
						
						//.....................................................
					: ($Lon_fontStyles=0)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-decoration"; "none")
						
						If (OK=1)
							
							DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
								"font-style"; "normal")
							
							If (OK=1)
								
								DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
									"font-weight"; "normal")
								
							End if 
						End if 
						
						//.....................................................
					Else 
						
						Case of 
							: ($Lon_fontStyles ?? 2) & ($Lon_fontStyles ?? 3)
								DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
									"text-decoration"; "underline line-through")
								
							: ($Lon_fontStyles ?? 2)
								DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
									"text-decoration"; "underline")
								
							: ($Lon_fontStyles ?? 3)
								DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
									"text-decoration"; "line-through")
						End case 
						
						If ($Lon_fontStyles ?? 1)
							DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
								"font-style"; "italic")
						End if 
						
						If ($Lon_fontStyles ?? 0)
							DOM SET XML ATTRIBUTE:C866($Dom_svgObject; \
								"font-weight"; "bold")
						End if 
						
						//.....................................................
				End case 
				
				Case of   //font-size
						
						//.....................................................
					: (OK=0)\
						 | ($Lon_Font_Size<0)
						
						//.....................................................
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"font-size"; $Lon_Font_Size)
						
						//.....................................................
				End case 
				
				Case of   //text-align
						
						//.....................................................
					: (OK=0)\
						 | ($Lon_fontAlignment<0)
						
						//.....................................................
					: ($Lon_fontAlignment=Align center:K42:3)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-align"; "center")
						
						//.....................................................
					: ($Lon_fontAlignment=Align right:K42:4)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-align"; "end")
						
						//.....................................................
					: ($Lon_fontAlignment=Align left:K42:2)\
						 | ($Lon_fontAlignment=Align default:K42:1)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-align"; "start")
						
						//.....................................................
					: ($Lon_fontAlignment=5)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-align"; "justify")
						
						//.....................................................
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-align"; "inherit")
						
						//.....................................................
				End case 
			End if 
			
			//------------------------------------------------------------------}
			
		End if 
		
		If (OK=1)
			
			//Set the id
			If (Storage:C1525.svg.options ?? 1)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
					"id"; $Dom_svgReference)
				
			End if 
			
			If (OK=1)
				
				$0:=$Dom_svgReference
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 