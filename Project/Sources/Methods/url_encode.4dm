//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : url_encode
  // Database: 4D SVG
  // ID[447F725AD64A4C57AA33541AAAF4F3A9]
  // Created 28-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_charCode;$Lon_i;$Lon_length;$Lon_parameters)
C_TEXT:C284($Txt_encoded;$Txt_url;$Txt_validCharacters)

If (False:C215)
	C_TEXT:C284(url_encode ;$0)
	C_TEXT:C284(url_encode ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Txt_url:=$1
	
	  // #28-10-2014 - XSL transformation is no longer supported
	  // Fill an array with the characters which need no conversion
	$Txt_validCharacters:="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:/.?=_-$(){}~&"
	$Lon_length:=Length:C16($Txt_validCharacters)
	ARRAY LONGINT:C221($tLon_safeCharacters;$Lon_length)
	
	For ($Lon_i;1;$Lon_length;1)
		
		$tLon_safeCharacters{$Lon_i}:=Character code:C91($Txt_validCharacters[[$Lon_i]])
		
	End for 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
  //$Dom_root:=DOM Create XML Ref("string-to-encode")
  //DOM SET XML ELEMENT VALUE($Dom_root;"string-to-encode";$Txt_url)
  //DOM EXPORT TO VAR($Dom_root;$Blb_source)
  //DOM CLOSE XML($Dom_root)
  //$Txt_sheet:="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
  //$Txt_sheet:=$Txt_sheet+"<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" xmlns:str=\"http://exslt.org/strings\">"
  //$Txt_sheet:=$Txt_sheet+"  <xsl:output method=\"text\"/>"
  //$Txt_sheet:=$Txt_sheet+"  <xsl:param name=\"ignore_reserved_charcters\"/>"
  //$Txt_sheet:=$Txt_sheet+"  <xsl:template match=\"/\">"
  //$Txt_sheet:=$Txt_sheet+"    <xsl:value-of select=\"str:encode-uri(/string-to-encode, boolean($ignore_reserved_charcters))\"/>"
  //$Txt_sheet:=$Txt_sheet+"  </xsl:template>"
  //$Txt_sheet:=$Txt_sheet+"</xsl:stylesheet>"
  //CONVERT FROM TEXT($Txt_sheet;"utf-8";$Blb_sheet)
  //_o_XSLT APPLY TRANSFORMATION($Blb_source;$Blb_sheet;$Blb_result)
  //$0:=Convert to text($Blb_result;"utf-8")

  // Convert the characters
For ($Lon_i;1;Length:C16($Txt_url);1)
	
	$Lon_charCode:=Character code:C91($Txt_url[[$Lon_i]])
	
	If (Find in array:C230($tLon_safeCharacters;$Lon_charCode)#-1)
		
		  // Safe character, append unaltered
		$Txt_encoded:=$Txt_encoded+Char:C90($Lon_charCode)
		
	Else 
		
		  // Unsafe character, append as a hex string
		$Txt_encoded:=$Txt_encoded+"%"+Substring:C12(String:C10($Lon_charCode;"&x");5)
		
	End if 
End for 

  // ----------------------------------------------------
  // Return
$0:=$Txt_encoded

  // ----------------------------------------------------
  // End