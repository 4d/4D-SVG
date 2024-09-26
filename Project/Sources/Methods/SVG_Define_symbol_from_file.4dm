//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : SVG_Define_symbol_from_file
// Created 06/11/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Create a symbol from a file
// ----------------------------------------------------
_O_C_TEXT:C284($0)
_O_C_TEXT:C284($1)
_O_C_TEXT:C284($2)
_O_C_TEXT:C284($3)
_O_C_REAL:C285($4)
_O_C_REAL:C285($5)
_O_C_REAL:C285($6)
_O_C_REAL:C285($7)
_O_C_TEXT:C284($8)

_O_C_BOOLEAN:C305($Boo_link)
_O_C_LONGINT:C283($Lon_parameters)
_O_C_REAL:C285($Num_height; $Num_width; $Num_x; $Num_y)
_O_C_TEXT:C284($kTxt_currentMethod; $kTxt_Values; $Txt_defsID; $Txt_ID; $Txt_Path; $Txt_preserveAspectRatio)
_O_C_TEXT:C284($Txt_resourcesPath; $Txt_rootReference; $Txt_SourceRef; $Txt_svgObject; $Txt_symbolID)

If (False:C215)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $0)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $1)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $2)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $3)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $4)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $5)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $6)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $7)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $8)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=3)
	
	$Txt_svgObject:=$1
	$Txt_ID:=$2
	$Txt_Path:=$3
	
	If ($Txt_Path[[1]]="#")\
		 | ($Txt_Path[[1]]="file:@")  //Relative path in the resources folder.
		
		$Boo_link:=True:C214
		
		//Calculate the absolute path {
		$Txt_Path:=Choose:C955($Txt_Path="file:@"; Replace string:C233($Txt_Path; "file:"; ""; 1); Delete string:C232($Txt_Path; 1; 1))
		$Txt_resourcesPath:=Get 4D folder:C485(Current resources folder:K5:16; *)
		$Txt_path:=$Txt_resourcesPath+Replace string:C233($Txt_Path; "/"; Folder separator:K24:12)
		//}
		
	End if 
	
	OK:=Num:C11(Test path name:C476($Txt_path)=Is a document:K24:1)
	
	If (OK=1)
		
		$Num_x:=-1
		
		If ($Lon_parameters>=7)  //viewBox
			
			$Num_x:=$4
			$Num_y:=$5
			$Num_width:=$6
			$Num_height:=$7
			
			If ($Lon_parameters>=8)  //preserveAspectRatio
				
				$Txt_preserveAspectRatio:=$8
				
			End if 
		End if 
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		$Txt_defsID:=getDefs($Txt_svgObject)
		
		If (OK=1)
			
			$Txt_symbolID:=DOM Find XML element by ID:C1010($Txt_defsID; $Txt_ID)
			
			If (OK=1)  //Delete the existing symbol
				
				DOM REMOVE XML ELEMENT:C869($Txt_symbolID)
				
			End if 
			
			//Create the symbol {
			$Txt_SourceRef:=DOM Parse XML source:C719($Txt_path)
			
			If (OK=1)
				
				$Txt_SourceRef:=DOM Find XML element:C864($Txt_SourceRef; "svg/defs/symbol")
				
				If (OK=1)
					
					$Txt_symbolID:=xml_Duplicate_element($Txt_SourceRef; $Txt_defsID)
					
					If (OK=1)
						
						DOM SET XML ATTRIBUTE:C866($Txt_symbolID; \
							"id"; $Txt_ID)
						
					End if 
				End if 
			End if 
			//}
			
			//viewBox
			//{
			If (OK=1)\
				 & ($Num_x#-1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_symbolID; \
					"viewBox"; String:C10($Num_x)+" "+String:C10($Num_y)+" "+String:C10($Num_width)+" "+String:C10($Num_height))
				
			End if 
			//}
			
			//preserveAspectRatio {
			If (OK=1)\
				 & (Length:C16($Txt_preserveAspectRatio)>0)
				
				$kTxt_Values:="true|none|xMinYMin|xMidYMin|xMaxYMin|xMinYMid|xMidYMid|xMaxYMid|xMinYMax|xMidYMax|xMaxYMax|"
				
				If (Position:C15($Txt_preserveAspectRatio; $kTxt_Values)>0)
					
					If ($Txt_preserveAspectRatio="true")
						
						DOM SET XML ATTRIBUTE:C866($Txt_symbolID; \
							"preserveAspectRatio"; "xMidYMid")  //Default value
						
					Else 
						
						DOM SET XML ATTRIBUTE:C866($Txt_symbolID; \
							"preserveAspectRatio"; $Txt_preserveAspectRatio)
						
					End if 
					
				Else 
					
					ASSERT:C1129(Component_putError(8853))  //Invalid Value for an attribute
					
				End if 
			End if 
			//}
			
		End if 
		
		If (OK=1)
			
			$0:=$Txt_symbolID
			
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(-43; $kTxt_currentMethod))  //File not found
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; $kTxt_currentMethod))  //Parameters Missing
	
End if 