//%attributes = {"invisible":true,"preemptive":"incapable"}
// ----------------------------------------------------
// Method : xToolBox_tabHandler
// Created 15/10/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($Lon_Event : Integer; $Ptr_target : Pointer; $Lon_tabID : Integer; $Lon_Selected : Integer) : Integer

var $Txt_id; $Txt_svgReference : Text
var $Lon_bottom; $Lon_left; $Lon_maxWidth; $Lon_offset; $Lon_right; $Lon_tabWidth : Integer
var $Lon_top : Integer

//%W-518.7
If (Undefined:C82(<>Lon_tabList))
	
	var <>Lon_tabList : Integer
	
End if 
//%W+518.7

Case of 
		
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	: (Not:C34(Is a list:C621(<>Lon_tabList)))
		
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	: (List item position:C629(<>Lon_tabList; $Lon_tabID)=0)
		
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	Else 
		
		GET LIST ITEM PARAMETER:C985(<>Lon_tabList; $Lon_tabID; "DOM"; $Txt_svgReference)
		GET LIST ITEM PARAMETER:C985(<>Lon_tabList; $Lon_tabID; "width"; $Lon_tabWidth)
		GET LIST ITEM PARAMETER:C985(<>Lon_tabList; $Lon_tabID; "selected"; $Lon_Selected)
		
		Case of 
				
				//______________________________________________________
			: ($Lon_Event=On Clicked:K2:4)
				
				$Txt_id:=SVG Find element ID by coordinates:C1054($Ptr_target->; MouseX; MouseY)
				
				If ($Txt_id="tab_@")
					
					SVG_SET_VISIBILITY(SVG_Find_ID($Txt_svgReference; "selected_"+String:C10($Lon_Selected)); False:C215)
					SVG_SET_VISIBILITY(SVG_Find_ID($Txt_svgReference; Replace string:C233($Txt_id; "tab_"; "selected_")); True:C214)
					
					$Lon_Selected:=Num:C11($Txt_id)
					
					SET LIST ITEM PARAMETER:C986(<>Lon_tabList; $Lon_tabID; "selected"; $Lon_Selected)
					
					SVG EXPORT TO PICTURE:C1017($Txt_svgReference; $Ptr_target->)
					
				End if 
				
				return $Lon_Selected
				
				//______________________________________________________
			: ($Lon_Event=On Resize:K2:27)
				
				OBJECT GET COORDINATES:C663($Ptr_target->; $Lon_left; $Lon_top; $Lon_right; $Lon_bottom)
				
				$Lon_maxWidth:=$Lon_right-$Lon_left
				
				$Lon_offset:=($Lon_maxWidth/2)-($Lon_tabWidth/2)
				
				SVG_SET_TRANSFORM_TRANSLATE(SVG_Find_ID($Txt_svgReference; "tabs"); $Lon_offset; 5)
				
				SVG EXPORT TO PICTURE:C1017($Txt_svgReference; $Ptr_target->)
				
				//______________________________________________________
			: ($Lon_Event=On Unload:K2:2)
				
				DELETE FROM LIST:C624(<>Lon_tabList; $Lon_tabID)
				
				//______________________________________________________
			: ($Lon_Event=On Selection Change:K2:29)
				
				SVG_SET_VISIBILITY(SVG_Find_ID($Txt_svgReference; "selected_"+String:C10($Lon_Selected)); False:C215)
				
				SET LIST ITEM PARAMETER:C986(<>Lon_tabList; $Lon_tabID; "selected"; $Lon_Selected)
				SVG_SET_VISIBILITY(SVG_Find_ID($Txt_svgReference; "selected_"+String:C10($Lon_Selected)); True:C214)
				
				SVG EXPORT TO PICTURE:C1017($Txt_svgReference; $Ptr_target->)
				
				//______________________________________________________
			Else 
				
				TRACE:C157
				
				//______________________________________________________
		End case 
		
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
End case 