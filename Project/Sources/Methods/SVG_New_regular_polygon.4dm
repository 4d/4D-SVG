//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_regular_polygon
  // Created 24/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_REAL:C285($2)
C_LONGINT:C283($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_TEXT:C284($6)
C_TEXT:C284($7)
C_REAL:C285($8)

C_LONGINT:C283($Lon_i;$Lon_opacity;$Lon_parameters;$Lon_radius;$Lon_sides;$Lon_x)
C_REAL:C285($Num_angle;$Num_cx;$Num_cy;$Num_strokeWidth;$Num_width;$Num_x)
C_REAL:C285($Num_y)
C_TEXT:C284($kTxt_currentMethod;$Txt_fillColor;$Txt_nodeReference;$Txt_parentReference;$Txt_Path;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_New_regular_polygon ;$0)
	C_TEXT:C284(SVG_New_regular_polygon ;$1)
	C_REAL:C285(SVG_New_regular_polygon ;$2)
	C_LONGINT:C283(SVG_New_regular_polygon ;$3)
	C_REAL:C285(SVG_New_regular_polygon ;$4)
	C_REAL:C285(SVG_New_regular_polygon ;$5)
	C_TEXT:C284(SVG_New_regular_polygon ;$6)
	C_TEXT:C284(SVG_New_regular_polygon ;$7)
	C_REAL:C285(SVG_New_regular_polygon ;$8)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=3)
	
	$Txt_parentReference:=$1
	
	$Num_width:=$2
	$Lon_sides:=$3
	
	If ($Lon_sides>2)
		
		If ($Lon_sides>120)
			
			$Lon_sides:=120
			
		End if 
		
		$Num_strokeWidth:=-1
		
		If (Not:C34(Storage:C1525.svg.options ?? 15))
			
			$Txt_strokeColor:=Storage:C1525.svg.strokeColor
			$Txt_fillColor:=Choose:C955(Storage:C1525.svg.options ?? 3;Storage:C1525.svg.fillColor;"none")
			
		End if 
		
		If ($Lon_parameters>=4)
			
			$Num_cx:=$4
			
			If ($Lon_parameters>=5)
				
				$Num_cy:=$5
				
				If ($Lon_parameters>=6)
					
					$Txt_strokeColor:=$6
					
					If ($Lon_parameters>=7)
						
						$Txt_fillColor:=$7
						
						If ($Lon_parameters>=8)
							
							$Num_strokeWidth:=$8
							
						End if 
					End if 
				End if 
			End if 
		End if 
		
		If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
			
			Component_errorHandler ("init";$kTxt_currentMethod)
			
			$Num_cx:=($Num_width/2)+$Num_cx
			$Num_cy:=($Num_width/2)+$Num_cy
			$Lon_radius:=$Num_width/2
			
			For ($Lon_i;1;$Lon_sides;1)
				
				$Num_angle:=((2*Pi:K30:1)/$Lon_sides)*$Lon_i
				$Num_x:=$Num_cx+($Lon_radius*Cos:C18($Num_angle))
				$Num_y:=$Num_cy+($Lon_radius*Sin:C17($Num_angle))
				$Txt_Path:=$Txt_Path+String:C10(Round:C94($Num_x;2);"&xml")+","+String:C10(Round:C94($Num_y;2);"&xml")+(" "*Num:C11($Lon_i<$Lon_sides))
				
			End for 
			
			$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"polygon";\
				"points";$Txt_Path)
			
			If (($Lon_sides%2)#0)
				
				SVG_SET_TRANSFORM_ROTATE ($Txt_nodeReference;-(360/$Lon_sides)/4;$Num_cx;$Num_cy)
				
			End if 
			
			  //Set the front color
			If (OK=1)\
				 & (Length:C16($Txt_strokeColor)>0)
				
				$Lon_x:=Position:C15(":";$Txt_strokeColor)
				
				If ($Lon_x>0)
					
					$Lon_opacity:=Num:C11(Substring:C12($Txt_strokeColor;$Lon_x+1))
					$Txt_strokeColor:=Lowercase:C14(Substring:C12($Txt_strokeColor;1;$Lon_x-1))
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"stroke";$Txt_strokeColor)
					
					If (OK=1)\
						 & ($Lon_opacity#0)
						
						DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
							"stroke-opacity";$Lon_opacity/100)
						
					End if 
					
				Else 
					
					If ($Txt_strokeColor="url(@")
						
						DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
							"stroke";$Txt_strokeColor)
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
							"stroke";Lowercase:C14($Txt_strokeColor))
						
					End if 
				End if 
			End if 
			
			  //Set the back color
			If (OK=1)\
				 & (Length:C16($Txt_fillColor)>0)
				
				$Lon_x:=Position:C15(":";$Txt_fillColor)
				
				If ($Lon_x>0)
					
					$Lon_opacity:=Num:C11(Substring:C12($Txt_fillColor;$Lon_x+1))
					$Txt_fillColor:=Lowercase:C14(Substring:C12($Txt_fillColor;1;$Lon_x-1))
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"fill";$Txt_fillColor)
					
					If (OK=1)
						
						DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
							"fill-opacity";$Lon_opacity/100)
						
					End if 
					
				Else 
					
					If ($Txt_fillColor="url(@")
						
						DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
							"fill";$Txt_fillColor)
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
							"fill";Lowercase:C14($Txt_fillColor))
						
					End if 
				End if 
			End if 
			
			  //Set the pen size
			If (OK=1)\
				 & ($Num_strokeWidth#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
					"stroke-width";$Num_strokeWidth)
				
			End if 
			
			If (OK=1)
				
				  //Set the id
				If (Storage:C1525.svg.options ?? 1)
					
					DOM SET XML ATTRIBUTE:C866($Txt_nodeReference;\
						"id";$Txt_nodeReference)
					
				End if 
				
				If (OK=1)
					
					$0:=$Txt_nodeReference
					
				End if 
			End if 
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8857;$kTxt_currentMethod))  // Invalid Value for an Argument
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 