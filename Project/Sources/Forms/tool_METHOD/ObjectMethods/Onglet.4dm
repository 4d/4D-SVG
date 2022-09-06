C_LONGINT:C283($Lon_line;$Lon_process)
C_POINTER:C301($Ptr_source)
C_TEXT:C284($Txt_methodName)

If (Form event:C388=On Drop:K2:12)
	
	  //permet de récupérer des informations sur l'objet source lorsque l'événement Sur glisser ou Sur déposer est déclenché pour un objet “complexe” (tableau, list box ou liste hiérarchique)
	_O_DRAG AND DROP PROPERTIES:C607($Ptr_source;$Lon_line;$Lon_process)
	
	If ($Ptr_source=OBJECT Get pointer:C1124(Object named:K67:5;"listMethods"))
		
		$Txt_methodName:=(OBJECT Get pointer:C1124(Object named:K67:5;"methodNames"))->{$Lon_line}
		
		If (Not:C34(METHOD Get attribute:C1169($Txt_methodName;Attribute shared:K72:10)))
			
			METHOD SET ATTRIBUTE:C1192($Txt_methodName;Attribute shared:K72:10;True:C214)
			APPEND TO ARRAY:C911((OBJECT Get pointer:C1124(Object named:K67:5;"methodShared"))->;$Txt_methodName)
			SORT ARRAY:C229((OBJECT Get pointer:C1124(Object named:K67:5;"methodShared"))->)
			
		End if 
	End if 
End if 