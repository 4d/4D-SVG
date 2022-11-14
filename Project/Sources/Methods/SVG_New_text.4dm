//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_New_text
// Created 23/01/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Draw a text in a picture
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
C_REAL:C285($10)
C_REAL:C285($11)
C_REAL:C285($12)

C_BOOLEAN:C305($Boo_styledText)
C_LONGINT:C283($Lon_Aligment; $Lon_count; $Lon_error; $Lon_Font_Size; $Lon_i; $Lon_lineFontSize)
C_LONGINT:C283($Lon_opacity; $Lon_parameters; $Lon_fontStyles; $Lon_x)
C_REAL:C285($Num_interlining; $Num_rotation; $Num_stretch; $Num_x; $Num_y)
C_TEXT:C284($Dom_buffer; $Dom_svgObject; $Dom_svgReference; $kTxt_currentMethod; $Txt_Buffer; $Txt_Color)
C_TEXT:C284($Txt_Font_Name; $Txt_pattern; $Txt_Span; $Txt_style; $Txt_text; $Txt_Transform)
C_TEXT:C284($Txt_unit)

If (False:C215)
	C_TEXT:C284(SVG_New_text; $0)
	C_TEXT:C284(SVG_New_text; $1)
	C_TEXT:C284(SVG_New_text; $2)
	C_REAL:C285(SVG_New_text; $3)
	C_REAL:C285(SVG_New_text; $4)
	C_TEXT:C284(SVG_New_text; $5)
	C_LONGINT:C283(SVG_New_text; $6)
	C_LONGINT:C283(SVG_New_text; $7)
	C_LONGINT:C283(SVG_New_text; $8)
	C_TEXT:C284(SVG_New_text; $9)
	C_REAL:C285(SVG_New_text; $10)
	C_REAL:C285(SVG_New_text; $11)
	C_REAL:C285(SVG_New_text; $12)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New_text"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Lon_Font_Size:=-1
	$Lon_fontStyles:=-1
	$Lon_Aligment:=-1
	$Num_interlining:=1
	$Num_stretch:=1
	
	$Dom_svgObject:=$1
	$Txt_text:=$2  //String to write
	
	//#20-11-2014 - Accept styled text
	//#ACI0093459
	//$Boo_styledText:=(Position("<SPAN ";$Txt_text)>0)
	$Boo_styledText:=str_styledText($Txt_text)
	
	If (Storage:C1525.svg.options ?? 13)
		
		$Txt_text:=Replace string:C233($Txt_text; " "; Char:C90(0x2001))
		
	End if 
	
	If ($Lon_parameters>=3)
		
		$Num_x:=$3  //X position
		
		If ($Lon_parameters>=4)
			
			$Num_y:=$4  //Y position
			
			If ($Lon_parameters>=5)
				
				If (Position:C15("{"; $5)=1)  //Embedded style
					
					$Txt_style:=Replace string:C233(Substring:C12($5; 2); "}"; "")
					
				Else 
					
					$Txt_Font_Name:=$5  //Default is Time New Roman
					
					If ($Lon_parameters>=6)
						
						$Lon_Font_Size:=$6  //Default is 12 pt
						
						If ($Lon_parameters>=7)
							
							$Lon_fontStyles:=$7  //Default is standard
							
							If ($Lon_parameters>=8)
								
								$Lon_Aligment:=$8  //Default is start (Left)
								
								If ($Lon_parameters>=9)
									
									$Txt_Color:=$9  //Front color
									
									If ($Lon_parameters>=10)
										
										$Num_rotation:=$10  //Rotation
										
										If ($Lon_parameters>=11)
											
											$Num_interlining:=$11  //Interlining
											
											If ($Lon_parameters>=12)
												
												$Num_stretch:=$12  //Stretch
												
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	If (Length:C16($Txt_style)=0)
		
		If ($Lon_Font_Size=-1)
			
			If (False:C215)
				
				//#TO_BE_DONE
				//we must find the inherited font size (class or parent)
				
			Else 
				
				$Lon_Font_Size:=12  //default size
			End if 
		End if 
		
		// #30-9-2015 - Bug JFR [
		//$Num_y:=$Num_y+($Lon_Font_Size*Num(Not($Boo_styledText)))
		
	Else 
		
		ARRAY LONGINT:C221($tLon_positions; 0x0000)
		ARRAY LONGINT:C221($tLon_lengths; 0x0000)
		
		If (Match regex:C1019("(?mi-s)font-size:(\\d*)([^;}]*)"; $Txt_style; 1; $tLon_positions; $tLon_lengths))
			
			$Lon_Font_Size:=Num:C11(Substring:C12($Txt_style; $tLon_positions{1}; $tLon_lengths{1}))
			
			If (Size of array:C274($tLon_positions)>1)
				
				$Txt_unit:=Substring:C12($Txt_style; $tLon_positions{2}; $tLon_lengths{2})
				
			End if 
		End if 
	End if 
	
	$Num_y:=$Num_y+($Lon_Font_Size*Num:C11(Not:C34($Boo_styledText)))  //]
	
	If (Asserted:C1132(xml_referenceValid($Dom_svgObject); Get localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject; "text")
		
		If (OK=1)
			
			If ($Num_x#0)\
				 | ($Num_y#0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
					"x"; $Num_x; \
					"y"; $Num_y)
				
			End if 
			
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
				
				Case of   //text-anchor
						
						//.....................................................
					: (OK=0)\
						 | ($Lon_Aligment<0)
						
						//.....................................................
					: ($Lon_Aligment=Align center:K42:3)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-anchor"; "middle")
						
						//.....................................................
					: ($Lon_Aligment=Align right:K42:4)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-anchor"; "end")
						
						//.....................................................
					: ($Lon_Aligment=Align left:K42:2)
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-anchor"; "start")
						
						//.....................................................
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
							"text-anchor"; "inherit")
						
						//.....................................................
				End case 
			End if 
			
			If (OK=1)
				
				If (Length:C16($Txt_text)>0)
					
					If ($Boo_styledText)
						
						//$Txt_pattern:="(?m-is)(<span)( style=\"[^\"]*\">)(.*)(</span>)"
						//$Txt_replacement:="<_SPAN\\2\\3\\r</_SPAN>"
						
						//$Lon_error:=Rgx_SubstituteText ($Txt_pattern;$Txt_replacement;->$Txt_text)
						
						$Txt_text:=Replace string:C233($Txt_text; "<SPAN"; "<tspan")
						$Txt_text:=Replace string:C233($Txt_text; "</SPAN>"; "</tspan>")
						$Txt_text:=Replace string:C233($Txt_text; "STYLE="; "style=")
						$Txt_text:=Replace string:C233($Txt_text; "color:"; "fill:")
						$Txt_text:=Replace string:C233($Txt_text; "<BR/>"; "\r")
						
						$Txt_pattern:="(?mi-s)<tspan[^>]*style=\"font-size:(\\d+)[^>]*>"
						
						Repeat 
							
							$Lon_x:=Position:C15("\r"; $Txt_text)
							
							If ($Lon_x>0)
								
								$Txt_Buffer:=Substring:C12($Txt_text; 1; $Lon_x-1)
								$Txt_text:=Delete string:C232($Txt_text; 1; Length:C16($Txt_Buffer)+1)
								
								//#ACI0093774
								//$Txt_Span:=DOM Create XML element($Dom_svgReference;"tspan";"x";$Num_x)
								
								If (OK=1)
									
									ARRAY TEXT:C222($tTxt_results; 0x0000)
									$Lon_lineFontSize:=$Lon_Font_Size  //default
									
									If (Rgx_ExtractText($Txt_pattern; $Txt_Buffer; ""; ->$tTxt_results; 0)=0)
										
										For ($Lon_i; 1; Size of array:C274($tTxt_results); 1)
											
											If (Num:C11($tTxt_results{$Lon_i})>$Lon_lineFontSize)
												
												$Lon_lineFontSize:=Num:C11($tTxt_results{$Lon_i})
												
											End if 
										End for 
									End if 
									
									$Num_y:=$Num_y+$Lon_lineFontSize+Choose:C955($Lon_count>0; $Num_interlining*8; 0)
									
									//#ACI0093774
									//DOM SET XML ATTRIBUTE($Txt_Span;"y";$Num_y)
									//DOM SET XML ELEMENT VALUE($Txt_Span;$Txt_Buffer)
									
									//#ACI0096676 {
									//$Lon_error:=Rgx_SubstituteText ("(?mi-s)^<tspan ([^>]*>)";"<tspan x=\""+String($Num_x)+"\" y=\""+String($Num_y)+"\" \\1";->$Txt_Buffer)
									If ($Txt_Buffer#"<tspan@")
										
										$Txt_Buffer:="<tspan>"+$Txt_Buffer+"</tspan>"
										
									End if 
									
									$Lon_error:=Rgx_SubstituteText("(?mi-s)^<tspan([^>]*>)"; "<tspan x=\""+String:C10($Num_x)+"\" y=\""+String:C10($Num_y)+"\" \\1"; ->$Txt_Buffer)
									//}
									
									$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgReference; XML ELEMENT:K45:20; $Txt_Buffer)
									
								End if 
								
								$Lon_Count:=$Lon_Count+1
								
							Else 
								
								If ($Lon_Count=0)
									
									DOM SET XML ELEMENT VALUE:C868($Dom_svgReference; $Txt_text)
									
								Else 
									
									ARRAY TEXT:C222($tTxt_results; 0x0000)
									$Lon_lineFontSize:=$Lon_Font_Size  //default
									
									If (Rgx_ExtractText($Txt_pattern; $Txt_text; ""; ->$tTxt_results; 0)=0)
										
										For ($Lon_i; 1; Size of array:C274($tTxt_results); 1)
											
											If (Num:C11($tTxt_results{$Lon_i})>$Lon_lineFontSize)
												
												$Lon_lineFontSize:=Num:C11($tTxt_results{$Lon_i})
												
											End if 
										End for 
									End if 
									
									$Num_y:=$Num_y+$Lon_lineFontSize+Choose:C955($Lon_count>0; $Num_interlining*8; 0)
									
									//#ACI0093774
									//$Txt_Span:=DOM Create XML element($Dom_svgReference;"tspan";"x";$Num_x;"y";$Num_y)
									//If (OK=1)
									//DOM SET XML ELEMENT VALUE($Txt_Span;$Txt_text)
									//End if
									
									//#ACI0096676 {
									//$Lon_error:=Rgx_SubstituteText ("(?mi-s)^<tspan ([^>]*>)";"<tspan x=\""+String($Num_x)+"\" y=\""+String($Num_y)+"\" \\1";->$Txt_text)
									If ($Txt_Buffer#"<tspan@")
										
										$Txt_Buffer:="<tspan>"+$Txt_Buffer+"</tspan>"
										
									End if 
									
									$Lon_error:=Rgx_SubstituteText("(?mi-s)^<tspan([^>]*>)"; "<tspan x=\""+String:C10($Num_x)+"\" y=\""+String:C10($Num_y)+"\" \\1"; ->$Txt_Buffer)
									//}
									
									$Dom_buffer:=DOM Append XML child node:C1080($Dom_svgReference; XML ELEMENT:K45:20; $Txt_text)
									
								End if 
							End if 
						Until ($Lon_x=0)\
							 | (OK=0)
						
						
						//$Dom_buffer:=DOM Create XML Ref("root")
						//$Dom_:=DOM Append XML element($Dom_buffer;$Dom_svgReference)
						
						//DOM EXPORT TO VAR($Dom_buffer;$Txt_Buffer)
						//DOM CLOSE XML($Dom_buffer)
						
						//$Txt_Buffer:=Replace string($Txt_Buffer;"_SPAN";"tspan")
						//$Txt_Buffer:=Replace string($Txt_Buffer;" xmlns=\"\"";"")
						
						//$Dom_buffer:=DOM Parse XML variable($Txt_Buffer)
						//$Dom_:=DOM Find XML element($Dom_buffer;"root/text")
						
						//DOM REMOVE XML ELEMENT($Dom_svgReference)
						//$Dom_svgReference:=DOM Append XML element($Dom_svgObject;$Dom_)
						
						
						
					Else 
						
						// 25-1-2017 - Encode special characters
						// #ACI0097138
						//$Txt_text:=xml_Escape_characters ($Txt_text)
						
						Repeat 
							
							$Lon_x:=Position:C15("\r"; $Txt_text)
							
							If ($Lon_x>0)
								
								$Txt_Buffer:=Substring:C12($Txt_text; 1; $Lon_x-1)
								$Txt_Span:=DOM Create XML element:C865($Dom_svgReference; "tspan"; \
									"x"; $Num_x)
								
								If (OK=1)
									
									DOM SET XML ATTRIBUTE:C866($Txt_Span; \
										"y"; $Num_y+($Lon_Font_Size*$Lon_Count*$Num_interlining))
									DOM SET XML ELEMENT VALUE:C868($Txt_Span; $Txt_Buffer)
									
								End if 
								
								$Txt_text:=Delete string:C232($Txt_text; 1; Length:C16($Txt_Buffer)+1)
								$Lon_Count:=$Lon_Count+1
								
							Else 
								
								If ($Lon_Count=0)
									
									DOM SET XML ELEMENT VALUE:C868($Dom_svgReference; $Txt_text)
									
								Else 
									
									If ($Lon_Font_Size=-1)
										
										//use em
										$Txt_Span:=DOM Create XML element:C865($Dom_svgReference; "tspan"; \
											"x"; $Num_x; \
											"y"; String:C10($Lon_Count+1)+"em")
										
									Else 
										
										//use pt
										$Txt_Span:=DOM Create XML element:C865($Dom_svgReference; "tspan"; \
											"x"; $Num_x; \
											"y"; $Num_y+($Lon_Font_Size*$Lon_Count*$Num_interlining))
										
									End if 
									
									If (OK=1)
										
										DOM SET XML ELEMENT VALUE:C868($Txt_Span; $Txt_text)
										
									End if 
								End if 
							End if 
						Until ($Lon_x=0)\
							 | (OK=0)
						
					End if 
				End if 
			End if 
			
			Case of 
					
					//.....................................................
				: (OK=0)\
					 | ($Num_rotation=0)
					
					//.....................................................
				Else 
					
					If ($Num_rotation>0)
						
						$Txt_Transform:="rotate("+String:C10($Num_rotation; "&xml")+","+String:C10($Num_x; "&xml")+","+String:C10($Num_y; "&xml")+")"
						$Txt_Buffer:=String:C10(-$Lon_Font_Size*$Lon_Count*$Num_interlining; "&xml")
						$Txt_Transform:=$Txt_Transform+" translate("+String:C10(-$Lon_Font_Size; "&xml")+","+$Txt_Buffer+")"
						
					Else 
						
						//•••••••••••••••••••••••••••••
						//#TO_BE_DONE  {
						$Txt_Transform:="rotate("+String:C10($Num_rotation; "&xml")+")"
						
						//$Txt_Transform:="rotate("+Remplacer chaine(Chaine($Num_rotation);",";".")+","+Remplacer chaine(Chaine($Num_x);",";".")+","+Remplacer chaine(Chaine($Num_y);",";".")+")"
						//$Txt_Buffer:=Remplacer chaine(Chaine((-$Lon_Font_Size*$Lon_Count*$Num_interlining));",";".")
						//$Txt_Transform:=$Txt_Transform+" translate("+Remplacer chaine(Chaine(-$Lon_Font_Size);",";".")+","+$Txt_Buffer+")"
						//}
						
					End if 
					
					//.....................................................
			End case 
			
			Case of 
					
					//.....................................................
				: (OK=0)\
					 | ($Num_stretch=1)
					
					//.....................................................
				Else 
					
					$Txt_Transform:=$Txt_Transform+(" "*Num:C11(Length:C16($Txt_Transform)>0))
					$Txt_Transform:=$Txt_Transform+"scale("+String:C10($Num_stretch; "&xml")+",1)"
					
					//.....................................................
			End case 
			
			Case of 
					
					//.....................................................
				: (OK=0)\
					 | (Length:C16($Txt_Transform)=0)
					
					//.....................................................
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference; \
						"transform"; $Txt_Transform)
					
					//.....................................................
			End case 
			
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
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; $kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 