//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_path
  // Created 22/08/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Add a path element to the $1 element and set the start coordinates with $2 & $3
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (18/07/11)
  // fix absolute/relative coordinates according to options
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_TEXT:C284($4)
C_TEXT:C284($5)
C_REAL:C285($6)

C_LONGINT:C283($Lon_opacity;$Lon_parameters;$Lon_x)
C_REAL:C285($Num_strokeWidth)
C_TEXT:C284($Dom_node;$Dom_parent;$kTxt_currentMethod;$Txt_data;$Txt_fillColor;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_New_path ;$0)
	C_TEXT:C284(SVG_New_path ;$1)
	C_REAL:C285(SVG_New_path ;$2)
	C_REAL:C285(SVG_New_path ;$3)
	C_TEXT:C284(SVG_New_path ;$4)
	C_TEXT:C284(SVG_New_path ;$5)
	C_REAL:C285(SVG_New_path ;$6)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New_path"  //Nom methode courante

If ($Lon_parameters>=3)
	
	$Dom_parent:=$1
	
	$Txt_data:="m"+String:C10($2;"&xml")+","+String:C10($3;"&xml")
	
	If (Storage:C1525.svg.options ?? 4)  //Absolute coordinates
		
		$Txt_data:=Uppercase:C13($Txt_data)
		
	End if 
	
	$Num_strokeWidth:=-1
	
	If (Not:C34(Storage:C1525.svg.options ?? 15))
		
		$Txt_strokeColor:=Storage:C1525.svg.strokeColor
		$Txt_fillColor:=Choose:C955(Storage:C1525.svg.options ?? 3;Storage:C1525.svg.fillColor;"none")
		
	End if 
	
	If ($Lon_parameters>=4)
		
		$Txt_strokeColor:=$4
		
		If ($Lon_parameters>=5)
			
			$Txt_fillColor:=$5
			
			If ($Lon_parameters>=6)
				
				$Num_strokeWidth:=$6
				
			End if 
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_parent);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Dom_node:=DOM Create XML element:C865($Dom_parent;"path";\
			"d";$Txt_data)
		
		  //SVG_SET_STROKE_BRUSH ($Txt_nodeReference;$Txt_strokeColor) {
		If (OK=1)\
			 & (Length:C16($Txt_strokeColor)>0)
			
			$Lon_x:=Position:C15(":";$Txt_strokeColor)
			
			If ($Lon_x>0)
				
				$Lon_opacity:=Num:C11(Substring:C12($Txt_strokeColor;$Lon_x+1))
				$Txt_strokeColor:=Lowercase:C14(Substring:C12($Txt_strokeColor;1;$Lon_x-1))
				DOM SET XML ATTRIBUTE:C866($Dom_node;\
					"stroke";$Txt_strokeColor)
				
				If (OK=1)\
					 & ($Lon_opacity#0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_node;\
						"stroke-opacity";$Lon_opacity/100)
					
				End if 
				
			Else 
				
				If ($Txt_strokeColor="url(@")
					
					DOM SET XML ATTRIBUTE:C866($Dom_node;\
						"stroke";$Txt_strokeColor)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_node;\
						"stroke";Lowercase:C14($Txt_strokeColor))
					
				End if 
			End if 
		End if   //}
		
		  //SVG_SET_FILL_BRUSH ($Txt_nodeReference;$Txt_fillColor) {
		If (OK=1)\
			 & (Length:C16($Txt_fillColor)>0)
			
			$Lon_x:=Position:C15(":";$Txt_fillColor)
			
			If ($Lon_x>0)
				
				$Lon_opacity:=Num:C11(Substring:C12($Txt_fillColor;$Lon_x+1))
				$Txt_fillColor:=Lowercase:C14(Substring:C12($Txt_fillColor;1;$Lon_x-1))
				DOM SET XML ATTRIBUTE:C866($Dom_node;\
					"fill";$Txt_fillColor)
				
				If (OK=1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_node;\
						"fill-opacity";$Lon_opacity/100)
					
				End if 
				
			Else 
				
				If ($Txt_fillColor="url(@")
					
					DOM SET XML ATTRIBUTE:C866($Dom_node;\
						"fill";$Txt_fillColor)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_node;\
						"fill";Lowercase:C14($Txt_fillColor))
					
				End if 
			End if 
		End if   //}
		
		  //SVG_SET_STROKE_WIDTH ($Txt_nodeReference;$Num_strokeWidth) {
		If (OK=1)\
			 & ($Num_strokeWidth#-1)
			
			DOM SET XML ATTRIBUTE:C866($Dom_node;\
				"stroke-width";$Num_strokeWidth)
			
		End if   //}
		
		If (OK=1)
			
			  //Set the id {
			If (Storage:C1525.svg.options ?? 1)
				
				DOM SET XML ATTRIBUTE:C866($Dom_node;\
					"id";$Dom_node)
				
			End if   //}
			
			If (OK=1)
				
				$0:=$Dom_node
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 