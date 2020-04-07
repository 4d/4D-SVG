//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : xml_referenceValid
  // Created 27/08/10 by Vincent de Lachaux
  // ----------------------------------------------------
C_BOOLEAN:C305($0)
C_TEXT:C284($1)

C_TEXT:C284($Dom_root;$Txt_buffer)

If (False:C215)
	C_BOOLEAN:C305(xml_referenceValid ;$0)
	C_TEXT:C284(xml_referenceValid ;$1)
End if 

$Txt_buffer:=Method called on error:C704
ON ERR CALL:C155("xml_noError")  //========================== < NO ERROR >

$Dom_root:=DOM Get root XML element:C1053($1)

$0:=(OK=1)

ON ERR CALL:C155($Txt_buffer)  //=========================== < NO ERROR >