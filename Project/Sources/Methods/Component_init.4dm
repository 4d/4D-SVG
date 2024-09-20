//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Component_init
// Created 16/06/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Initialisations of the component's objects
// ----------------------------------------------------
#DECLARE() : Boolean

var $Txt_list; $Txt_value : Text
var $Obj_list; $Obj_svg : Object

// Make component usable in preemptive processes
If (Storage:C1525.svg=Null:C1517)
	
	$Obj_svg:=New shared object:C1526
	
	Use (Storage:C1525)
		
		Storage:C1525.svg:=$Obj_svg
		
	End use 
	
	Use ($Obj_svg)
		
		// Default options
		$Obj_svg.options:=Component_defaultOptions
		
		// Default values
		$Obj_svg.strokeColor:="black"
		$Obj_svg.fillColor:="white"
		$Obj_svg.encoding:="UTF-8"
		
		// Constants
		$Obj_svg.fe_inValues:="SourceGraphic|SourceAlpha|"
		$Obj_svg.fe_in2Values:="over|in|out|atop|"
		$Obj_svg.feComposite_operatorValues:="over|normal|in|out|atop|"
		$Obj_svg.feColorMatrix_typeValues:="matrix|saturate|hueRotate|luminanceToAlpha|"
		
		// Lists
		$Obj_list:=JSON Parse:C1218(Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"lists.json"))
		
		For each ($Txt_list; $Obj_list)
			
			$Obj_svg[$Txt_list]:=New shared collection:C1527
			
			For each ($Txt_value; $Obj_list[$Txt_list])
				
				$Obj_svg[$Txt_list].push($Txt_value)
				
			End for each 
		End for each 
		
		$Obj_svg.generator:=Replace string:C233(Replace string:C233("4D SVG v{v} ©4D SAS, {y}."; "{v}"; SVG_Get_version); "{y}"; "2008-"+String:C10(Year of:C25(Current date:C33)))
		$Obj_svg.system:=System info:C1571.osVersion
		
	End use 
End if 

// Version update of the stored datas
//      Get the latest version number and compare the current number
//

return True:C214  // True if all is OK
