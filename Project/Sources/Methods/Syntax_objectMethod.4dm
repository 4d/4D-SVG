//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method : Syntax_objectMethod
  // Created 16/09/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_BOOLEAN:C305($Boo_expanded)
C_LONGINT:C283($Lon_formEvent;$Lon_ref;$Lon_x;$Lst_command)
C_POINTER:C301($Ptr_self)
C_TEXT:C284($Txt_buffer)

$Ptr_self:=Self:C308
$Lon_formEvent:=Form event:C388

Case of 
		
		  //______________________________________________________
	: ($Ptr_self=(-><>lst_syntax))
		
		Case of 
				
				  //…………………………………………………………
			: ($Lon_formEvent=On Clicked:K2:4)
				
				GET LIST ITEM:C378(<>lst_syntax;*;$Lon_ref;$Txt_buffer;$Lst_command;$Boo_expanded)
				
				If ($Lst_command=0)
					
					GET LIST ITEM PARAMETER:C985(<>lst_syntax;*;"permalink";$Txt_Buffer)
					
					$Txt_Buffer:="147"
					
					Syntax_help ($Txt_Buffer)
					
				End if 
				
				  //…………………………………………………………
			: ($Lon_formEvent=On Begin Drag Over:K2:44)
				
				GET LIST ITEM PARAMETER:C985(<>lst_syntax;*;"syntax";$Txt_Buffer)
				$Lon_x:=Position:C15(" -> ";$Txt_Buffer)
				
				If ($Lon_x>0)
					
					$Txt_Buffer:=Substring:C12($Txt_Buffer;$Lon_x+4)+":="+Substring:C12($Txt_Buffer;1;$Lon_x)
					
				End if 
				
				SET TEXT TO PASTEBOARD:C523($Txt_Buffer+"\r")
				
				  //…………………………………………………………
		End case 
		
		  //______________________________________________________
	: ($Ptr_self=(-><>bDocumentation))
		
		OPEN URL:C673(Get localized string:C991("specificationUrl"))
		
		  //______________________________________________________
	: (False:C215)
		
		  //______________________________________________________
	Else 
		
		  //______________________________________________________
End case 