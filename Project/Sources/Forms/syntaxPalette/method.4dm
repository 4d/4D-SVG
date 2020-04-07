C_LONGINT:C283($l;$Lon_formEvent)

$Lon_formEvent:=Form event code:C388

Case of 
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Load:K2:1)
		
		<>Lon_currentElement:=0
		
		syntax_EXPAND 
		
		  // C_LONGINT((OBJECT Get pointer(Object named;"collapse_expand"))->)
		  // EXECUTE FORMULA(":C283((:C1124(:K67:5;\"collapse_expand\"))->)")
		
		<>Lon_timerEvent:=-1
		SET TIMER:C645(-1)
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		$l:=<>Lon_timerEvent
		<>Lon_timerEvent:=0
		
		Case of 
				
				  //…………………………………………………………………………………………………………………
			: ($l=-1)  // INIT
				
				If (Is a list:C621(<>lst_syntax))
					
					CLEAR LIST:C377(<>lst_syntax;*)
					
				End if 
				
				<>lst_syntax:=syntax_List 
				
				<>Lon_timerEvent:=1
				
				C_POINTER:C301($p)
				$p:=OBJECT Get pointer:C1124(Object named:K67:5;"collapse_expand")
				If (Bool:C1537($p->))
					
					Syntax_help ("721")
					
				End if 
				
				  //…………………………………………………………………………………………………………………
			: ($l=1)  // Display
				
				If (Selected list items:C379(<>lst_syntax)#0)
					
					GET LIST ITEM:C378(<>lst_syntax;*;$l;<>Txt_Name)
					
					Case of 
							
							  //……………………
						: ($l<=-10)
							
							If (List item parent:C633(<>lst_syntax;<>Lon_currentElement)#$l)
								
								$l:=0
								SELECT LIST ITEMS BY REFERENCE:C630(<>lst_syntax;$l)
								
							Else 
								
								$l:=<>Lon_currentElement
								SELECT LIST ITEMS BY REFERENCE:C630(<>lst_syntax;$l)
								
							End if 
							
							  //……………………
						: ($l<0)
							
							$l:=<>Lon_currentElement
							SELECT LIST ITEMS BY REFERENCE:C630(<>lst_syntax;$l)
							
							  //……………………
					End case 
					
				Else 
					
					$l:=0
					
				End if 
				
				If ($l#<>Lon_currentElement)
					
					<>Lon_currentElement:=$l
					
				End if 
				
				  //…………………………………………………………………………………………………………………
			: ($l=10)  // Help
				
				$l:=Selected list items:C379(<>lst_syntax;*)
				Syntax_help (Choose:C955($l=0;"721";String:C10($l)))
				
				  //…………………………………………………………………………………………………………………
			Else 
				
				  //…………………………………………………………………………………………………………………
		End case 
		
		If (<>Lon_timerEvent#0)
			
			SET TIMER:C645(-1)
			
		End if 
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Close Box:K2:21)
		
		CANCEL:C270
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Unload:K2:2)
		
		CLEAR LIST:C377(<>lst_syntax;*)
		
		  //……………………………………………………………………………
End case 