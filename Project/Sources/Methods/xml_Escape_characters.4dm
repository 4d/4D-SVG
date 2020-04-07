//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : xml_Escape_characters
  // Database: 4D SVG
  // ID[65529C66F0BD4ADB99224E368FD6C504]
  // Created #25-1-2017 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Encode special characters
  //    ampersand (&) is escaped to &amp;
  //    double quotes (") are escaped to &quot;
  //    single quotes (') are escaped to &apos;
  //    less than (<) is escaped to &lt;
  //    greater than (>) is escaped to &gt;
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Txt_escaped;$Txt_text)

If (False:C215)
	C_TEXT:C284(xml_Escape_characters ;$0)
	C_TEXT:C284(xml_Escape_characters ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	  //Required parameters
	$Txt_text:=$1
	
	  //Optional parameters
	If ($Lon_parameters>=2)
		
		  // <NONE>
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
$Txt_escaped:=Replace string:C233($Txt_text;"&";"&amp;")
$Txt_escaped:=Replace string:C233($Txt_escaped;"\"";"&quot;")
$Txt_escaped:=Replace string:C233($Txt_escaped;"'";"&apos;")
$Txt_escaped:=Replace string:C233($Txt_escaped;"<";"&lt;")
$Txt_escaped:=Replace string:C233($Txt_escaped;">";"&gt;")

  // ----------------------------------------------------
  // Return
$0:=$Txt_escaped

  // ----------------------------------------------------
  // End