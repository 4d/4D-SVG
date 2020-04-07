//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_polygon
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_REAL:C285($5)

C_LONGINT:C283($Lon_opacity;$Lon_parameters;$Lon_x)
C_REAL:C285($Num_strokeWidth)
C_TEXT:C284($kTxt_currentMethod;$Txt_fillColor;$Txt_nodeReference;$Txt_parentReference;$Txt_path;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_New_polygon ;$0)
	C_TEXT:C284(SVG_New_polygon ;$1)
	C_TEXT:C284(SVG_New_polygon ;$2)
	C_TEXT:C284(SVG_New_polygon ;$3)
	C_TEXT:C284(SVG_New_polygon ;$4)
	C_REAL:C285(SVG_New_polygon ;$5)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Txt_parentReference:=$1
	
	$Num_strokeWidth:=-1
	
	If ($Lon_parameters>=2)
		
		$Txt_path:=$2
		
		If ($Lon_parameters>=3)
			
			$Txt_strokeColor:=$3
			
			If ($Lon_parameters>=4)
				
				$Txt_fillColor:=$4
				
				If ($Lon_parameters>=5)
					
					$Num_strokeWidth:=$5
					
				End if 
			End if 
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"polygon")
		
		If (OK=1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
				"points";$Txt_Path)
			
		End if 
		
		  //Set the front color {
		If (OK=1)\
			 & (Length:C16($Txt_strokeColor)>0)
			
			$Lon_x:=Position:C15(":";$Txt_strokeColor)
			
			If ($Lon_x>0)
				
				$Lon_opacity:=Num:C11(Substring:C12($Txt_strokeColor;$Lon_x+1))
				$Txt_strokeColor:=Lowercase:C14(Substring:C12($Txt_strokeColor;1;$Lon_x-1))
				
				If ($Lon_opacity#0)
					
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"stroke-opacity";$Lon_opacity/100)
					
				End if 
			End if 
			
			If ($Txt_strokeColor="url(@")
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"stroke";$Txt_strokeColor)
				
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"stroke";Lowercase:C14($Txt_strokeColor))
				
			End if 
		End if 
		  //}
		
		  //Set the back color {
		If (OK=1)\
			 & (Length:C16($Txt_fillColor)>0)
			
			$Lon_x:=Position:C15(":";$Txt_fillColor)
			
			If ($Lon_x>0)
				
				$Lon_opacity:=Num:C11(Substring:C12($Txt_fillColor;$Lon_x+1))
				$Txt_fillColor:=Lowercase:C14(Substring:C12($Txt_fillColor;1;$Lon_x-1))
				
				If ($Lon_opacity#0)
					
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"fill-opacity";$Lon_opacity/100)
					
				End if 
			End if 
			
			If ($Txt_fillColor="url(@")
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"fill";$Txt_fillColor)
				
			Else 
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"fill";Lowercase:C14($Txt_fillColor))
				
			End if 
		End if 
		  //}
		
		  //Set the pen size {
		If (OK=1)\
			 & ($Num_strokeWidth#-1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
				"stroke-width";$Num_strokeWidth)
			
		End if 
		  //}
		
		If (OK=1)
			
			  //Set the id {
			If (Storage:C1525.svg.options ?? 1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"id";$Txt_nodeReference)
				
			End if 
			  //}
			
			If (OK=1)
				
				$0:=$Txt_nodeReference
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 