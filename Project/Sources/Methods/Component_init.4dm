//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Component_init
// Created 16/06/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// Initialisations of the component's objects
// ----------------------------------------------------
#DECLARE() : Boolean

// Make component usable in preemptive processes
If (Storage:C1525.svg=Null:C1517)
	
	var $svg:=New shared object:C1526
	
	Use (Storage:C1525)
		
		Storage:C1525.svg:=$svg
		
	End use 
	
	Use ($svg)
		
		// Default options
		$svg.options:=Component_defaultOptions
		
		// Default values
		$svg.strokeColor:="black"
		$svg.fillColor:="white"
		$svg.encoding:="UTF-8"
		
		// Constants
		$svg.fe_inValues:="SourceGraphic|SourceAlpha|"
		$svg.fe_in2Values:="over|in|out|atop|"
		$svg.feComposite_operatorValues:="over|normal|in|out|atop|"
		$svg.feColorMatrix_typeValues:="matrix|saturate|hueRotate|luminanceToAlpha|"
		
		// Lists
		var $lists : Object:=JSON Parse:C1218(Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"lists.json"))
		var $key; $value : Text
		
		For each ($key; $lists)
			
			$svg[$key]:=New shared collection:C1527
			
			For each ($value; $lists[$key])
				
				$svg[$key].push($value)
				
			End for each 
		End for each 
		
		$svg.generator:=Replace string:C233(Replace string:C233("4D SVG v{v} ©4D SAS, {y}."; "{v}"; SVG_Get_version); "{y}"; "2008-"+String:C10(Year of:C25(Current date:C33)))
		$svg.system:=System info:C1571.osVersion
		
	End use 
End if 

// Version update of the stored datas
//       Get the latest version number and compare the current number
//

return True:C214  // True if all is OK