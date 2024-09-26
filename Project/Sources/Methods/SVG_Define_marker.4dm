//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_marker
// Created 04/09/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
_O_C_TEXT:C284($0)
_O_C_TEXT:C284($1)
_O_C_TEXT:C284($2)
_O_C_REAL:C285($3)
_O_C_REAL:C285($4)
_O_C_REAL:C285($5)
_O_C_REAL:C285($6)
_O_C_REAL:C285($7)
_O_C_TEXT:C284($8)

_O_C_LONGINT:C283($Lon_parameters)
_O_C_REAL:C285($Num_height; $Num_orient; $Num_rotation; $Num_width; $Num_x; $Num_y)
_O_C_TEXT:C284($kTxt_currentMethod; $Txt_defsID; $Txt_ID; $Txt_markerUnits; $Txt_nodeReference; $Txt_rootReference)
_O_C_TEXT:C284($Txt_svgObject)

If (False:C215)
	_O_C_TEXT:C284(SVG_Define_marker; $0)
	_O_C_TEXT:C284(SVG_Define_marker; $1)
	_O_C_TEXT:C284(SVG_Define_marker; $2)
	_O_C_REAL:C285(SVG_Define_marker; $3)
	_O_C_REAL:C285(SVG_Define_marker; $4)
	_O_C_REAL:C285(SVG_Define_marker; $5)
	_O_C_REAL:C285(SVG_Define_marker; $6)
	_O_C_REAL:C285(SVG_Define_marker; $7)
	_O_C_TEXT:C284(SVG_Define_marker; $8)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	
	$Num_x:=-1
	$Num_width:=-1
	$Num_rotation:=-1
	
	If ($Lon_parameters>=4)
		
		$Num_x:=$3  //refX
		$Num_y:=$4  //refYters>=6)
		$Num_width:=$5  //markerWidth
		$Num_height:=$6  //markerHeight
		
		If ($Lon_parameters>=7)
			
			$Num_orient:=$7  //orient
			
			If ($Lon_parameters>=8)  //markerUnits
				
				$Txt_markerUnits:=$8
				
			End if 
		End if 
	End if 
	
	Component_errorHandler("init"; $kTxt_currentMethod)
	
	$Txt_defsID:=getDefs($Txt_svgObject)
	
	If (OK=1)
		
		$Txt_nodeReference:=DOM Find XML element by ID:C1010($Txt_defsID; $Txt_ID)
		
		If (OK=1)  //Delete the existing symbol
			
			DOM REMOVE XML ELEMENT:C869($Txt_nodeReference)
			
		End if 
	End if 
	
	//Create the symbol {
	$Txt_nodeReference:=DOM Create XML element:C865($Txt_defsID; "marker"; \
		"id"; $Txt_ID)
	//}
	
	//refX/refY {
	If (OK=1)\
		 & ($Num_x#-1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_nodeReference; \
			"refX"; $Num_x; \
			"refY"; $Num_y)
		
	End if 
	//}
	
	//markerWidth/markerHeight {
	If (OK=1)\
		 & ($Num_width#-1)
		
		DOM SET XML ATTRIBUTE:C866($Txt_nodeReference; \
			"markerWidth"; $Num_width; \
			"markerHeight"; $Num_height)
		
	End if 
	//}
	
	//orient {
	If (OK=1)
		
		If ($Num_orient#-1)\
			 & (Abs:C99($Num_orient)<=360)
			
			DOM SET XML ATTRIBUTE:C866($Txt_nodeReference; \
				"orient"; $Num_orient)
			
		Else 
			
			DOM SET XML ATTRIBUTE:C866($Txt_nodeReference; \
				"orient"; "auto")
			
		End if 
	End if 
	//}
	
	//markerUnits {
	If (OK=1)\
		 & (Length:C16($Txt_markerUnits)>0)
		
		DOM SET XML ATTRIBUTE:C866($Txt_nodeReference; \
			"markerUnits"; $Txt_markerUnits)
		
	End if 
	//}
	
	If (OK=1)
		
		$0:=$Txt_nodeReference
		
	End if 
	
	ASSERT:C1129(Component_errorHandler("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 