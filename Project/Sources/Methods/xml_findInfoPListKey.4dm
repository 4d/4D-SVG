//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : xml_findInfoPListKey
// Database: 4D unitTest
// ID[B7EC674F8A734019BBD81F2640FFAC33]
// Created #14-9-2016 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Finds an Info.PList element reference using a supplied XML root reference
// ----------------------------------------------------
#DECLARE($root : Text; $key : Text) : Text

var $value : Text
var $i : Integer

ARRAY TEXT:C222($_nodes; 0)

$_nodes{0}:=DOM Find XML element:C864($root; "/plist/dict/key"; $_nodes)

For ($i; 1; Size of array:C274($_nodes); 1)
	
	DOM GET XML ELEMENT VALUE:C731($_nodes{$i}; $value)
	
	If (Lowercase:C14($value)=Lowercase:C14($key))
		
		return $_nodes{$i}
		
	End if 
End for 