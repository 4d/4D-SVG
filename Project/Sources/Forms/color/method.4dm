  // ----------------------------------------------------
  // Form method : color - (4D SVG)
  // ID[0CDD15E84E0E4B9E86FC7C0163B773CB]
  // Created #17-3-2015 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($Lon_formEvent)

  // ----------------------------------------------------
  // Initialisations
$Lon_formEvent:=Form event:C388

  // ----------------------------------------------------

Case of 
		  //______________________________________________________
	: ($Lon_formEvent=On Load:K2:1)
		
		C_LONGINT:C283(R;G;B)
		
		colors:=Load list:C383("color_values")
		SORT LIST:C391(colors)
		
		SET TIMER:C645(-1)
		  //______________________________________________________
	: ($Lon_formEvent=On Unload:K2:2)
		
		CLEAR LIST:C377(colors)
		
		  //______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		SET TIMER:C645(0)
		
		GET LIST ITEM PARAMETER:C985(colors;*;"R";R)
		GET LIST ITEM PARAMETER:C985(colors;*;"G";G)
		GET LIST ITEM PARAMETER:C985(colors;*;"B";B)
		
		OBJECT SET RGB COLORS:C628(*;"Rectangle";Foreground color:K23:1;(R << 16)+(G << 8)+B)
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"color"))->:=(R << 16)+(G << 8)+B
		
		  //______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215;"Form event activated unnecessary ("+String:C10($Lon_formEvent)+")")
		
		  //______________________________________________________
End case 