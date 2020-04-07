//%attributes = {}
C_LONGINT:C283($Lon_error;$Lon_i;$Lon_ii)
C_TEXT:C284($Dom_root;$File_xml;$kTxt_patternTemplate;$kTxt_replacement;$Txt_buffer;$Txt_label;$Txt_method;$Txt_pattern)
C_TEXT:C284($Txt_value)

ARRAY TEXT:C222($tDom_groups;0)
ARRAY TEXT:C222($tDom_units;0)
ARRAY TEXT:C222($tTxt_Path;0)
ARRAY TEXT:C222($tTxt_values;0)

$kTxt_patternTemplate:="(?m)^(.*?(?:SVG_|SVGTool_).*?[^\"])(%)((?:;|\\))+.*?)$"
$kTxt_replacement:="\\1\"\\2\"\\3"

  //1] Get the constants' names & values from the XML
  //__________________________________________
$File_xml:=Get 4D folder:C485(Current resources folder:K5:16)+"constants.xml"

If (Test path name:C476($File_xml)=Is a document:K24:1)
	
	$Dom_root:=DOM Parse XML source:C719($File_xml)
	
	If (OK=1)
		
		$tDom_groups{0}:=DOM Find XML element:C864($Dom_root;"xliff/file/body/group";$tDom_groups)
		
		If (OK=1)
			
			For ($Lon_i;2;Size of array:C274($tDom_groups);1)
				
				$tDom_units{0}:=DOM Find XML element:C864($tDom_groups{$Lon_i};"group/trans-unit";$tDom_units)
				
				For ($Lon_ii;1;Size of array:C274($tDom_units);1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($tDom_units{$Lon_ii};"d4:value";$Txt_value)
					DOM GET XML ELEMENT VALUE:C731(DOM Find XML element:C864($tDom_units{$Lon_ii};"trans-unit/source");$Txt_label)
					
					APPEND TO ARRAY:C911($tTxt_labels;$Txt_label)
					APPEND TO ARRAY:C911($tTxt_values;$Txt_value)
					
				End for 
			End for 
		End if 
		
		DOM CLOSE XML:C722($Dom_root)
		
		  //Remove 4D constants (numeric values) that are always available.
		For ($Lon_i;1;Size of array:C274($tTxt_labels);1)
			
			If (String:C10(Num:C11($tTxt_values{$Lon_i}))#$tTxt_values{$Lon_i})
				
				$tTxt_labels:=$tTxt_labels+1
				$tTxt_labels{$tTxt_labels}:=$tTxt_labels{$Lon_i}
				
			End if 
		End for 
		
		ARRAY TEXT:C222($tTxt_labels;$tTxt_labels)
		
		  //2] Repair the methods
		  //__________________________________________
		If (False:C215)
			
			  //Get the methods' path
			METHOD GET PATHS:C1163(Path all objects:K72:16;$tTxt_Path;*)
			
			For ($Lon_i;1;Size of array:C274($tTxt_Path);1)
				
				  //Get the code of the method
				METHOD GET CODE:C1190($tTxt_Path{$Lon_i};$Txt_method;*)
				
				  //For each constant, make the replacement
				For ($Lon_ii;1;Size of array:C274($tTxt_labels);1)
					
					$Txt_pattern:=Replace string:C233($kTxt_patternTemplate;"%";$tTxt_labels{$Lon_ii})
					
					Repeat 
						
						$Txt_buffer:=$Txt_method
						$Lon_error:=Rgx_SubstituteText ($Txt_pattern;$kTxt_replacement;->$Txt_method;0)
						
					Until (($Lon_error#0)\
						 | ($Txt_buffer=$Txt_method))
					
				End for 
				
				  //set the modified code
				METHOD SET CODE:C1194($tTxt_Path{$Lon_i};$Txt_method;*)
				
			End for 
		End if 
	End if 
End if 