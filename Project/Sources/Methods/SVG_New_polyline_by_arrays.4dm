//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_New_polyline_by_arrays
  // Created 07/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Draw a polyline with the arrays of the coordinates x and y past as arguments
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_POINTER:C301($2)
C_POINTER:C301($3)
C_TEXT:C284($4)
C_TEXT:C284($5)
C_REAL:C285($6)

C_LONGINT:C283($Lon_i;$Lon_opacity;$Lon_parameters;$Lon_Size;$Lon_x)
C_POINTER:C301($Ptr_xArray;$Ptr_yArray)
C_REAL:C285($Num_strokeWidth)
C_TEXT:C284($kTxt_currentMethod;$Txt_fillColor;$Txt_nodeReference;$Txt_parentReference;$Txt_points;$Txt_strokeColor)

If (False:C215)
	C_TEXT:C284(SVG_New_polyline_by_arrays ;$0)
	C_TEXT:C284(SVG_New_polyline_by_arrays ;$1)
	C_POINTER:C301(SVG_New_polyline_by_arrays ;$2)
	C_POINTER:C301(SVG_New_polyline_by_arrays ;$3)
	C_TEXT:C284(SVG_New_polyline_by_arrays ;$4)
	C_TEXT:C284(SVG_New_polyline_by_arrays ;$5)
	C_REAL:C285(SVG_New_polyline_by_arrays ;$6)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=3)
	
	$Txt_parentReference:=$1
	
	$Ptr_xArray:=$2
	$Ptr_yArray:=$3
	
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
	
	If (Asserted:C1132(xml_referenceValid ($Txt_parentReference);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //Build the path with the arrays
		$Lon_Size:=Size of array:C274($Ptr_xArray->)
		
		If (Size of array:C274($Ptr_yArray->)<$Lon_Size)
			
			$Lon_Size:=Size of array:C274($Ptr_yArray->)
			
		End if 
		
		For ($Lon_i;1;$Lon_Size;1)
			
			$Txt_points:=$Txt_points+String:C10($Ptr_xArray->{$Lon_i};"&xml")+","+String:C10($Ptr_yArray->{$Lon_i};"&xml")+(" "*Num:C11($Lon_i<$Lon_Size))
			
		End for 
		
		If (Storage:C1525.svg.options ?? 2)
			
			$Txt_points:=$Txt_points+" "+String:C10($Ptr_xArray->{1};"&xml")+","+String:C10($Ptr_yArray->{1};"&xml")
			
		End if 
		
		  //Draw the line
		$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference;"polyline";\
			"points";$Txt_points)
		
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
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 