//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
//  Method : fontReplaceArial
//  Created 26/1/10 by Vincent de Lachaux
// ----------------------------------------------------
//  Description
//  Because Arial is not a good font for some asiatic language
//  This method add 'Arial Unicode MS' in the font family
// ----------------------------------------------------
#DECLARE($fontFamily : Text) : Text

var $pattern; $prefix; $suffix : Text
var $erroCode; $i; $size : Integer

ARRAY LONGINT:C221($len; 0)
ARRAY LONGINT:C221($pos; 0)

$pattern:="(?m-si)(?:(,*)[[:blank:]]*'?(Arial(?:'?)))(?:(,)|$)"

Case of 
		
		//______________________________________________________
	: (Not:C34(Storage:C1525.svg.options ?? 10))  // Modified by Vincent de Lachaux (18/03/10)
		
		// Don't substitute Arial
		
		//______________________________________________________
	: (Position:C15("Arial"; $fontFamily)=0)
		
		// NOTHING MORE TO DO
		
		//______________________________________________________
	: (Match regex:C1019($pattern; $fontFamily; 1; $pos; $len))
		
		If ($pos{1}#0)
			
			$prefix:=Substring:C12($fontFamily; $pos{1}; $len{1})
			
		End if 
		
		If ($pos{3}#0)
			
			$suffix:=Substring:C12($fontFamily; $pos{3}; $len{3})
			
		End if 
		
		$erroCode:=Rgx_SubstituteText($pattern; $prefix+"'Arial Unicode MS','Arial'"+$suffix; ->$fontFamily)
		
		//______________________________________________________
End case 

// #ACI0094904 - additionally, format the font family
ARRAY TEXT:C222($_fonts; 0x0000)

If (0=Rgx_SplitText(", *"; $fontFamily; ->$_fonts))
	
	CLEAR VARIABLE:C89($fontFamily)
	
	$size:=Size of array:C274($_fonts)
	
	For ($i; 1; $size; 1)
		
		$_fonts{$i}:=Replace string:C233($_fonts{$i}; "'"; "")
		$fontFamily:=$fontFamily+"'"+$_fonts{$i}+"'"+(","*Num:C11($i<$size))
		
	End for 
End if 

return $fontFamily