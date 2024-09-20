//%attributes = {"invisible":true,"preemptive":"capable"}
// Project method : url_decode
// Database: 4D SVG
// ID[F809B62087CC4EB6948898955BA27279]
// Created 28-2-2013 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($url : Text) : Text

var $decoded; $HEX : Text
var $charCode; $i : Integer

// #28-10-2014 - XSL transformation is no longer supported
$HEX:="123456789ABCDEF"

For ($i; 1; Length:C16($url); 1)
	
	If ($url[[$i]]="%")
		
		$charCode:=(Position:C15(Substring:C12($url; $i+1; 1); $HEX)*16)\
			+(Position:C15(Substring:C12($url; $i+2; 1); $HEX))
		
		$decoded:=$decoded+Char:C90($charCode)
		
		$i:=$i+2
		
	Else 
		
		$decoded:=$decoded+$url[[$i]]
		
	End if 
End for 

return $decoded