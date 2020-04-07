//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Get_text
  // Created 23/04/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Returns the text for an element <text> or a <textArea> element
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($Dom_svgObject;$kTxt_currentMethod;$Txt_buffer;$Txt_container;$Txt_name;$Txt_text)

ARRAY LONGINT:C221($tLon_types;0)
ARRAY TEXT:C222($tDom_nodes;0)

If (False:C215)
	C_TEXT:C284(SVG_Get_text ;$0)
	C_TEXT:C284(SVG_Get_text ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Get_text"

  // ----------------------------------------------------
If ($Lon_parameters>=1)
	
	$Dom_svgObject:=$1
	
	If (Asserted:C1132(xml_referenceValid ($Dom_svgObject);Get localized string:C991("error_badReference")))
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		  //#Silvio_bug ----------------------------------------------------------- {
		  //DOM GET XML ELEMENT NAME($Dom_svgObject;$Txt_name)
		  //If ($Txt_name="text") | ($Txt_name="textArea") | ($Txt_name="tspan")
		DOM GET XML ELEMENT NAME:C730($Dom_svgObject;$Txt_container)
		
		If ($Txt_container="text")\
			 | ($Txt_container="textArea")\
			 | ($Txt_container="tspan")
			  // -------------------------------------------------------------------- }
			
			DOM GET XML CHILD NODES:C1081($Dom_svgObject;$tLon_types;$tDom_nodes)
			
			For ($Lon_i;1;Size of array:C274($tLon_types);1)
				
				Case of 
						
						  //______________________________________________________
					: ($tLon_types{$Lon_i}=XML DATA:K45:12)
						
						$tDom_nodes{$Lon_i}:=Replace string:C233($tDom_nodes{$Lon_i};"\r";"")
						$tDom_nodes{$Lon_i}:=Replace string:C233($tDom_nodes{$Lon_i};"\n";"")
						
						$Txt_text:=$Txt_text+$tDom_nodes{$Lon_i}
						
						  //______________________________________________________
					: ($tLon_types{$Lon_i}=XML ELEMENT:K45:20)
						
						DOM GET XML ELEMENT NAME:C730($tDom_nodes{$Lon_i};$Txt_name)
						
						Case of 
								
								  //………………………………………………………………………………………………………
							: ($Txt_name="tbreak")
								
								$Txt_text:=$Txt_text+"\r"
								
								  //………………………………………………………………………………………………………
							: ($Txt_name="tspan")
								
								  //#ACI0087022
								  // Something to do ;-)
								DOM GET XML ELEMENT VALUE:C731($tDom_nodes{$Lon_i};$Txt_buffer)
								
								  //#Silvio_bug ----------------------------------------------------------- {
								  //$Txt_text:=$Txt_text+Choose(Length($Txt_buffer)>0;"\r"+$Txt_buffer;"")
								If ($Txt_container="textArea")
									
									  // The carriage return are managed with tbreak elements
									$Txt_text:=$Txt_text+$Txt_buffer
									
								Else 
									
									$Txt_text:=Choose:C955(Length:C16($Txt_text)>0;$Txt_text+"\r";"")+$Txt_buffer
									
								End if 
								  // ---------------------------------------------------------------------- }
								
								  //………………………………………………………………………………………………………
						End case 
						
						  //______________________________________________________
				End case 
			End for 
			
			$0:=$Txt_text
			
			ASSERT:C1129(Component_errorHandler ("deinit"))
			
		Else 
			
			ASSERT:C1129(Component_putError (8854;$kTxt_currentMethod))  // Impossible to apply this Command for this Node
			
		End if 
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  // The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  // Parameters Missing
	
End if 