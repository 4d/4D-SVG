//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : xml_getInfoPListKey
// Database: 4D unitTest
// ID[EA1C46CA5DFB4A2482B10A976EEB3336]
// Created #14-9-2016 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Look for among an info.plist's elements "plist/dict/key" for name $1
// Parameters
// $1: path of the info.plist file
// $2: name of the element
// $3: optional, pointer to C_TEXT returns the value contained in the sought key
// $0: True if the key was found, FALSE otherwise
// ----------------------------------------------------
#DECLARE($pathname : Text; $key : Text; $response : Pointer) : Boolean

var $name; $node; $root; $sibling; $value : Text
var $found : Boolean

If (Asserted:C1132(Count parameters:C259>=2; Current method name:C684+": not enough parameters"))
	
	$root:=DOM Parse XML source:C719($pathname)
	
	If (Asserted:C1132(OK=1; "Invalid XML source"))
		
		$node:=xml_findInfoPListKey($root; $key)
		
		If (Length:C16($node)#0)
			
			$sibling:=DOM Get next sibling XML element:C724($node)
			DOM GET XML ELEMENT NAME:C730($sibling; $name)
			
			If (Asserted:C1132(Lowercase:C14($name)="string"))
				
				$found:=True:C214
				
				If (Count parameters:C259>=3)
					
					DOM GET XML ELEMENT VALUE:C731($sibling; $value)
					$response->:=$value
					
				End if 
			End if 
		End if 
		
		DOM CLOSE XML:C722($root)
		
	End if 
End if 

return $found