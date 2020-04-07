//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : xToolbox_GetLastItemFromPath
  // Created 06/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_i;$Lon_Length;$Lon_Position)
C_TEXT:C284($Txt_Path;$Txt_Separator)

If (False:C215)
	C_TEXT:C284(xToolbox_GetLastItemFromPath ;$0)
	C_TEXT:C284(xToolbox_GetLastItemFromPath ;$1)
	C_TEXT:C284(xToolbox_GetLastItemFromPath ;$2)
End if 

If (Count parameters:C259>=1)
	
	$Txt_Path:=$1
	
	If (Count parameters:C259>=2)
		
		$Txt_Separator:=$2
		
	Else 
		
		$Txt_Separator:=Folder separator:K24:12
		
	End if 
	
Else 
	
	TRACE:C157
	
End if 

$Lon_Position:=Position:C15($Txt_Separator;$Txt_Path)

If ($Lon_Position>0)
	
	$Lon_Length:=Length:C16($Txt_Path)
	
	If ($Txt_Path[[$Lon_Length]]=$Txt_Separator)  //It's a folder
		
		$Lon_Length:=$Lon_Length-1
		
	End if 
	
	For ($Lon_i;$Lon_Length;1;-1)
		
		If ($Txt_Path[[$Lon_i]]=$Txt_Separator)
			
			$Txt_Path:=Substring:C12($Txt_Path;$Lon_i+1)
			$Lon_i:=0
			
		End if 
	End for 
End if 

$0:=$Txt_Path