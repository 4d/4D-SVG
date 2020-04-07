//%attributes = {"invisible":true,"preemptive":"capable"}
  // Project method : url_decode
  // Database: 4D SVG
  // ID[F809B62087CC4EB6948898955BA27279]
  // Created 28-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_charCode;$Lon_i;$Lon_parameters)
C_TEXT:C284($Txt_decoded;$Txt_hexValues;$Txt_url)

If (False:C215)
	C_TEXT:C284(url_decode ;$0)
	C_TEXT:C284(url_decode ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Txt_url:=$1
	
	  // #28-10-2014 - XSL transformation is no longer supported
	$Txt_hexValues:="123456789ABCDEF"
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
  //$Dom_root:=DOM Create XML Ref("string-to-decode")
  //DOM SET XML ELEMENT VALUE($Dom_root;"string-to-decode";$Txt_url)
  //DOM EXPORT TO VAR($Dom_root;$Blb_source)
  //DOM CLOSE XML($Dom_root)
  //$Txt_sheet:="<?xml version=\"1.0\" encoding=\"utf-8\"?>"
  //$Txt_sheet:=$Txt_sheet+"<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" xmlns:str=\"http://exslt.org/strings\">"
  //$Txt_sheet:=$Txt_sheet+"  <xsl:output method=\"text\"/>"
  //$Txt_sheet:=$Txt_sheet+"  <xsl:template match=\"/\">"
  //$Txt_sheet:=$Txt_sheet+"    <xsl:value-of select=\"str:decode-uri(/string-to-decode)\"/>"
  //$Txt_sheet:=$Txt_sheet+"  </xsl:template>"
  //$Txt_sheet:=$Txt_sheet+"</xsl:stylesheet>"
  //CONVERT FROM TEXT($Txt_sheet;"utf-8";$Blb_sheet)
  //_o_XSLT APPLY TRANSFORMATION($Blb_source;$Blb_sheet;$Blb_result)
  //$0:=Convert to text($Blb_result;"utf-8")

For ($Lon_i;1;Length:C16($Txt_url);1)
	
	If ($Txt_url[[$Lon_i]]="%")
		
		$Lon_charCode:=(Position:C15(Substring:C12($Txt_url;$Lon_i+1;1);$Txt_hexValues)*16)\
			+(Position:C15(Substring:C12($Txt_url;$Lon_i+2;1);$Txt_hexValues))
		
		$Txt_decoded:=$Txt_decoded+Char:C90($Lon_charCode)
		
		$Lon_i:=$Lon_i+2
		
	Else 
		
		$Txt_decoded:=$Txt_decoded+$Txt_url[[$Lon_i]]
		
	End if 
End for 

$0:=$Txt_decoded

  // ----------------------------------------------------
  // Return

  // ----------------------------------------------------
  // End