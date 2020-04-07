//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_arc
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (01/07/08)
  // 2004 -> v11
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (13/09/10)
  // Drawing a circle if the angle is superior or equal to 360
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_REAL:C285($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)
C_TEXT:C284($7)
C_TEXT:C284($8)
C_REAL:C285($9)

C_LONGINT:C283($Lon_opacity;$Lon_parameters;$Lon_x)
C_REAL:C285($Num_cx;$Num_cx2;$Num_cy;$Num_cy2;$Num_linetox;$Num_linetoy)
C_REAL:C285($Num_rayon;$Num_start;$Num_startDegrees;$Num_stop;$Num_stopDegrees;$Num_strokeWidth)
C_TEXT:C284($Dom_object;$Dom_parent;$kTxt_currentMethod;$Txt_fillColor;$Txt_pathDatas;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_New_arc ;$0)
	C_TEXT:C284(SVG_New_arc ;$1)
	C_REAL:C285(SVG_New_arc ;$2)
	C_REAL:C285(SVG_New_arc ;$3)
	C_REAL:C285(SVG_New_arc ;$4)
	C_REAL:C285(SVG_New_arc ;$5)
	C_REAL:C285(SVG_New_arc ;$6)
	C_TEXT:C284(SVG_New_arc ;$7)
	C_TEXT:C284(SVG_New_arc ;$8)
	C_REAL:C285(SVG_New_arc ;$9)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=6)
	
	$Dom_parent:=$1
	
	$Num_cx:=$2
	$Num_cy:=$3
	$Num_rayon:=$4
	$Num_start:=$5
	$Num_stop:=$6
	
	If (Storage:C1525.svg.options ?? 9)  //trigonometric origin ?
		
		$Num_start:=$Num_start+90
		$Num_stop:=$Num_stop+90
		
	End if 
	
	$Num_startDegrees:=$Num_start*Degree:K30:2
	$Num_stopDegrees:=$Num_stop*Degree:K30:2
	
	$Num_strokeWidth:=-1
	
	If (Not:C34(Storage:C1525.svg.options ?? 15))
		
		$Txt_strokeColor:=Storage:C1525.svg.strokeColor
		$Txt_fillColor:=Choose:C955(Storage:C1525.svg.options ?? 3;Storage:C1525.svg.fillColor;"none")
		
	End if 
	
	If ($Lon_parameters>=7)
		
		$Txt_strokeColor:=$7
		
		If ($Lon_parameters>=8)
			
			$Txt_fillColor:=$8
			
			If ($Lon_parameters>=9)
				
				$Num_strokeWidth:=$9
				
			End if 
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid ($Dom_parent);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		If (($Num_stop-$Num_start)>=360)  // It's a circle !
			
			$Dom_object:=DOM Create XML element:C865($Dom_parent;"circle";\
				"cx";$Num_cx;\
				"cy";$Num_cy;\
				"r";$Num_rayon)
			
			If (OK=1)
				
				  //Set the front color {
				If (OK=1)\
					 & (Length:C16($Txt_strokeColor)>0)
					
					$Lon_x:=Position:C15(":";$Txt_strokeColor)
					
					If ($Lon_x>0)
						
						$Lon_opacity:=Num:C11(Substring:C12($Txt_strokeColor;$Lon_x+1))
						$Txt_strokeColor:=Lowercase:C14(Substring:C12($Txt_strokeColor;1;$Lon_x-1))
						
						If ($Lon_opacity#0)
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"stroke-opacity";$Lon_opacity/100)
							
						End if 
					End if 
					
					If ($Txt_strokeColor="url(@")
						
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
							"stroke";$Txt_strokeColor)
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
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
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"fill-opacity";$Lon_opacity/100)
							
						End if 
					End if 
					
					If ($Txt_fillColor="url(@")
						
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
							"fill";$Txt_fillColor)
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
							"fill";Lowercase:C14($Txt_fillColor))
						
					End if 
				End if 
				  //}
				
			End if 
			
		Else 
			
			$Num_linetox:=(Sin:C17($Num_startDegrees)*$Num_rayon)+$Num_cx
			$Num_linetoy:=-(Cos:C18($Num_startDegrees)*$Num_rayon)+$Num_cy
			$Num_cx2:=Round:C94((Sin:C17($Num_stopDegrees)*$Num_rayon)+$Num_cx;2)
			$Num_cy2:=Round:C94(-(Cos:C18($Num_stopDegrees)*$Num_rayon)+$Num_cy;2)
			
			If (Storage:C1525.svg.options ?? 2)  //Close object
				
				  //moveto
				$Txt_pathDatas:="M"+String:C10($Num_cx;"&xml")+","+String:C10($Num_cy;"&xml")
				
				  //lineto
				$Txt_pathDatas:=$Txt_pathDatas+" L"+String:C10($Num_linetox;"&xml")+","+String:C10($Num_linetoy;"&xml")
				
				  //arc
				$Txt_pathDatas:=$Txt_pathDatas+" A"+String:C10($Num_rayon;"&xml")+","+String:C10($Num_rayon;"&xml")
				$Txt_pathDatas:=$Txt_pathDatas+" 0 "
				
				$Txt_pathDatas:=Choose:C955(($Num_stop-$Num_start)>180;$Txt_pathDatas+"1,1 ";$Txt_pathDatas+"0,1 ")
				
				$Txt_pathDatas:=$Txt_pathDatas+String:C10($Num_cx2;"&xml")+","+String:C10($Num_cy2;"&xml")
				
				$Txt_pathDatas:=$Txt_pathDatas+" z"
				
				$Dom_object:=DOM Create XML element:C865($Dom_parent;"path";\
					"d";$Txt_pathDatas)
				
				  //SVG_SET_FILL_BRUSH ($Txt_nodeReference;$Txt_fillColor){
				If (OK=1)\
					 & (Length:C16($Txt_fillColor)>0)
					
					$Lon_x:=Position:C15(":";$Txt_fillColor)
					
					If ($Lon_x>0)
						
						$Lon_opacity:=Num:C11(Substring:C12($Txt_fillColor;$Lon_x+1))
						$Txt_fillColor:=Lowercase:C14(Substring:C12($Txt_fillColor;1;$Lon_x-1))
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
							"fill";$Txt_fillColor)
						
						If (OK=1)
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"fill-opacity";$Lon_opacity/100)
							
						End if 
						
					Else 
						
						If ($Txt_fillColor="url(@")
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"fill";$Txt_fillColor)
							
						Else 
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"fill";Lowercase:C14($Txt_fillColor))
							
						End if 
					End if 
				End if 
				  //}
				
			Else 
				
				  //First the background {
				If ($Txt_fillColor#"none")
					
					  //moveto
					$Txt_pathDatas:="M"+String:C10($Num_cx;"&xml")+","+String:C10($Num_cy;"&xml")
					
					  //lineto
					$Txt_pathDatas:=$Txt_pathDatas+" L"+String:C10($Num_linetox;"&xml")+","+String:C10($Num_linetoy;"&xml")
					
					  //arc
					$Txt_pathDatas:=$Txt_pathDatas+" A"+String:C10($Num_rayon;"&xml")+","+String:C10($Num_rayon;"&xml")
					$Txt_pathDatas:=$Txt_pathDatas+" 0 "
					
					$Txt_pathDatas:=Choose:C955(($Num_stop-$Num_start)>180;$Txt_pathDatas+"1,1 ";$Txt_pathDatas+"0,1 ")
					
					$Txt_pathDatas:=$Txt_pathDatas+String:C10($Num_cx2;"&xml")+","+String:C10($Num_cy2;"&xml")
					
					  //close
					$Txt_pathDatas:=$Txt_pathDatas+" z"
					
					$Dom_object:=DOM Create XML element:C865($Dom_parent;"path";\
						"d";$Txt_pathDatas;\
						"stroke";"none")
					
					If (OK=1)\
						 & (Length:C16($Txt_fillColor)>0)
						
						$Lon_x:=Position:C15(":";$Txt_fillColor)
						
						If ($Lon_x>0)
							
							$Lon_opacity:=Num:C11(Substring:C12($Txt_fillColor;$Lon_x+1))
							$Txt_fillColor:=Lowercase:C14(Substring:C12($Txt_fillColor;1;$Lon_x-1))
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"fill";$Txt_fillColor)
							
							If (OK=1)
								
								DOM SET XML ATTRIBUTE:C866($Dom_object;\
									"fill-opacity";$Lon_opacity/100)
								
							End if 
							
						Else 
							
							If ($Txt_fillColor="url(@")
								
								DOM SET XML ATTRIBUTE:C866($Dom_object;\
									"fill";$Txt_fillColor)
								
							Else 
								
								DOM SET XML ATTRIBUTE:C866($Dom_object;\
									"fill";Lowercase:C14($Txt_fillColor))
								
							End if 
						End if 
					End if 
				End if 
				  //}
				
				  //Then Arc {
				If (OK=1)
					
					  //moveto
					$Txt_pathDatas:="M"+String:C10($Num_linetox;"&xml")+","+String:C10($Num_linetoy;"&xml")
					
					  //arc
					$Txt_pathDatas:=$Txt_pathDatas+" A"+String:C10($Num_rayon;"&xml")+","+String:C10($Num_rayon;"&xml")
					$Txt_pathDatas:=$Txt_pathDatas+" 0 "
					
					Case of 
							
							  //__________________________________________________________________________________________
						: (Abs:C99($Num_stop-$Num_start)>180)
							
							$Txt_pathDatas:=$Txt_pathDatas+"1,1 "
							
							  //__________________________________________________________________________________________
						Else 
							
							$Txt_pathDatas:=$Txt_pathDatas+"0,1 "
							
							  //__________________________________________________________________________________________
					End case 
					
					$Txt_pathDatas:=$Txt_pathDatas+String:C10($Num_cx2;"&xml")+","+String:C10($Num_cy2;"&xml")
					
					$Dom_object:=DOM Create XML element:C865($Dom_parent;"path";\
						"d";$Txt_pathDatas)
					
					If (OK=1)
						
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
							"fill";"none")
						
					End if 
				End if 
				  //}
				
			End if 
			
			If (OK=1)
				
				  //SVG_SET_STROKE_BRUSH ($Txt_nodeReference;$Txt_strokeColor){
				If (OK=1)\
					 & (Length:C16($Txt_strokeColor)>0)
					
					$Lon_x:=Position:C15(":";$Txt_strokeColor)
					
					If ($Lon_x>0)
						
						$Lon_opacity:=Num:C11(Substring:C12($Txt_strokeColor;$Lon_x+1))
						$Txt_strokeColor:=Lowercase:C14(Substring:C12($Txt_strokeColor;1;$Lon_x-1))
						DOM SET XML ATTRIBUTE:C866($Dom_object;\
							"stroke";$Txt_strokeColor)
						
						If (OK=1)
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"stroke-opacity";$Lon_opacity/100)
							
						End if 
						
					Else 
						
						If ($Txt_strokeColor="url(@")
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"stroke";$Txt_strokeColor)
							
						Else 
							
							DOM SET XML ATTRIBUTE:C866($Dom_object;\
								"stroke";Lowercase:C14($Txt_strokeColor))
							
						End if 
					End if 
				End if 
				  //}
				
			End if 
		End if 
		
		  //SVG_SET_STROKE_WIDTH ($Txt_nodeReference;$Num_strokeWidth) {
		If (OK=1)\
			 & ($Num_strokeWidth#-1)
			
			DOM SET XML ATTRIBUTE:C866($Dom_object;\
				"stroke-width";$Num_strokeWidth)
			
		End if 
		  //}
		
		If (OK=1)
			
			  //Set the id {
			If (Storage:C1525.svg.options ?? 1)
				
				DOM SET XML ATTRIBUTE:C866($Dom_object;\
					"id";$Dom_object)
				
			End if 
			  //}
			
			If (OK=1)
				
				$0:=$Dom_object
				
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 