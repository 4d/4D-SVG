//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_pattern
  // Created 14/12/09 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)
C_TEXT:C284($7)
C_TEXT:C284($8)

C_LONGINT:C283($Lon_height;$Lon_parameters;$Lon_width;$Lon_x;$Lon_y)
C_TEXT:C284($Dom_defs;$Dom_pattern;$Dom_root;$kTxt_currentMethod;$Txt_ID;$Txt_patternUnits)
C_TEXT:C284($Txt_rootReference;$Txt_svgObject;$Txt_viewBox)

If (False:C215)
	C_TEXT:C284(SVG_Define_pattern ;$0)
	C_TEXT:C284(SVG_Define_pattern ;$1)
	C_TEXT:C284(SVG_Define_pattern ;$2)
	C_REAL:C285(SVG_Define_pattern ;$3)
	C_REAL:C285(SVG_Define_pattern ;$4)
	C_REAL:C285(SVG_Define_pattern ;$5)
	C_REAL:C285(SVG_Define_pattern ;$6)
	C_TEXT:C284(SVG_Define_pattern ;$7)
	C_TEXT:C284(SVG_Define_pattern ;$8)
End if 

  // ----------------------------------------------------
  // Initialisations

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Define_pattern"  //Nom methode courante

$Txt_patternUnits:="userSpaceOnUse"
$Lon_width:=-1
$Lon_height:=-1
$Lon_x:=-1
$Lon_y:=-1

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	
	If ($Lon_parameters>=3)
		
		$Lon_width:=$3
		
		If ($Lon_parameters>=4)
			
			$Lon_height:=$4
			
			If ($Lon_parameters>=5)
				
				$Lon_x:=$5
				
				If ($Lon_parameters>=6)
					
					$Lon_y:=$6
					
					If ($Lon_parameters>=7)
						
						If (Length:C16($7)>0)
							
							$Txt_patternUnits:=$7
							
						End if 
					End if 
					
					If ($Lon_parameters>=8)
						
						$Txt_viewBox:=$8
						
					End if 
				End if 
			End if 
		End if 
	End if 
	
	ARRAY TEXT:C222($tTxt_patternUnits;0x0000)
	COLLECTION TO ARRAY:C1562(Storage:C1525.svg["patternUnits"];$tTxt_patternUnits)
	
	If (Find in array:C230($tTxt_patternUnits;$Txt_patternUnits)>0)
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		$Txt_rootReference:=DOM Get root XML element:C1053($Txt_svgObject)
		
		  //Then define the attribute
		DOM SET XML ATTRIBUTE:C866($Txt_svgObject;\
			"xmlns:xlink";"http://www.w3.org/1999/xlink")
		
		$Dom_pattern:=DOM Find XML element by ID:C1010($Txt_svgObject;$Txt_ID)
		
		If (OK=1)  //Duplicate ID
			
			ASSERT:C1129(Component_putError (8859;$kTxt_currentMethod))
			OK:=0
			
		Else 
			
			  //Get defs node reference {
			  //First, go back to the main node (<SVG>)...
			$Dom_root:=DOM Get root XML element:C1053($Txt_svgObject)
			
			  //...and find the 'defs' node...
			$Dom_defs:=DOM Find XML element:C864($Dom_root;"svg/defs")
			
			  //...finally create it if it does not.
			If (OK=0)
				
				$Dom_defs:=DOM Create XML element:C865($Dom_root;"defs")
				
			End if 
			  //}
			
			  //Create
			$Dom_pattern:=DOM Create XML element:C865($Dom_defs;"pattern";\
				"id";$Txt_ID)  //;"patternUnits";"objectBoundingBox")\
				
			If (OK=1)
				
				DOM SET XML ATTRIBUTE:C866($Dom_pattern;\
					"patternUnits";$Txt_patternUnits)
				
				If ($Lon_width#-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_pattern;\
						"width";$Lon_width)
					
				End if 
				
				If ($Lon_height#-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_pattern;\
						"height";$Lon_height)
					
				End if 
				
				If ($Lon_x#-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_pattern;\
						"x";$Lon_x)
					
				End if 
				
				If ($Lon_y#-1)
					
					DOM SET XML ATTRIBUTE:C866($Dom_pattern;\
						"y";$Lon_y)
					
				End if 
				
				If (Length:C16($Txt_viewBox)>0)
					
					DOM SET XML ATTRIBUTE:C866($Dom_pattern;\
						"viewBox";$Txt_viewBox)
					
				End if 
			End if 
		End if 
		
		$0:=$Dom_pattern*Num:C11(OK=1)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
		
	End if 
	
	  //#ACI0091143
	CLEAR VARIABLE:C89($tTxt_patternUnits)
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 