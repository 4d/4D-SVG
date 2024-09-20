//%attributes = {"invisible":true,"preemptive":"incapable"}
// ----------------------------------------------------
// Method : Viewer_main
// Created 16/09/08 by vdl
// ----------------------------------------------------
// Modified by Vincent de Lachaux (11/04/11)
// Added svgz support
// ----------------------------------------------------
#DECLARE($action : Text; $choice : Text)

var $offset : Real
var $t; $mark; $menu; $menuBar; $path; $root : Text
var $tempo : Text
var $pic : Picture
var $recent : Boolean
var $bottom; $color; $height; $i; $left; $selectedLine : Integer
var $selectedMenu; $right; $top; $width; $winRef : Integer

Case of 
		
		//___________________________________________________________
	: (Length:C16($action)=0)
		
		//This method must be executed in a new process
		BRING TO FRONT:C326(New process:C317(Current method name:C684; 0; Current method name:C684; "_run"; *))
		
		//___________________________________________________________
	: ($action="menu")
		
		$choice:=$choice || Get selected menu item parameter:C1005
		
		Case of 
				
				//…………………………………………………………
			: ($choice="open@")
				
				If (Count parameters:C259>=2)
					
					$path:=Replace string:C233($choice; "open"; ""; 1)
					$recent:=($path="_recent@")
					$path:=Replace string:C233($path; "_recent"; ""; 1)
					
				Else 
					
					READ PICTURE FILE:C678(""; $pic)
					
					If (OK=1)
						
						$path:=Document
						
					End if 
				End if 
				
				If (Length:C16($path)>0)
					
					If (Test path name:C476($path)=Is a document:K24:1)
						
						Try  //=========================== < NO ERROR >
							
							// Modified by Vincent de Lachaux (11/04/11)
							// Added svgz support {
							If ($path="@.svgz")
								
								READ PICTURE FILE:C678($path; $pic)
								
								If (OK=1)
									
									$tempo:=Temporary folder:C486+"tempo.svg"
									
									WRITE PICTURE FILE:C680($tempo; $pic; ".svg")
									
									If (OK=1)
										
										$root:=DOM Parse XML source:C719($tempo)
										
										DELETE DOCUMENT:C159($tempo)
										
									End if 
								End if 
								
							Else 
								
								$root:=DOM Parse XML source:C719($path)
								
							End if 
							//}
							
							If (OK=1)
								
								SVG EXPORT TO PICTURE:C1017($root; <>SVG_viewerPicture; Copy XML data source:K45:17)
								<>SVG_viewerPictureBackup:=<>SVG_viewerPicture
								
								DOM EXPORT TO VAR:C863($root; $t)
								<>SVG_viewerSource:=viewer_sources($t)
								
								If (Not:C34($recent))
									
									If (Count menu items:C405(<>svg_recentMenuRef)>0)
										
										INSERT MENU ITEM:C412(<>svg_recentMenuRef; 0; xToolbox_GetLastItemFromPath($path))
										SET MENU ITEM PROPERTY:C973(<>svg_recentMenuRef; -1; "path"; $path)
										SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef; -1; "recent_"+String:C10(Count menu items:C405(<>svg_recentMenuRef)))
										
									Else 
										
										APPEND MENU ITEM:C411(<>svg_recentMenuRef; xToolbox_GetLastItemFromPath($path))
										SET MENU ITEM PROPERTY:C973(<>svg_recentMenuRef; -1; "path"; $path)
										SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef; -1; "recent_"+String:C10(Count menu items:C405(<>svg_recentMenuRef)))
										
										APPEND MENU ITEM:C411(<>svg_recentMenuRef; "-")
										APPEND MENU ITEM:C411(<>svg_recentMenuRef; Localized string:C991("clearMenu"))
										SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef; -1; "recentClear")
										
										ENABLE MENU ITEM:C149(1; 2)
										
									End if 
								End if 
								
								<>Lon_viewerTimerEvent:=1
								SET TIMER:C645(-1)
								
							End if 
							
							DOM CLOSE XML:C722($root)
							
						End try  //==================================== </ NO ERROR >
						
					End if 
				End if 
				
				//…………………………………………………………
			: ($choice="close")
				
				CANCEL:C270
				
				//…………………………………………………………
			: ($choice="save")
				
				WRITE PICTURE FILE:C680(""; <>SVG_viewerPicture; ".svg")
				
				//…………………………………………………………
			: ($choice="showColoredBackground")
				
				$selectedMenu:=Menu selected:C152\65536
				$selectedLine:=Menu selected:C152%65536
				$mark:=Get menu item mark:C428($selectedMenu; $selectedLine)
				
				If (Length:C16($mark)=0)
					
					SET MENU ITEM MARK:C208($selectedMenu; $selectedLine; Char:C90(18))
					<>showColoredBackground:=True:C214
					
				Else 
					
					SET MENU ITEM MARK:C208($selectedMenu; $selectedLine; "")
					<>showColoredBackground:=False:C215
					
				End if 
				
				OBJECT SET VISIBLE:C603(*; "_back"; <>showColoredBackground)
				OBJECT SET VISIBLE:C603(*; "_background"; Not:C34(<>showColoredBackground))
				
				//…………………………………………………………
			: ($choice="backgroundColor")
				
				$color:=Select RGB color:C956(<>backgroundColor)
				
				If (OK=1)
					
					<>backgroundColor:=$color
					OBJECT SET RGB COLORS:C628(*; "_back"; <>backgroundColor; <>backgroundColor)
					
				End if 
				
				//…………………………………………………………
			: ($choice="actualSize")
				
				<>SVG_viewerPicture:=<>SVG_viewerPictureBackup
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				//…………………………………………………………
			: ($choice="zoomToFit")
				
				PICTURE PROPERTIES:C457(<>SVG_viewerPictureBackup; $width; $height)
				OBJECT GET COORDINATES:C663(*; "_back"; $left; $top; $right; $bottom)
				
				$offset:=Choose:C955($width>$height; ($right-$left)/$width; ($bottom-$top)/$height)
				
				<>SVG_viewerPicture:=<>SVG_viewerPictureBackup
				TRANSFORM PICTURE:C988(<>SVG_viewerPicture; Scale:K61:2; $offset; $offset)
				
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				//…………………………………………………………
			: ($choice="automaticallyResize")
				
				$selectedMenu:=Menu selected:C152\65536
				$selectedLine:=Menu selected:C152%65536
				$mark:=Get menu item mark:C428($selectedMenu; $selectedLine)
				
				If (Length:C16($mark)=0)
					
					SET MENU ITEM MARK:C208($selectedMenu; $selectedLine; Char:C90(18))
					<>automaticallyResize:=True:C214
					
				Else 
					
					SET MENU ITEM MARK:C208($selectedMenu; $selectedLine; "")
					<>automaticallyResize:=False:C215
					
				End if 
				
				//…………………………………………………………
			: ($choice="zoomIn")
				
				TRANSFORM PICTURE:C988(<>SVG_viewerPicture; Scale:K61:2; 1.5; 1.5)
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				//…………………………………………………………
			: ($choice="zoomOut")
				
				TRANSFORM PICTURE:C988(<>SVG_viewerPicture; Scale:K61:2; 0.5; 0.5)
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				//…………………………………………………………
			: ($choice="viewPicture")
				
				If (FORM Get current page:C276#1)
					
					SET MENU ITEM MARK:C208(3; 11; "")
					SET MENU ITEM MARK:C208(3; 10; Char:C90(18))
					xToolBox_tabHandler(On Selection Change:K2:29; -><>Pic_viewerTab; <>Lon_tabID; 1)
					FORM GOTO PAGE:C247(1)
					REDRAW WINDOW:C456
					
				End if 
				
				//…………………………………………………………
			: ($choice="viewSource")
				
				If (FORM Get current page:C276#2)
					
					SET MENU ITEM MARK:C208(3; 10; "")
					SET MENU ITEM MARK:C208(3; 11; Char:C90(18))
					xToolBox_tabHandler(On Selection Change:K2:29; -><>Pic_viewerTab; <>Lon_tabID; 2)
					FORM GOTO PAGE:C247(2)
					REDRAW WINDOW:C456
					
				End if 
				
				//…………………………………………………………
			: ($choice="recentClear")
				
				For ($i; Count menu items:C405(<>svg_recentMenuRef); 1; -1)
					
					DELETE MENU ITEM:C413(<>svg_recentMenuRef; $i)
					
				End for 
				
				DISABLE MENU ITEM:C150(1; 2)
				
				//…………………………………………………………
			: ($choice="recent@")
				
				GET MENU ITEM PROPERTY:C972(<>svg_recentMenuRef; Menu selected:C152%65536; "path"; $path)
				Viewer_main("menu"; "open_recent"+$path)
				
				//…………………………………………………………
		End case 
		
		//___________________________________________________________
	: ($action="_run")
		
		//First launch of this method executed in a new process
		Viewer_main("_declarations")
		
		PREFERENCES("viewerOptions"; -><>showColoredBackground; -><>backgroundColor; -><>automaticallyResize; -><>sourceFontSize)
		
		Viewer_main("_init")
		
		$winRef:=Open form window:C675("viewer"; Plain form window:K39:10+4096; Horizontally centered:K39:1; Vertically centered:K39:4; *)
		
		DIALOG:C40("viewer")
		CLOSE WINDOW:C154
		
		PREFERENCES("viewerOptions.set"; -><>showColoredBackground; -><>backgroundColor; -><>automaticallyResize; -><>sourceFontSize)
		
		ARRAY TEXT:C222($_recents; 0x0000)
		
		For ($i; 1; Count menu items:C405(<>svg_recentMenuRef)-2; 1)
			
			GET MENU ITEM PROPERTY:C972(<>svg_recentMenuRef; $i; "path"; $t)
			APPEND TO ARRAY:C911($_recents; $t)
			
		End for 
		
		PREFERENCES("openRecent.set"; ->$_recents)
		
		Viewer_main("_deinit")
		
		//___________________________________________________________
	: ($action="_declarations")
		
		Compiler_SVG
		COMPILER_Not_Thread_Safe
		
		//___________________________________________________________
	: ($action="_init")
		
		$menuBar:=Create menu:C408
		
		//++++++++++++++++ FILE
		$menu:=Create menu:C408
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonOpen")+"…")
		SET MENU ITEM PARAMETER:C1004($menu; -1; "open")
		SET MENU ITEM SHORTCUT:C423($menu; -1; "O"; 0)
		
		//================ RECENT
		ARRAY TEXT:C222($_recents; 0x0000)
		PREFERENCES("openRecent"; ->$_recents)
		
		<>svg_recentMenuRef:=Create menu:C408
		
		For ($i; 1; Size of array:C274($_recents); 1)
			
			APPEND MENU ITEM:C411(<>svg_recentMenuRef; xToolbox_GetLastItemFromPath($_recents{$i}))
			SET MENU ITEM PROPERTY:C973(<>svg_recentMenuRef; -1; "path"; $_recents{$i})
			SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef; -1; "recent_"+String:C10($i))
			
		End for 
		
		If (Size of array:C274($_recents)>0)
			
			APPEND MENU ITEM:C411(<>svg_recentMenuRef; "-")
			APPEND MENU ITEM:C411(<>svg_recentMenuRef; Localized string:C991("clearMenu"))
			SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef; -1; "recentClear")
			APPEND MENU ITEM:C411($menu; Localized string:C991("openRecent"); <>svg_recentMenuRef)
			
		Else 
			
			APPEND MENU ITEM:C411($menu; Localized string:C991("openRecent"); <>svg_recentMenuRef)
			DISABLE MENU ITEM:C150($menu; -1)
			
		End if 
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonClose"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "close")
		SET MENU ITEM SHORTCUT:C423($menu; -1; "W"; 0)
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonSaveDial"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "save")
		SET MENU ITEM SHORTCUT:C423($menu; -1; "S"; 0)
		
		APPEND MENU ITEM:C411($menuBar; Localized string:C991("CommonMenuFile"); $menu)
		
		//++++++++++++++++ EDIT
		$menu:=Create menu:C408
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemUndo"))
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; _o_Undo action:K59:16)
		SET MENU ITEM SHORTCUT:C423($menu; -1; "Z"; 0)
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemCut"))
		
		DISABLE MENU ITEM:C150($menu; -1)
		SET MENU ITEM SHORTCUT:C423($menu; -1; "X"; 0)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemCopy"))
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; _o_Copy action:K59:19)
		SET MENU ITEM SHORTCUT:C423($menu; -1; "C"; 0)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemPaste"))
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; _o_Paste action:K59:20)
		
		SET MENU ITEM SHORTCUT:C423($menu; -1; "V"; 0)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemClear"))
		
		DISABLE MENU ITEM:C150($menu; -1)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemSelectAll"))
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; _o_Select all action:K59:22)
		SET MENU ITEM SHORTCUT:C423($menu; -1; "A"; 0)
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("CommonMenuItemShowClipboard"))
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action name:K28:8; _o_Show clipboard action:K59:23)
		
		APPEND MENU ITEM:C411($menuBar; Localized string:C991("CommonMenuEdit"); $menu)
		
		//++++++++++++++++ VIEW
		$menu:=Create menu:C408
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("showColoredBackground"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "showColoredBackground")
		
		If (<>showColoredBackground)
			
			SET MENU ITEM MARK:C208($menu; -1; Char:C90(18))
			
		End if 
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("backgroundColor"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "backgroundColor")
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("actualSize"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "actualSize")
		SET MENU ITEM SHORTCUT:C423($menu; -1; "="; 0)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("zoomToFit"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "zoomToFit")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("automaticallyResize"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "automaticallyResize")
		
		If (<>automaticallyResize)
			
			SET MENU ITEM MARK:C208($menu; -1; Char:C90(18))
			
		End if 
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("zoomIn"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "zoomIn")
		SET MENU ITEM SHORTCUT:C423($menu; -1; "+"; 0)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("zoomOut"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "zoomOut")
		SET MENU ITEM SHORTCUT:C423($menu; -1; "-"; 0)
		
		APPEND MENU ITEM:C411($menu; "-")
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("picture"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "viewPicture")
		SET MENU ITEM MARK:C208($menu; -1; Char:C90(18))
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("source"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "viewSource")
		
		APPEND MENU ITEM:C411($menuBar; Localized string:C991("menuView"); $menu)
		
		SET MENU BAR:C67($menuBar)
		
		//___________________________________________________________
	: ($action="_deinit")
		
		//CLEAR LIST(<>Lon_tabID;*)
		xToolBox_RELEASE_MENU(Get menu bar reference:C979)
		
		//___________________________________________________________
	Else 
		
		TRACE:C157
		
		//___________________________________________________________
End case 