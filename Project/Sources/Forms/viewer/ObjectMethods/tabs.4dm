  // ----------------------------------------------------
  // Method : Méthode objet : viewer.◊Pic_viewerTab
  // Created 08/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_LONGINT:C283($Lon_Page)
C_PICTURE:C286($Pic_buffer;$Pic_mask)
C_TEXT:C284($Dom_picture;$Txt_sources)

$Lon_Page:=xToolBox_tabHandler (On Clicked:K2:4;-><>Pic_viewerTab;<>Lon_tabID)

If ($Lon_Page=1)  //image
	
	SET MENU ITEM MARK:C208(3;11;"")
	SET MENU ITEM MARK:C208(3;10;Char:C90(18))
	
	If (Length:C16(<>SVG_viewerSource)>0)
		
		$Txt_sources:=ST Get plain text:C1092(*;"xml")
		
		$Dom_picture:=DOM Parse XML variable:C720($Txt_sources)
		SVG EXPORT TO PICTURE:C1017($Dom_picture;$Pic_buffer;Own XML data source:K45:18)
		
		If (OK=1)
			
			If (Not:C34(Equal pictures:C1196($Pic_buffer;<>SVG_viewerPictureBackup;$Pic_mask)))
				
				<>SVG_viewerPicture:=$Pic_buffer
				<>SVG_viewerPictureBackup:=<>SVG_viewerPicture
				
			End if 
		End if 
	End if 
	
	<>Lon_viewerTimerEvent:=3
	SET TIMER:C645(-1)
	
Else 
	
	SET MENU ITEM MARK:C208(3;10;"")
	SET MENU ITEM MARK:C208(3;11;Char:C90(18))
	
End if 

FORM GOTO PAGE:C247($Lon_Page)

MouseX:=-1
MouseY:=-1