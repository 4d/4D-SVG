  // Modified by Vincent de Lachaux (21/06/11)
  // It's now possible to edit the source, the picture is refresh {
  //FILTRER FRAPPE CLAVIER("")
C_LONGINT:C283($Lon_start;$Lon_stop)
C_TEXT:C284($Dom_root;$Txt_buffer)

If (Form event:C388=On Data Change:K2:15)
	
	  // Modified by Vincent de Lachaux (18/07/11)
	  // Source code is colorized ;-) {
	  //$Dom_root:=DOM Analyser variable XML(Self->;Faux)
	$Txt_buffer:=ST Get plain text:C1092(*;OBJECT Get name:C1087(Object current:K67:2))
	
	GET HIGHLIGHT:C209(Self:C308->;$Lon_start;$Lon_stop)
	Self:C308->:=viewer_sources ($Txt_buffer)
	HIGHLIGHT TEXT:C210(Self:C308->;$Lon_start;$Lon_stop)
	
	$Dom_root:=DOM Parse XML variable:C720($Txt_buffer)  //;False)
	  //}
	
	If (OK=1)
		
		SVG EXPORT TO PICTURE:C1017($Dom_root;<>SVG_viewerPicture)
		
	End if 
	
End if 
  //}