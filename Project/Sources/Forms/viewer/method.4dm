  // ----------------------------------------------------
  // Method : Méthode formulaire : Viewer
  // Created 01/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_LONGINT:C283($Lon_bottom;$Lon_currentPage;$Lon_formEvent;$Lon_height;$Lon_left;$Lon_Page;$Lon_right;$Lon_timerEvent)
C_LONGINT:C283($Lon_top;$Lon_viewerPictureHeight;$Lon_viewerPictureWidth;$Lon_width)
C_PICTURE:C286($Pic_buffer;$Pic_mask)
C_REAL:C285($Num_offset)
C_TEXT:C284($Dom_picture;$Txt_sources)

$Lon_formEvent:=Form event code:C388
$Lon_currentPage:=FORM Get current page:C276

Case of 
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Load:K2:1)
		
		Compiler_SVG 
		
		MouseX:=-1
		MouseY:=-1
		
		  //Create the tabs {
		ARRAY TEXT:C222($tTxt_tab;0x0000)
		APPEND TO ARRAY:C911($tTxt_tab;Get localized string:C991("picture"))
		APPEND TO ARRAY:C911($tTxt_tab;Get localized string:C991("source"))
		$tTxt_tab:=1
		<>Lon_tabID:=xToolBox_tabCreate (-><>Pic_viewerTab;->$tTxt_tab;"black")  //}
		
		OBJECT SET RGB COLORS:C628(*;"_back";<>backgroundColor;<>backgroundColor)
		OBJECT SET VISIBLE:C603(*;"_back";<>showColoredBackground)
		
		OBJECT SET VISIBLE:C603(*;"_grigri@";Caps lock down:C547 & Shift down:C543)
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"fontSize"))->:=<>sourceFontSize
		
		If (Length:C16(<>SVG_viewerSource)=0)
			
			CLEAR VARIABLE:C89(<>SVG_viewerPicture)
			
		End if 
		
		If (Storage:C1525.svg.options ?? 0)
			
			SET MENU ITEM MARK:C208(3;10;"")
			SET MENU ITEM MARK:C208(3;11;Char:C90(18))
			
			FORM GOTO PAGE:C247(2)
			xToolBox_tabHandler (On Selection Change:K2:29;-><>Pic_viewerTab;<>Lon_tabID;2)
			
		End if 
		
		<>Lon_viewerTimerEvent:=-1
		SET TIMER:C645(-1)
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Unload:K2:2)
		
		xToolBox_tabHandler (On Unload:K2:2;-><>SVG_viewerPicture;<>Lon_tabID)
		
		CLEAR VARIABLE:C89(<>Pic_viewerTab)
		
		CLEAR VARIABLE:C89(<>SVG_viewerPicture)
		CLEAR VARIABLE:C89(<>SVG_viewerPictureBackup)
		
		CLEAR VARIABLE:C89(<>SVG_viewerSource)
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		$Lon_timerEvent:=<>Lon_viewerTimerEvent
		<>Lon_viewerTimerEvent:=0
		
		Case of 
				
				  //.....................................................
			: ($Lon_timerEvent=-1)  //INIT
				
				If (Storage:C1525.svg.options ?? 0)
					
					xToolBox_tabHandler (On Selection Change:K2:29;-><>Pic_viewerTab;<>Lon_tabID;2)
					
				End if 
				
				  //<>Lon_viewerTimerEvent:=1
				PICTURE PROPERTIES:C457(<>SVG_viewerPicture;$Lon_viewerPictureWidth;$Lon_viewerPictureHeight)
				
				(OBJECT Get pointer:C1124(Object named:K67:5;"width"))->:=$Lon_viewerPictureWidth
				(OBJECT Get pointer:C1124(Object named:K67:5;"height"))->:=$Lon_viewerPictureHeight
				(OBJECT Get pointer:C1124(Object named:K67:5;"size"))->:=xToolBox_BytesToString (Picture size:C356(<>SVG_viewerPictureBackup);"K";"";"";1)
				
				<>Lon_viewerTimerEvent:=2
				
				  //.....................................................
			: ($Lon_timerEvent=1)  //Display
				
				PICTURE PROPERTIES:C457(<>SVG_viewerPicture;$Lon_viewerPictureWidth;$Lon_viewerPictureHeight)
				
				(OBJECT Get pointer:C1124(Object named:K67:5;"width"))->:=$Lon_viewerPictureWidth
				(OBJECT Get pointer:C1124(Object named:K67:5;"height"))->:=$Lon_viewerPictureHeight
				(OBJECT Get pointer:C1124(Object named:K67:5;"size"))->:=xToolBox_BytesToString (Picture size:C356(<>SVG_viewerPictureBackup);"K";"";"";1)
				
				  //SVG SET ATTRIBUTE(*;"viewerPicture";"4d-debug-showBB";True)
				
				<>Lon_viewerTimerEvent:=3
				
				  //.....................................................
			: (Abs:C99($Lon_timerEvent)=2)  //Refresh
				
				If (Length:C16(<>SVG_viewerSource)=0)
					
					CLEAR VARIABLE:C89(<>SVG_viewerPicture)
					
				Else 
					
					$Lon_Page:=FORM Get current page:C276
					
					If ($Lon_timerEvent>0)
						
						If ($Lon_Page=1)
							
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
						
					Else 
						
						FORM GOTO PAGE:C247(0)
						FORM GOTO PAGE:C247($Lon_Page)
						REDRAW WINDOW:C456
						POST CLICK:C466(10;10;Current process:C322;*)
						
					End if 
				End if 
				
				  //.....................................................
			: ($Lon_timerEvent=3)  //Refresh
				
				  //.....................................................
			Else 
				
				  //.....................................................
		End case 
		
		If (<>Lon_viewerTimerEvent#0)
			
			SET TIMER:C645(-1)
			
		End if 
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Page Change:K2:54)
		
		$Lon_Page:=FORM Get current page:C276
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Activate:K2:9)
		
		If (<>Lon_viewerTimerEvent=0)
			
			<>Lon_viewerTimerEvent:=2
			SET TIMER:C645(-1)
			
		End if 
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Resize:K2:27)
		
		  //Center the tabs
		xToolBox_tabHandler (On Resize:K2:27;-><>Pic_viewerTab;<>Lon_tabID)
		
		If (<>automaticallyResize)
			
			  //Resize picture if necessary {
			PICTURE PROPERTIES:C457(<>SVG_viewerPictureBackup;$Lon_width;$Lon_height)
			OBJECT GET COORDINATES:C663(*;"_back";$Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
			
			$Num_offset:=Choose:C955($Lon_width>$Lon_height;($Lon_right-$Lon_left)/$Lon_width;($Lon_bottom-$Lon_top)/$Lon_height)
			
			<>SVG_viewerPicture:=<>SVG_viewerPictureBackup
			TRANSFORM PICTURE:C988(<>SVG_viewerPicture;Scale:K61:2;$Num_offset;$Num_offset)
			
			<>Lon_viewerTimerEvent:=1
			SET TIMER:C645(-1)  //}
			
		End if 
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Menu Selected:K2:14)
		
		Viewer_main ("menu")
		
		  //……………………………………………………………………………
	: ($Lon_formEvent=On Close Box:K2:21)
		
		CANCEL:C270
		
		  //……………………………………………………………………………
End case 