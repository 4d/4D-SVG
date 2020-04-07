//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : syntax_List
  // Database: 4D SVG
  // ID[57E1469DC7E14BD1B76BFF65ADC82BAB]
  // Created #23-5-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($0)

C_LONGINT:C283($Lon_count;$Lon_i;$Lon_parameters;$Lon_x;$Lst_command;$Lst_syntax)
C_TEXT:C284($Dom_node;$Dom_root;$File_rsrc;$Txt_buffer)

ARRAY TEXT:C222($tDom_nodes;0)

If (False:C215)
	C_LONGINT:C283(syntax_List ;$0)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0;"Missing parameter"))
	
	  //NO PARAMETERS REQUIRED
	
	$File_rsrc:=Get localized document path:C1105("4DPop.xlf")
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
If (Asserted:C1132(Test path name:C476($File_rsrc)=Is a document:K24:1))
	
	$Dom_root:=DOM Parse XML source:C719($File_rsrc)
	
	If (OK=1)
		
		$Dom_node:=DOM Find XML element by ID:C1010($Dom_root;"commands")
		
		If (OK=1)
			
			$tDom_nodes{0}:=DOM Find XML element:C864($Dom_node;"group/trans-unit";$tDom_nodes)
			$Lon_count:=Size of array:C274($tDom_nodes)
			
			ARRAY TEXT:C222($tTxt_names;$Lon_count)
			ARRAY TEXT:C222($tTxt_theme;$Lon_count)
			ARRAY LONGINT:C221($tLon_command;$Lon_count)
			
			For ($Lon_i;1;$Lon_count;1)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($tDom_nodes{$Lon_i};"extradata";$tTxt_theme{$Lon_i})
				DOM GET XML ATTRIBUTE BY NAME:C728($tDom_nodes{$Lon_i};"resname";$tTxt_names{$Lon_i})
				DOM GET XML ATTRIBUTE BY NAME:C728($tDom_nodes{$Lon_i};"help-id";$tLon_command{$Lon_i})
				
			End for 
		End if 
		
		SORT ARRAY:C229($tTxt_theme;$tTxt_names;$tLon_command)
		
		$Lst_syntax:=New list:C375
		
		For ($Lon_i;1;$Lon_count;1)
			
			If ($tTxt_theme{$Lon_i}#$tTxt_theme{0})  //new theme
				
				$tTxt_theme{0}:=$tTxt_theme{$Lon_i}
				$Txt_buffer:=$tTxt_theme{0}
				
				$Dom_node:=DOM Find XML element by ID:C1010($Dom_root;$Txt_buffer)
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node;"help-id";$Lon_x)
					
					$Lst_command:=New list:C375
					APPEND TO LIST:C376($Lst_syntax;Get localized string:C991($Txt_buffer);$Lon_x;$Lst_command;False:C215)
					SET LIST ITEM PROPERTIES:C386($Lst_syntax;$Lon_x;False:C215;Bold:K14:2;0)
					
				End if 
			End if 
			
			APPEND TO LIST:C376($Lst_command;$tTxt_names{$Lon_i};Choose:C955($tLon_command{$Lon_i}#0;$tLon_command{$Lon_i};$Lon_x))
			
		End for 
		
		DOM CLOSE XML:C722($Dom_root)
		
		SORT LIST:C391($Lst_syntax)
		
	End if 
End if 

$0:=$Lst_syntax

  // ----------------------------------------------------
  // End