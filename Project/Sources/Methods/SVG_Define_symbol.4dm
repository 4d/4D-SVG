//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_symbol
  // Created 08/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Declare a new symbol in the defs node
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)
C_TEXT:C284($7)

C_LONGINT:C283($Lon_parameters)
C_REAL:C285($Num_height;$Num_width;$Num_x;$Num_y)
C_TEXT:C284($kTxt_currentMethod;$kTxt_Values;$Txt_defsID;$Txt_ID;$Txt_preserveAspectRatio;$Txt_rootReference)
C_TEXT:C284($Txt_svgObject;$Txt_symbolID)

If (False:C215)
	C_TEXT:C284(SVG_Define_symbol ;$0)
	C_TEXT:C284(SVG_Define_symbol ;$1)
	C_TEXT:C284(SVG_Define_symbol ;$2)
	C_REAL:C285(SVG_Define_symbol ;$3)
	C_REAL:C285(SVG_Define_symbol ;$4)
	C_REAL:C285(SVG_Define_symbol ;$5)
	C_REAL:C285(SVG_Define_symbol ;$6)
	C_TEXT:C284(SVG_Define_symbol ;$7)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	
	$Num_x:=-1
	
	If ($Lon_parameters>=6)  //viewBox
		
		$Num_x:=$3
		$Num_y:=$4
		$Num_width:=$5
		$Num_height:=$6
		
		If ($Lon_parameters>=7)  //preserveAspectRatio
			
			$Txt_preserveAspectRatio:=$7
			
		End if 
	End if 
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	  //Get defs node reference {
	  //First, go back to the main node (<SVG>)...
	$Txt_rootReference:=DOM Get root XML element:C1053($Txt_svgObject)
	
	  //...and find the 'defs' node...
	$Txt_defsID:=DOM Find XML element:C864($Txt_rootReference;"svg/defs")
	
	  //...finally create it if it does not.
	If (OK=0)
		
		$Txt_defsID:=DOM Create XML element:C865($Txt_rootReference;"defs")
		
	End if 
	  //}
	
	If (OK=1)
		
		$Txt_symbolID:=DOM Find XML element by ID:C1010($Txt_defsID;$Txt_ID)
		
		If (OK=1)  //Delete the existing symbol
			
			DOM REMOVE XML ELEMENT:C869($Txt_symbolID)
			
		End if 
		
		  //Create the symbol {
		$Txt_symbolID:=DOM Create XML element:C865($Txt_defsID;"symbol";\
			"id";$Txt_ID)
		  //}
		
		  //viewBox {
		If (OK=1)\
			 & ($Num_x#-1)
			
			DOM SET XML ATTRIBUTE:C866($Txt_symbolID;"viewBox";\
				String:C10($Num_x;"&xml")+" "\
				+String:C10($Num_y;"&xml")+" "\
				+String:C10($Num_width;"&xml")+" "\
				+String:C10($Num_height;"&xml"))
			
		End if 
		  //}
		
		  //preserveAspectRatio {
		If (OK=1)\
			 & (Length:C16($Txt_preserveAspectRatio)>0)
			
			$kTxt_Values:="true|none|xMinYMin|xMidYMin|xMaxYMin|xMinYMid|xMidYMid|xMaxYMid|xMinYMax|xMidYMax|xMaxYMax|"
			
			If (Position:C15($Txt_preserveAspectRatio;$kTxt_Values)>0)
				
				If ($Txt_preserveAspectRatio="true")
					
					DOM SET XML ATTRIBUTE:C866($Txt_symbolID;\
						"preserveAspectRatio";"xMidYMid")  //Default value
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Txt_symbolID;\
						"preserveAspectRatio";$Txt_preserveAspectRatio)
					
				End if 
				
			Else 
				
				ASSERT:C1129(Component_putError (8853))  //Invalid Value for an attribute
				
			End if 
		End if 
		  //}
		
	End if 
	
	If (OK=1)
		
		$0:=$Txt_symbolID
		
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 