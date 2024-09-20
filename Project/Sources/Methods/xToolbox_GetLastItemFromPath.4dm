//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : xToolbox_GetLastItemFromPath
// Created 06/10/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($Txt_Path : Text; $Txt_Separator : Text) : Text

var $Lon_i; $Lon_Length; $Lon_Position : Integer

$Txt_Separator:=$Txt_Separator || Folder separator:K24:12

$Lon_Position:=Position:C15($Txt_Separator; $Txt_Path)

If ($Lon_Position>0)
	
	$Lon_Length:=Length:C16($Txt_Path)
	
	If ($Txt_Path[[$Lon_Length]]=$Txt_Separator)  // It's a folder
		
		$Lon_Length:=$Lon_Length-1
		
	End if 
	
	For ($Lon_i; $Lon_Length; 1; -1)
		
		If ($Txt_Path[[$Lon_i]]=$Txt_Separator)
			
			$Txt_Path:=Substring:C12($Txt_Path; $Lon_i+1)
			$Lon_i:=0
			
		End if 
	End for 
End if 

return $Txt_Path