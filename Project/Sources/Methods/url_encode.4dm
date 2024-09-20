//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Project method : url_encode
// Database: 4D SVG
// ID[447F725AD64A4C57AA33541AAAF4F3A9]
// Created 28-2-2013 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($url : Text) : Text

var $encoded; $VALID : Text
var $charCode; $i; $length : Integer

// #28-10-2014 - XSL transformation is no longer supported
// Fill an array with the characters which need no conversion
$VALID:="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz:/.?=_-$(){}~&"
$length:=Length:C16($VALID)
ARRAY LONGINT:C221($safe; $length)

For ($i; 1; $length; 1)
	
	$safe{$i}:=Character code:C91($VALID[[$i]])
	
End for 

// Convert the characters
For ($i; 1; Length:C16($url); 1)
	
	$charCode:=Character code:C91($url[[$i]])
	
	If (Find in array:C230($safe; $charCode)#-1)
		
		// Safe character, append unaltered
		$encoded:=$encoded+Char:C90($charCode)
		
	Else 
		
		// Unsafe character, append as a hex string
		$encoded:=$encoded+"%"+Substring:C12(String:C10($charCode; "&x"); 5)
		
	End if 
End for 

return $encoded