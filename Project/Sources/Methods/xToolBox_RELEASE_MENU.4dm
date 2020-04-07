//%attributes = {"invisible":true,"preemptive":"incapable"}
  // ----------------------------------------------------
  // Method : xToolBox_RELEASE_MENU
  // Created 21/07/06 by vdl
  // ----------------------------------------------------
  // Description
  // Clears from memory  the menu $1 and all menu called from this one
  //----------------------------------------------------
C_TEXT:C284($1)

C_LONGINT:C283($Lon_i)

ARRAY TEXT:C222($ta16_References;0)
ARRAY TEXT:C222($ta32_Labels;0)

If (False:C215)
	C_TEXT:C284(xToolBox_RELEASE_MENU ;$1)
End if 

If (Length:C16($1)>0)
	
	GET MENU ITEMS:C977($1;$ta32_Labels;$ta16_References)
	
	For ($Lon_i;1;Size of array:C274($ta16_References);1)
		
		If (Length:C16($ta16_References{$Lon_i})>0)
			
			xToolBox_RELEASE_MENU ($ta16_References{$Lon_i})  //<-- Recursive
			
		End if 
	End for 
	
	RELEASE MENU:C978($1)
	
End if 