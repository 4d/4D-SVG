//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : xml_referenceValid
// Created 27/08/10 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($node : Text) : Boolean

var $root : Text

$root:=Try(DOM Get root XML element:C1053($node))

return Last errors:C1799.length=0