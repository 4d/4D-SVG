C_LONGINT:C283($Lon_i;$Lon_start;$Lon_stop)
C_TEXT:C284($Mnu_popup;$Txt_font)

ARRAY TEXT:C222($tTxt_fonts;0)

$Mnu_popup:=Create menu:C408

$Txt_font:=(OBJECT Get pointer:C1124(Object named:K67:5;"fontName"))->

If (Length:C16($Txt_font)>0)
	
	APPEND MENU ITEM:C411($Mnu_popup;$Txt_font)
	SET MENU ITEM PARAMETER:C1004($Mnu_popup;-1;$Txt_font)
	
	APPEND MENU ITEM:C411($Mnu_popup;"-")
	
End if 

  //remplit le tableau polices (de type Alpha ou Texte) avec les noms des polices disponibles dans votre système.
FONT LIST:C460($tTxt_fonts)

For ($Lon_i;1;Size of array:C274($tTxt_fonts);1)
	
	APPEND MENU ITEM:C411($Mnu_popup;$tTxt_fonts{$Lon_i})
	SET MENU ITEM PARAMETER:C1004($Mnu_popup;-1;$tTxt_fonts{$Lon_i})
	
End for 

$Txt_font:=Dynamic pop up menu:C1006($Mnu_popup)

If (Length:C16($Txt_font)>0)
	
	  //permet de déterminer précisément le texte actuellement sélectionné dans objet.
	GET HIGHLIGHT:C209(*;"comment";$Lon_start;$Lon_stop)
	
	  //permet de modifier un ou plusieurs attribut(s) de style dans le ou les objet(s) de formulaire désigné(s) par objet
	ST SET ATTRIBUTES:C1093(*;"comment";$Lon_start;$Lon_stop;Attribute font name:K65:5;$Txt_font)
	
	(OBJECT Get pointer:C1124(Object named:K67:5;"fontName"))->:=$Txt_font
End if 