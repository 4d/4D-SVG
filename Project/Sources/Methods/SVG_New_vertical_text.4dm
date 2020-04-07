//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_vertical_text
  // Created 26/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
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

C_LONGINT:C283($Lon_Aligment;$Lon_Count;$Lon_Font_Size;$Lon_i;$Lon_opacity;$Lon_parameters)
C_LONGINT:C283($Lon_Styles;$Lon_x)
C_REAL:C285($Num_rotation;$Num_x;$Num_y)
C_TEXT:C284($Dom_svgObject;$Dom_svgReference;$kTxt_currentMethod;$Txt_character;$Txt_Color;$Txt_Font_Name)
C_TEXT:C284($Txt_Span;$Txt_text)

If (False:C215)
	C_TEXT:C284(SVG_New_vertical_text ;$0)
	C_TEXT:C284(SVG_New_vertical_text ;$1)
	C_TEXT:C284(SVG_New_vertical_text ;$2)
	C_REAL:C285(SVG_New_vertical_text ;$3)
	C_REAL:C285(SVG_New_vertical_text ;$4)
	C_TEXT:C284(SVG_New_vertical_text ;$5)
	C_LONGINT:C283(SVG_New_vertical_text ;$6)
	C_LONGINT:C283(SVG_New_vertical_text ;$7)
	C_LONGINT:C283(SVG_New_vertical_text ;$8)
	C_TEXT:C284(SVG_New_vertical_text ;$9)
	C_REAL:C285(SVG_New_vertical_text ;$10)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New_vertical_text"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_text:=$2  //String to write
	
	$Lon_Font_Size:=-1
	$Lon_Styles:=-1
	
	If ($Lon_parameters>=3)
		
		$Num_x:=$3  //X position
		
		If ($Lon_parameters>=4)
			
			$Num_y:=$4  //Y position
			
			If ($Lon_parameters>=5)
				
				$Txt_Font_Name:=$5  //Default is Time New Roman
				
				If ($Lon_parameters>=6)
					
					$Lon_Font_Size:=$6  //Default is 12 pt
					
					If ($Lon_parameters>=7)
						
						$Lon_Styles:=$7  //Default is standard
						
						If ($Lon_parameters>=8)
							
							$Lon_Aligment:=$8  //Default is start (Left)
							
							If ($Lon_parameters>=9)
								
								$Txt_Color:=$9  //Front color
								
								If ($Lon_parameters>=10)
									
									$Num_rotation:=$10
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	If ($Lon_Font_Size=-1)
		
		$Lon_Font_Size:=12
		
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Dom_svgReference:=DOM Create XML element:C865($Dom_svgObject;"text")
		
		If (OK=1)
			
			If ($Num_x#0)\
				 | ($Num_y#0)
				
				DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
					"x";$Num_x;\
					"y";$Num_y)
				
			End if 
			
			Case of   //font-family
					
					  //.....................................................
				: (OK=0)
					
					  //.....................................................
				: (Length:C16($Txt_Font_Name)=0)
					
					  //.....................................................
				Else 
					
					$Txt_Font_Name:=fontReplaceArial ($Txt_Font_Name)
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"font-family";$Txt_Font_Name)
					
					  //.....................................................
			End case 
			
			Case of 
					
					  //.....................................................
				: (OK=0)
					
					  //.....................................................
				: (Length:C16($Txt_Color)=0)
					
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
			
			Case of 
					
					  //.....................................................
				: (OK=0)
					
					  //.....................................................
				: ($Lon_Styles<0)
					
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
			
			Case of 
					
					  //.....................................................
				: (OK=0)
					
					  //.....................................................
				: ($Lon_Font_Size<0)
					
					  //.....................................................
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"font-size";$Lon_Font_Size)
					
					  //.....................................................
			End case 
			
			Case of 
					
					  //.....................................................
				: (OK=0)
					
					  //.....................................................
				: ($Lon_Aligment=0)
					
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
				: ($Lon_Aligment=Align default:K42:1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"text-anchor";"start")
					
					  //.....................................................
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"text-anchor";"inherit")
					
					  //.....................................................
			End case 
			
			Case of 
					
					  //.....................................................
				: (OK=0)
					
					  //.....................................................
				: ($Num_rotation=0)
					
					  //.....................................................
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"transform";"rotate("+String:C10($Num_rotation)+")")
					
					  //.....................................................
			End case 
			
			If (OK=1)
				
				$Lon_Count:=0
				
				For ($Lon_i;1;Length:C16($Txt_text);1)
					
					$Txt_character:=$Txt_text[[$Lon_i]]
					
					If ($Txt_character="\r")
						
						$Lon_Count:=0
						$Num_x:=$Num_x+($Lon_Font_Size*4/3)
						
					Else 
						
						$Lon_Count:=$Lon_Count+1
						$Txt_Span:=DOM Create XML element:C865($Dom_svgReference;"tspan";\
							"x";$Num_x)
						
						If (OK=1)
							
							DOM SET XML ATTRIBUTE:C866($Txt_Span;\
								"y";$Num_y+($Lon_Font_Size*$Lon_Count*7/8))
							
							If (OK=1)\
								 & ($Num_rotation#0)
								
								DOM SET XML ATTRIBUTE:C866($Txt_Span;\
									"transform";"rotate("+String:C10($Num_rotation)+")")
								
							End if 
							
							If (OK=1)
								
								DOM SET XML ELEMENT VALUE:C868($Txt_Span;$Txt_character)
								
							End if 
						End if 
					End if 
				End for 
			End if 
			
			If (OK=1)
				
				  //Set the id
				  //{
				If (Storage:C1525.svg.options ?? 1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_svgReference;\
						"id";$Dom_svgReference)
					
				End if 
				  //}
				
				If (OK=1)
					
					$0:=$Dom_svgReference
					
				End if 
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 