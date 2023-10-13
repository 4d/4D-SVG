// ----------------------------------------------------
// Method : Méthode formulaire : Viewer
// Created 01/10/08 by Vincent de Lachaux
// ----------------------------------------------------
var $offset : Real
var $root; $src : Text
var $mask; $picture : Picture
var $bottom; $height; $left; $page; $right; $timerEvent : Integer
var $top; $width : Integer
var $e : Object

$e:=FORM Event:C1606

Case of 
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Load:K2:1)
		
		Compiler_SVG
		
		MouseX:=-1
		MouseY:=-1
		
		// Create the tabs
		ARRAY TEXT:C222($tabs; 0x0000)
		APPEND TO ARRAY:C911($tabs; Get localized string:C991("picture"))
		APPEND TO ARRAY:C911($tabs; Get localized string:C991("source"))
		$tabs:=1
		<>Lon_tabID:=xToolBox_tabCreate(-><>Pic_viewerTab; ->$tabs; "black")
		
		OBJECT SET RGB COLORS:C628(*; "_back"; <>backgroundColor; <>backgroundColor)
		OBJECT SET VISIBLE:C603(*; "_back"; <>showColoredBackground)
		OBJECT SET VISIBLE:C603(*; "_background"; Not:C34(<>showColoredBackground))
		
		OBJECT SET VISIBLE:C603(*; "_grigri@"; Caps lock down:C547 & Shift down:C543)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "fontSize"))->:=<>sourceFontSize
		
		If (Length:C16(<>SVG_viewerSource)=0)
			
			CLEAR VARIABLE:C89(<>SVG_viewerPicture)
			
		End if 
		
		If (Storage:C1525.svg.options ?? 0)
			
			SET MENU ITEM MARK:C208(3; 10; "")
			SET MENU ITEM MARK:C208(3; 11; Char:C90(18))
			
			FORM GOTO PAGE:C247(2)
			xToolBox_tabHandler(On Selection Change:K2:29; -><>Pic_viewerTab; <>Lon_tabID; 2)
			
		End if 
		
		<>Lon_viewerTimerEvent:=-1
		SET TIMER:C645(-1)
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Unload:K2:2)
		
		xToolBox_tabHandler(On Unload:K2:2; -><>SVG_viewerPicture; <>Lon_tabID)
		
		CLEAR VARIABLE:C89(<>Pic_viewerTab)
		
		CLEAR VARIABLE:C89(<>SVG_viewerPicture)
		CLEAR VARIABLE:C89(<>SVG_viewerPictureBackup)
		
		CLEAR VARIABLE:C89(<>SVG_viewerSource)
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$timerEvent:=<>Lon_viewerTimerEvent
		<>Lon_viewerTimerEvent:=0
		
		Case of 
				
				//…………………………………………………………………………………………………………………
			: ($timerEvent=-1)  // INIT
				
				If (Storage:C1525.svg.options ?? 0)
					
					xToolBox_tabHandler(On Selection Change:K2:29; -><>Pic_viewerTab; <>Lon_tabID; 2)
					
				End if 
				
				// <>Lon_viewerTimerEvent:=1
				PICTURE PROPERTIES:C457(<>SVG_viewerPicture; $width; $height)
				
				OBJECT SET VALUE:C1742("width"; $width)
				OBJECT SET VALUE:C1742("height"; $height)
				OBJECT SET VALUE:C1742("size"; xToolBox_BytesToString(Picture size:C356(<>SVG_viewerPictureBackup); "K"; ""; ""; 1))
				
				<>Lon_viewerTimerEvent:=2
				
				//…………………………………………………………………………………………………………………
			: ($timerEvent=1)  // Display
				
				PICTURE PROPERTIES:C457(<>SVG_viewerPicture; $width; $height)
				
				OBJECT SET VALUE:C1742("width"; $width)
				OBJECT SET VALUE:C1742("height"; $height)
				OBJECT SET VALUE:C1742("size"; xToolBox_BytesToString(Picture size:C356(<>SVG_viewerPictureBackup); "K"; ""; ""; 1))
				
				//SVG SET ATTRIBUTE(*;"viewerPicture";"4d-debug-showBB";True)
				
				<>Lon_viewerTimerEvent:=3
				
				//…………………………………………………………………………………………………………………
			: (Abs:C99($timerEvent)=2)  // Refresh
				
				If (Length:C16(<>SVG_viewerSource)=0)
					
					CLEAR VARIABLE:C89(<>SVG_viewerPicture)
					
				Else 
					
					$page:=FORM Get current page:C276
					
					If ($timerEvent>0)
						
						If ($page=1)
							
							$src:=ST Get plain text:C1092(*; "xml")
							
							$root:=DOM Parse XML variable:C720($src)
							SVG EXPORT TO PICTURE:C1017($root; $picture; Own XML data source:K45:18)
							
							If (OK=1)
								
								If (Not:C34(Equal pictures:C1196($picture; <>SVG_viewerPictureBackup; $mask)))
									
									<>SVG_viewerPicture:=$picture
									<>SVG_viewerPictureBackup:=<>SVG_viewerPicture
									
								End if 
							End if 
						End if 
						
					Else 
						
						FORM GOTO PAGE:C247(0)
						FORM GOTO PAGE:C247($page)
						REDRAW WINDOW:C456
						POST CLICK:C466(10; 10; Current process:C322; *)
						
					End if 
				End if 
				
				<>Lon_viewerTimerEvent:=3
				
				//…………………………………………………………………………………………………………………
			: ($timerEvent=3)  // Refresh
				
				PICTURE PROPERTIES:C457(<>SVG_viewerPicture; $width; $height)
				
				OBJECT SET VALUE:C1742("width"; $width)
				OBJECT SET VALUE:C1742("height"; $height)
				OBJECT SET VALUE:C1742("size"; xToolBox_BytesToString(Picture size:C356(<>SVG_viewerPictureBackup); "K"; ""; ""; 1))
				
				//…………………………………………………………………………………………………………………
		End case 
		
		If (<>Lon_viewerTimerEvent#0)
			
			SET TIMER:C645(-1)
			
		End if 
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Activate:K2:9)
		
		If (<>Lon_viewerTimerEvent=0)
			
			<>Lon_viewerTimerEvent:=2
			SET TIMER:C645(-1)
			
		End if 
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Resize:K2:27)
		
		// Center the tabs
		xToolBox_tabHandler(On Resize:K2:27; -><>Pic_viewerTab; <>Lon_tabID)
		
		If (<>automaticallyResize)
			
			// Resize picture if necessary {
			PICTURE PROPERTIES:C457(<>SVG_viewerPictureBackup; $width; $height)
			OBJECT GET COORDINATES:C663(*; "_back"; $left; $top; $right; $bottom)
			
			$offset:=$width>$height\
				 ? ($right-$left)/$width\
				 : ($bottom-$top)/$height
			//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
			
			<>SVG_viewerPicture:=<>SVG_viewerPictureBackup
			TRANSFORM PICTURE:C988(<>SVG_viewerPicture; Scale:K61:2; $offset; $offset)
			
			<>Lon_viewerTimerEvent:=1
			SET TIMER:C645(-1)  // }
			
		End if 
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Menu Selected:K2:14)
		
		Viewer_main("menu")
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
	: ($e.code=On Close Box:K2:21)
		
		CANCEL:C270
		
		//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
End case 