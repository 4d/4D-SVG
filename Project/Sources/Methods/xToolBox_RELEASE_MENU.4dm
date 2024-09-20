//%attributes = {"invisible":true,"preemptive":"incapable"}
// ----------------------------------------------------
// Method : xToolBox_RELEASE_MENU
// Created 21/07/06 by vdl
// ----------------------------------------------------
// Description
// Clears from memory the menu $1 and all menu called from this one
//----------------------------------------------------
#DECLARE($menuRef : Text)

var $i : Integer

ARRAY TEXT:C222($ta16_References; 0)
ARRAY TEXT:C222($ta32_Labels; 0)

If (Length:C16($menuRef)>0)
	
	GET MENU ITEMS:C977($menuRef; $ta32_Labels; $ta16_References)
	
	For ($i; 1; Size of array:C274($ta16_References); 1)
		
		If (Length:C16($ta16_References{$i})>0)
			
			xToolBox_RELEASE_MENU($ta16_References{$i})  // <-- Recursive
			
		End if 
	End for 
	
	RELEASE MENU:C978($menuRef)
	
End if 