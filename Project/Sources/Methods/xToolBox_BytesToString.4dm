//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Méthode : xToolBox_BytesToString
// Créée le 28/09/05 par vdl
// ----------------------------------------------------
#DECLARE($Num_Size : Real; $Txt_Requested_Unit : Text; $Txt_Nul : Text; $Txt_Unit : Text; $Lon_Precision : Integer) : Text

var $Txt_Format; $Txt_IntegerFormat; $Txt_RealFormat : Text
var $Int_Platform; $Lon_Language; $Lon_Machine; $Lon_System : Integer

If (Length:C16($Txt_Unit)=0)
	
	// Unité en fonction de la langue
	_O_PLATFORM PROPERTIES:C365($Int_Platform; $Lon_System; $Lon_Machine; $Lon_Language)
	
	If ($Lon_Language=12)  // Français
		
		$Txt_Unit:="o"
		
	Else 
		
		$Txt_Unit:="B"  // In English -> "B" = Byte, "b" = bit
		
	End if 
End if 

// V11
$Txt_IntegerFormat:="###,###,###,###,###,###,##0"
$Txt_RealFormat:="###,###,###,###,###,###,##0.##"  // Maximum deux chiffres apres la virgule

$Txt_Format:=$Lon_Precision=0 ? $Txt_IntegerFormat : $Txt_RealFormat

Case of 
		
		//______________________________________________________`texte si nul
	: ($Num_Size=0)
		
		return $Txt_Nul
		
		//______________________________________________________`Texte en fonction de l'unité demandée (G/M/K/O)
	: ($Txt_Requested_Unit="G")
		
		return String:C10(Round:C94($Num_Size/(2^30); $Lon_Precision); $Txt_Format)+Char:C90(32)+"G"+$Txt_Unit
		
		//______________________________________________________
	: ($Txt_Requested_Unit="M")
		
		return String:C10(Round:C94($Num_Size/(2^20); $Lon_Precision); $Txt_Format)+Char:C90(32)+"M"+$Txt_Unit
		
		//______________________________________________________
	: ($Txt_Requested_Unit="K")
		
		return String:C10(Round:C94($Num_Size/(2^10); $Lon_Precision); $Txt_Format)+Char:C90(32)+"k"+$Txt_Unit
		
		//______________________________________________________
	: ($Txt_Requested_Unit="O")
		
		return String:C10($Num_Size; $Txt_IntegerFormat)+Char:C90(32)+$Txt_Unit
		
		//______________________________________________________`Texte en fonction de la taille de la valeur
		
		//…………………………
	: ($Num_Size>=(2^60))  // Exa
		
		return String:C10(Round:C94($Num_Size/(2^60); $Lon_Precision); $Txt_Format)+Char:C90(32)+"E"+$Txt_Unit
		
		//…………………………
	: ($Num_Size>=(2^50))  // Peta
		
		return String:C10(Round:C94($Num_Size/(2^50); $Lon_Precision); $Txt_Format)+Char:C90(32)+"P"+$Txt_Unit
		
		//…………………………
	: ($Num_Size>=(2^40))  // Tera
		
		return String:C10(Round:C94($Num_Size/(2^40); $Lon_Precision); $Txt_Format)+Char:C90(32)+"T"+$Txt_Unit
		
		//…………………………
	: ($Num_Size>=(2^30))  // Giga
		
		return String:C10(Round:C94($Num_Size/(2^30); $Lon_Precision); $Txt_Format)+Char:C90(32)+"G"+$Txt_Unit
		
		//…………………………
	: ($Num_Size>=(2^20))  // Mega
		
		return String:C10(Round:C94($Num_Size/(2^20); $Lon_Precision); $Txt_Format)+Char:C90(32)+"M"+$Txt_Unit
		
		//…………………………
	: ($Num_Size>=(2^10))  // Kilo
		
		return String:C10(Round:C94($Num_Size/(2^10); $Lon_Precision); $Txt_Format)+Char:C90(32)+"k"+$Txt_Unit
		
		//…………………………
	Else   // Octets
		
		return String:C10($Num_Size; $Txt_IntegerFormat)+Char:C90(32)+$Txt_Unit
		
		//______________________________________________________
End case 