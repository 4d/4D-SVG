  //Syntax_objectMethod
C_BOOLEAN:C305($Boo_expanded)
C_LONGINT:C283($Lon_formEvent;$Lon_x;$Lst_commands)
C_TEXT:C284($Txt_Buffer)

$Lon_formEvent:=Form event:C388

Case of 
		
		  //…………………………………………………………
	: ($Lon_formEvent=On Double Clicked:K2:5)
		
		If ((OBJECT Get pointer:C1124(Object named:K67:5;"collapse_expand"))->=0)
			
			GET LIST ITEM:C378(<>lst_syntax;*;$Lon_x;$Txt_Buffer;$Lst_commands;$Boo_expanded)
			
			If ($Lst_commands=0)
				
				syntax_EXPAND (True:C214)
				
			End if 
		End if 
		
		  //…………………………………………………………
	: ($Lon_formEvent=On Clicked:K2:4)
		
		If ((OBJECT Get pointer:C1124(Object named:K67:5;"collapse_expand"))->=1)
			
			<>Lon_timerEvent:=10
			SET TIMER:C645(-1)
			
		End if 
		
		  //…………………………………………………………
	: ($Lon_formEvent=On Begin Drag Over:K2:44)
		
		GET LIST ITEM:C378(<>lst_syntax;*;$Lon_x;$Txt_Buffer)
		$Txt_Buffer:=Get localized string:C991($Txt_Buffer)
		
		If (Length:C16($Txt_Buffer)>0)
			
			$Lon_x:=Position:C15(" -> ";$Txt_Buffer)
			
			If ($Lon_x>0)
				
				$Txt_Buffer:=Substring:C12($Txt_Buffer;$Lon_x+4)+":="+Substring:C12($Txt_Buffer;1;$Lon_x)
				
			End if 
			
			SET TEXT TO PASTEBOARD:C523($Txt_Buffer+"\r")
			
		End if 
		
		  //…………………………………………………………
End case 