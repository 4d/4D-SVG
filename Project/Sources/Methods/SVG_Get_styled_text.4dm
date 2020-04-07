//%attributes = {"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_Get_styled_text
  // Database: 4D SVG
  // ID[9C9CC818C03E4C3D95A96067B5A0E111]
  // Created #21-7-2016 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

C_BOOLEAN:C305($Boo_data)
C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_buffer;$Txt_name;$Txt_style;$Txt_styledText)

ARRAY LONGINT:C221($tLon_nodeTypes;0)
ARRAY TEXT:C222($tTxt_nodeTexts;0)

If (False:C215)
	C_TEXT:C284(SVG_Get_styled_text ;$0)
	C_TEXT:C284(SVG_Get_styled_text ;$1)
	C_BOOLEAN:C305(SVG_Get_styled_text ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	  //Required parameters
	$Dom_svgObject:=$1
	
	$Boo_data:=True:C214
	
	  //Optional parameters
	If ($Lon_parameters>=2)
		
		$Boo_data:=$2
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_name)
	
	If ($Txt_name="text")\
		 | ($Txt_name="textArea")\
		 | ($Txt_name="tspan")
		
		DOM GET XML CHILD NODES:C1081($Dom_svgObject;$tLon_nodeTypes;$tTxt_nodeTexts)
		
		For ($Lon_i;1;Size of array:C274($tLon_nodeTypes);1)
			
			Case of 
					
					  //______________________________________________________
				: ($tLon_nodeTypes{$Lon_i}=XML DATA:K45:12)
					
					If ($Boo_data)
						
						$tTxt_nodeTexts{$Lon_i}:=Replace string:C233($tTxt_nodeTexts{$Lon_i};"\r";"")
						$tTxt_nodeTexts{$Lon_i}:=Replace string:C233($tTxt_nodeTexts{$Lon_i};"\n";"")
						
						$Txt_styledText:=$Txt_styledText+$tTxt_nodeTexts{$Lon_i}
						
					End if 
					
					  //______________________________________________________
				: ($tLon_nodeTypes{$Lon_i}=XML ELEMENT:K45:20)
					
					DOM GET XML ELEMENT NAME:C730($tTxt_nodeTexts{$Lon_i};$Txt_name)
					
					Case of 
							
							  //………………………………………………………………………………………………………
						: ($Txt_name="tbreak")
							
							$Txt_styledText:=$Txt_styledText+"<BR/>"
							
							  //………………………………………………………………………………………………………
						: ($Txt_name="tspan")
							
							$Txt_buffer:=SVG_Get_styled_text ($tTxt_nodeTexts{$Lon_i};False:C215)
							$Txt_styledText:=$Txt_styledText+$Txt_buffer
							
							DOM GET XML ELEMENT VALUE:C731($tTxt_nodeTexts{$Lon_i};$Txt_buffer)
							
							DOM GET XML ATTRIBUTE BY NAME:C728($tTxt_nodeTexts{$Lon_i};"style";$Txt_style)
							
							$Txt_styledText:=$Txt_styledText+"<SPAN STYLE=\""+$Txt_style+"\">"+$Txt_buffer+"</SPAN>"
							
							  //………………………………………………………………………………………………………
					End case 
					
					  //______________________________________________________
			End case 
		End for 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8854;$kTxt_currentMethod))  //Impossible to apply this Command for this Node
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
	
End if 

  // ----------------------------------------------------
  // Return

$0:=$Txt_styledText

  // ----------------------------------------------------
  // End