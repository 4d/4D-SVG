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
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($Dom_key;$Dom_root;$Txt_key;$Txt_value)

ARRAY TEXT:C222($tDom_elements;0)

If (False:C215)
	C_TEXT:C284(xml_findInfoPListKey ;$0)
	C_TEXT:C284(xml_findInfoPListKey ;$1)
	C_TEXT:C284(xml_findInfoPListKey ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=2;"Missing parameter"))
	
	  //Required parameters
	$Dom_root:=$1
	$Txt_key:=$2
	
	  //Optional parameters
	If ($Lon_parameters>=3)
		
		  // <NONE>
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
$tDom_elements{0}:=DOM Find XML element:C864($Dom_root;"/plist/dict/key";$tDom_elements)

For ($Lon_i;1;Size of array:C274($tDom_elements);1)
	
	DOM GET XML ELEMENT VALUE:C731($tDom_elements{$Lon_i};$Txt_value)
	
	If (Lowercase:C14($Txt_value)=Lowercase:C14($Txt_key))
		
		$Dom_key:=$tDom_elements{$Lon_i}
		$Lon_i:=MAXLONG:K35:2-1
		
	End if 
End for 

  // ----------------------------------------------------
  // Return
$0:=$Dom_key

  // ----------------------------------------------------
  // End