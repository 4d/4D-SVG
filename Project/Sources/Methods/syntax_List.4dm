//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : syntax_List
// Database: 4D SVG
// ID[57E1469DC7E14BD1B76BFF65ADC82BAB]
// Created #23-5-2013 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE() : Integer

var $node; $pathname; $root; $t : Text
var $commands; $i; $id; $list; $Lon_parameters; $size : Integer

ARRAY TEXT:C222($_nodes; 0)

$pathname:=Localized document path:C1105("4DPop.xlf")

If (Asserted:C1132(Test path name:C476($pathname)=Is a document:K24:1))
	
	$root:=DOM Parse XML source:C719($pathname)
	
	If (OK=1)
		
		$node:=DOM Find XML element by ID:C1010($root; "commands")
		
		If (OK=1)
			
			$_nodes{0}:=DOM Find XML element:C864($node; "group/trans-unit"; $_nodes)
			$size:=Size of array:C274($_nodes)
			
			ARRAY TEXT:C222($tTxt_names; $size)
			ARRAY TEXT:C222($tTxt_theme; $size)
			ARRAY LONGINT:C221($tLon_command; $size)
			
			For ($i; 1; $size; 1)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($_nodes{$i}; "extradata"; $tTxt_theme{$i})
				DOM GET XML ATTRIBUTE BY NAME:C728($_nodes{$i}; "resname"; $tTxt_names{$i})
				DOM GET XML ATTRIBUTE BY NAME:C728($_nodes{$i}; "help-id"; $tLon_command{$i})
				
			End for 
		End if 
		
		SORT ARRAY:C229($tTxt_theme; $tTxt_names; $tLon_command)
		
		$list:=New list:C375
		
		For ($i; 1; $size; 1)
			
			If ($tTxt_theme{$i}#$tTxt_theme{0})  //new theme
				
				$tTxt_theme{0}:=$tTxt_theme{$i}
				$t:=$tTxt_theme{0}
				
				$node:=DOM Find XML element by ID:C1010($root; $t)
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($node; "help-id"; $id)
					
					$commands:=New list:C375
					APPEND TO LIST:C376($list; Localized string:C991($t); $id; $commands; False:C215)
					SET LIST ITEM PROPERTIES:C386($list; $id; False:C215; Bold:K14:2; 0)
					
				End if 
			End if 
			
			APPEND TO LIST:C376($commands; $tTxt_names{$i}; Choose:C955($tLon_command{$i}#0; $tLon_command{$i}; $id))
			
		End for 
		
		DOM CLOSE XML:C722($root)
		
		SORT LIST:C391($list)
		
	End if 
End if 

return $list