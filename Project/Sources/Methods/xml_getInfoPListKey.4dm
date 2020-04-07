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
  // Declarations
C_BOOLEAN:C305($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_POINTER:C301($3)

C_BOOLEAN:C305($Boo_found)
C_LONGINT:C283($Lon_parameters)
C_POINTER:C301($Ptr_value)
C_TEXT:C284($Dom_key;$Dom_root;$Dom_sibling;$File_plistPath;$Txt_key;$Txt_name)
C_TEXT:C284($Txt_value)

If (False:C215)
	C_BOOLEAN:C305(xml_getInfoPListKey ;$0)
	C_TEXT:C284(xml_getInfoPListKey ;$1)
	C_TEXT:C284(xml_getInfoPListKey ;$2)
	C_POINTER:C301(xml_getInfoPListKey ;$3)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=2;"Missing parameter"))
	
	  //Required parameters
	$File_plistPath:=$1
	$Txt_key:=$2
	
	  //Optional parameters
	If ($Lon_parameters>=3)
		
		$Ptr_value:=$3
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
If (Asserted:C1132(Count parameters:C259>=2;Current method name:C684+": not enough parameters"))
	
	If (Count parameters:C259>=3)
		
	End if 
	
	$Dom_root:=DOM Parse XML source:C719($File_plistPath)
	
	If (Asserted:C1132(OK=1;"Invalid XML source"))
		
		$Dom_key:=xml_findInfoPListKey ($Dom_root;$Txt_key)
		
		If (Length:C16($Dom_key)#0)
			
			$Dom_sibling:=DOM Get next sibling XML element:C724($Dom_key)
			DOM GET XML ELEMENT NAME:C730($Dom_sibling;$Txt_name)
			
			If (Asserted:C1132(Lowercase:C14($Txt_name)="string"))
				
				$Boo_found:=True:C214
				
				If (Count parameters:C259>=3)
					
					DOM GET XML ELEMENT VALUE:C731($Dom_sibling;$Txt_value)
					$Ptr_value->:=$Txt_value
					
				End if 
			End if 
		End if 
		
		DOM CLOSE XML:C722($Dom_root)
		
	End if 
End if 

  // ----------------------------------------------------
  // Return
$0:=$Boo_found

  // ----------------------------------------------------
  // End