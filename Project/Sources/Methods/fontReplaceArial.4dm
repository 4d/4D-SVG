//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : fontReplaceArial
  // Created 26/1/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Because Arial is not a good font for some asiatic language
  // This method add 'Arial Unicode MS' in the font family
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_error;$Lon_i;$Lon_size)
C_TEXT:C284($kTxt_pattern;$Txt_fontFamily;$Txt_prefix;$Txt_suffix)

ARRAY LONGINT:C221($tLon_lengths;0)
ARRAY LONGINT:C221($tLon_positions;0)

If (False:C215)
	C_TEXT:C284(fontReplaceArial ;$0)
	C_TEXT:C284(fontReplaceArial ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Txt_fontFamily:=$1

$kTxt_pattern:="(?m-si)(?:(,*)[[:blank:]]*'?(Arial(?:'?)))(?:(,)|$)"

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: (Not:C34(Storage:C1525.svg.options ?? 10))  // Modified by Vincent de Lachaux (18/03/10)
		
		  //Don't substitute Arial
		
		  //______________________________________________________
	: (Position:C15("Arial";$Txt_fontFamily)=0)
		
		  //NOTHING MORE TO DO
		
		  //#16-8-2016
		  //#ACI0094904 [
		  //______________________________________________________
		  //: ($Txt_fontFamily="Arial")| ($Txt_fontFamily="'Arial'")
		  //  //       ___________________
		  //  //  /   ACI0074602
		  //  // ||   Date 24/01/12
		  //  //(   ) Vincent de Lachaux
		  //  //       ___________________
		  //  //$Txt_fontFamily:="'Arial Unicode MS' 'Arial'"
		  //$Txt_fontFamily:="'Arial Unicode MS','Arial'"
		  //  //       ___________________
		  //  //______________________________________________________
		  //: (Position("Arial Unicode MS";$Txt_fontFamily)=0)
		  //  //       ___________________
		  //  //  /   ACI0074602
		  //  // ||   Date 24/01/12
		  //  //(   ) Vincent de Lachaux
		  //  //       ___________________
		  //  //$Txt_fontFamily:=Remplacer chaine($Txt_fontFamily;"Arial";"'Arial Unicode MS' 'Arial'")
		  //$Txt_fontFamily:=Replace string($Txt_fontFamily;"Arial";"'Arial Unicode MS','Arial'")
		  //  //       ___________________
	: (Match regex:C1019($kTxt_pattern;$Txt_fontFamily;1;$tLon_positions;$tLon_lengths))
		
		If ($tLon_positions{1}#0)
			
			$Txt_prefix:=Substring:C12($Txt_fontFamily;$tLon_positions{1};$tLon_lengths{1})
			
		End if 
		
		If ($tLon_positions{3}#0)
			
			$Txt_suffix:=Substring:C12($Txt_fontFamily;$tLon_positions{3};$tLon_lengths{3})
			
		End if 
		
		$Lon_error:=Rgx_SubstituteText ($kTxt_pattern;$Txt_prefix+"'Arial Unicode MS','Arial'"+$Txt_suffix;->$Txt_fontFamily)
		  //]
		
		  //______________________________________________________
End case 

  //#ACI0094904 - additionally, format the font family [
ARRAY TEXT:C222($tTxt_fonts;0x0000)

If (0=Rgx_SplitText (", *";$Txt_fontFamily;->$tTxt_fonts))
	
	CLEAR VARIABLE:C89($Txt_fontFamily)
	
	$Lon_size:=Size of array:C274($tTxt_fonts)
	
	For ($Lon_i;1;$Lon_size;1)
		
		$tTxt_fonts{$Lon_i}:=Replace string:C233($tTxt_fonts{$Lon_i};"'";"")
		$Txt_fontFamily:=$Txt_fontFamily+"'"+$tTxt_fonts{$Lon_i}+"'"+(","*Num:C11($Lon_i<$Lon_size))
		
	End for 
End if 
  //]

$0:=$Txt_fontFamily