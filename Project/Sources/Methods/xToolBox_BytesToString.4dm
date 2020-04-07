//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Méthode : xToolBox_BytesToString
  // Créée le 28/09/05 par vdl
  // ----------------------------------------------------
C_TEXT:C284($0)
C_REAL:C285($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_LONGINT:C283($5)

C_LONGINT:C283($Int_Platform;$Lon_Language;$Lon_Machine;$Lon_parameters;$Lon_Precision;$Lon_System)
C_REAL:C285($Num_Size)
C_TEXT:C284($Txt_Format;$Txt_IntegerFormat;$Txt_Nul;$Txt_RealFormat;$Txt_Requested_Unit;$Txt_Result)
C_TEXT:C284($Txt_Unit)

If (False:C215)
	C_TEXT:C284(xToolBox_BytesToString ;$0)
	C_REAL:C285(xToolBox_BytesToString ;$1)
	C_TEXT:C284(xToolBox_BytesToString ;$2)
	C_TEXT:C284(xToolBox_BytesToString ;$3)
	C_TEXT:C284(xToolBox_BytesToString ;$4)
	C_LONGINT:C283(xToolBox_BytesToString ;$5)
End if 

$Lon_parameters:=Count parameters:C259
$Num_Size:=$1

If ($Lon_parameters>1)
	
	$Txt_Requested_Unit:=$2
	
	If ($Lon_parameters>2)
		
		$Txt_Nul:=$3
		
		If ($Lon_parameters>3)
			
			$Txt_Unit:=$4
			
			If ($Lon_parameters>4)
				
				$Lon_Precision:=$5
				
			Else 
				
				$Lon_Precision:=0
				
			End if 
			
		Else 
			
			$Txt_Unit:=""
			$Lon_Precision:=0
			
		End if 
		
	Else 
		
		$Txt_Nul:=""
		$Txt_Unit:=""
		$Lon_Precision:=0
		
	End if 
	
Else 
	
	$Txt_Requested_Unit:=""
	$Txt_Nul:=""
	$Txt_Unit:=""
	$Lon_Precision:=0
	
End if 

If (Length:C16($Txt_Unit)=0)
	
	  //Unité  en fonction de la langue
	_O_PLATFORM PROPERTIES:C365($Int_Platform;$Lon_System;$Lon_Machine;$Lon_Language)
	
	If ($Lon_Language=12)  //Français
		
		$Txt_Unit:="o"
		
	Else 
		
		$Txt_Unit:="B"  //In English -> "B" = Byte, "b" = bit
		
	End if 
End if 

  //v11
$Txt_IntegerFormat:="###,###,###,###,###,###,##0"
$Txt_RealFormat:="###,###,###,###,###,###,##0.##"  //maximum deux chiffres apres la virgule

$Txt_Format:=Choose:C955($Lon_Precision=0;$Txt_IntegerFormat;$Txt_RealFormat)

Case of 
		
		  //______________________________________________________`texte si nul
	: ($Num_Size=0)
		
		$Txt_Result:=$Txt_Nul
		
		  //______________________________________________________`Texte en fonction de l'unité demandée (G/M/K/O)
	: ($Txt_Requested_Unit="G")
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^30);$Lon_Precision);$Txt_Format)+Char:C90(32)+"G"+$Txt_Unit
		
		  //______________________________________________________
	: ($Txt_Requested_Unit="M")
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^20);$Lon_Precision);$Txt_Format)+Char:C90(32)+"M"+$Txt_Unit
		
		  //______________________________________________________
	: ($Txt_Requested_Unit="K")
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^10);$Lon_Precision);$Txt_Format)+Char:C90(32)+"k"+$Txt_Unit
		
		  //______________________________________________________
	: ($Txt_Requested_Unit="O")
		
		$Txt_Result:=String:C10($Num_Size;$Txt_IntegerFormat)+Char:C90(32)+$Txt_Unit
		
		  //______________________________________________________`Texte en fonction de la taille de la valeur
		
		  //…………………………
	: ($Num_Size>=(2^60))  //Exa
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^60);$Lon_Precision);$Txt_Format)+Char:C90(32)+"E"+$Txt_Unit
		
		  //…………………………
	: ($Num_Size>=(2^50))  //Peta
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^50);$Lon_Precision);$Txt_Format)+Char:C90(32)+"P"+$Txt_Unit
		
		  //…………………………
	: ($Num_Size>=(2^40))  //Tera
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^40);$Lon_Precision);$Txt_Format)+Char:C90(32)+"T"+$Txt_Unit
		
		  //…………………………
	: ($Num_Size>=(2^30))  //Giga
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^30);$Lon_Precision);$Txt_Format)+Char:C90(32)+"G"+$Txt_Unit
		
		  //…………………………
	: ($Num_Size>=(2^20))  //Mega
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^20);$Lon_Precision);$Txt_Format)+Char:C90(32)+"M"+$Txt_Unit
		
		  //…………………………
	: ($Num_Size>=(2^10))  //Kilo
		
		$Txt_Result:=String:C10(Round:C94($Num_Size/(2^10);$Lon_Precision);$Txt_Format)+Char:C90(32)+"k"+$Txt_Unit
		
		  //…………………………
	Else   //Octets
		
		$Txt_Result:=String:C10($Num_Size;$Txt_IntegerFormat)+Char:C90(32)+$Txt_Unit
		
		  //______________________________________________________
End case 

$0:=$Txt_Result