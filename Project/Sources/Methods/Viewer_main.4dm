//%attributes = {"invisible":true,"preemptive":"incapable"}
  // ----------------------------------------------------
  // Method : Viewer_main
  // Created 16/09/08 by vdl
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (11/04/11)
  // Added svgz support
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)

C_BOOLEAN:C305($Boo_recent)
C_LONGINT:C283($Lon_bottom;$Lon_color;$Lon_height;$Lon_i;$Lon_left;$Lon_line)
C_LONGINT:C283($Lon_menu;$Lon_parameters;$Lon_right;$Lon_top;$Lon_width;$Lon_windowRef)
C_PICTURE:C286($Pic_buffer)
C_REAL:C285($Num_offset)
C_TEXT:C284($Txt_buffer;$Txt_entryPoint;$Txt_mark;$Txt_menu;$Txt_menuBar;$Txt_Path)
C_TEXT:C284($Txt_root;$Txt_tempo)

If (False:C215)
	C_TEXT:C284(Viewer_main ;$1)
	C_TEXT:C284(Viewer_main ;$2)
End if 

$Lon_parameters:=Count parameters:C259

If ($Lon_parameters>=1)
	
	$Txt_entryPoint:=$1
	
End if 

Case of 
		
		  //___________________________________________________________
	: (Length:C16($Txt_entryPoint)=0)
		
		Case of 
				
				  //……………………………………………………………………
			: (Method called on error:C704=Current method name:C684)
				
				  //……………………………………………………………………
			Else 
				
				  //This method must be executed in a new process
				BRING TO FRONT:C326(New process:C317(Current method name:C684;0;Current method name:C684;"_run";*))
				
				  //……………………………………………………………………
		End case 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="menu")
		
		If ($Lon_parameters>=2)
			
			$Txt_buffer:=$2
			
		Else 
			
			$Txt_buffer:=Get selected menu item parameter:C1005
			
		End if 
		
		Case of 
				
				  //…………………………………………………………
			: ($Txt_buffer="open@")
				
				If ($Lon_parameters>=2)
					
					$Txt_Path:=Replace string:C233($2;"open";"";1)
					$Boo_recent:=($Txt_Path="_recent@")
					$Txt_Path:=Replace string:C233($Txt_Path;"_recent";"";1)
					
				Else 
					
					READ PICTURE FILE:C678("";$Pic_buffer)
					
					If (OK=1)
						
						$Txt_Path:=Document
						
					End if 
				End if 
				
				If (Length:C16($Txt_path)>0)
					
					If (Test path name:C476($Txt_path)=Is a document:K24:1)
						
						ON ERR CALL:C155("Viewer_main")  //=========================== < NO ERROR >
						
						  // Modified by Vincent de Lachaux (11/04/11)
						  // Added svgz support {
						If ($Txt_Path="@.svgz")
							
							READ PICTURE FILE:C678($Txt_Path;$Pic_buffer)
							
							If (OK=1)
								
								$Txt_tempo:=Temporary folder:C486+"tempo.svg"
								
								WRITE PICTURE FILE:C680($Txt_tempo;$Pic_buffer;".svg")
								
								If (OK=1)
									
									$Txt_root:=DOM Parse XML source:C719($Txt_tempo)
									
									DELETE DOCUMENT:C159($Txt_tempo)
									
								End if 
							End if 
							
						Else 
							
							$Txt_root:=DOM Parse XML source:C719($Txt_path)
							
						End if 
						  //}
						
						If (OK=1)
							
							SVG EXPORT TO PICTURE:C1017($Txt_root;<>SVG_viewerPicture;Copy XML data source:K45:17)
							<>SVG_viewerPictureBackup:=<>SVG_viewerPicture
							
							DOM EXPORT TO VAR:C863($Txt_root;$Txt_buffer)
							<>SVG_viewerSource:=viewer_sources ($Txt_buffer)
							
							If (Not:C34($Boo_recent))
								
								If (Count menu items:C405(<>svg_recentMenuRef)>0)
									
									INSERT MENU ITEM:C412(<>svg_recentMenuRef;0;xToolbox_GetLastItemFromPath ($Txt_Path))
									SET MENU ITEM PROPERTY:C973(<>svg_recentMenuRef;-1;"path";$Txt_Path)
									SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef;-1;"recent_"+String:C10(Count menu items:C405(<>svg_recentMenuRef)))
									
								Else 
									
									APPEND MENU ITEM:C411(<>svg_recentMenuRef;xToolbox_GetLastItemFromPath ($Txt_Path))
									SET MENU ITEM PROPERTY:C973(<>svg_recentMenuRef;-1;"path";$Txt_Path)
									SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef;-1;"recent_"+String:C10(Count menu items:C405(<>svg_recentMenuRef)))
									
									APPEND MENU ITEM:C411(<>svg_recentMenuRef;"-")
									APPEND MENU ITEM:C411(<>svg_recentMenuRef;Get localized string:C991("clearMenu"))
									SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef;-1;"recentClear")
									
									ENABLE MENU ITEM:C149(1;2)
									
								End if 
							End if 
							
							<>Lon_viewerTimerEvent:=1
							SET TIMER:C645(-1)
							
						End if 
						
						DOM CLOSE XML:C722($Txt_root)
						
						ON ERR CALL:C155("")  //==================================== </ NO ERROR >
						
					End if 
				End if 
				
				  //…………………………………………………………
			: ($Txt_buffer="close")
				
				CANCEL:C270
				
				  //…………………………………………………………
			: ($Txt_buffer="save")
				
				WRITE PICTURE FILE:C680("";<>SVG_viewerPicture;".svg")
				
				  //…………………………………………………………
			: ($Txt_buffer="showColoredBackground")
				
				$Lon_menu:=Menu selected:C152\65536
				$Lon_line:=Menu selected:C152%65536
				$Txt_mark:=Get menu item mark:C428($Lon_menu;$Lon_line)
				
				If (Length:C16($Txt_mark)=0)
					
					SET MENU ITEM MARK:C208($Lon_menu;$Lon_line;Char:C90(18))
					<>showColoredBackground:=True:C214
					
				Else 
					
					SET MENU ITEM MARK:C208($Lon_menu;$Lon_line;"")
					<>showColoredBackground:=False:C215
					
				End if 
				
				OBJECT SET VISIBLE:C603(*;"_back";<>showColoredBackground)
				
				  //…………………………………………………………
			: ($Txt_buffer="backgroundColor")
				
				$Lon_color:=Select RGB color:C956(<>backgroundColor)
				
				If (OK=1)
					
					<>backgroundColor:=$Lon_color
					OBJECT SET RGB COLORS:C628(*;"_back";<>backgroundColor;<>backgroundColor)
					
				End if 
				
				  //…………………………………………………………
			: ($Txt_buffer="actualSize")
				
				<>SVG_viewerPicture:=<>SVG_viewerPictureBackup
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				  //…………………………………………………………
			: ($Txt_buffer="zoomToFit")
				
				PICTURE PROPERTIES:C457(<>SVG_viewerPictureBackup;$Lon_width;$Lon_height)
				OBJECT GET COORDINATES:C663(*;"_back";$Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
				
				$Num_offset:=Choose:C955($Lon_width>$Lon_height;($Lon_right-$Lon_left)/$Lon_width;($Lon_bottom-$Lon_top)/$Lon_height)
				
				<>SVG_viewerPicture:=<>SVG_viewerPictureBackup
				TRANSFORM PICTURE:C988(<>SVG_viewerPicture;Scale:K61:2;$Num_offset;$Num_offset)
				
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				  //…………………………………………………………
			: ($Txt_buffer="automaticallyResize")
				
				$Lon_menu:=Menu selected:C152\65536
				$Lon_line:=Menu selected:C152%65536
				$Txt_mark:=Get menu item mark:C428($Lon_menu;$Lon_line)
				
				If (Length:C16($Txt_mark)=0)
					
					SET MENU ITEM MARK:C208($Lon_menu;$Lon_line;Char:C90(18))
					<>automaticallyResize:=True:C214
					
				Else 
					
					SET MENU ITEM MARK:C208($Lon_menu;$Lon_line;"")
					<>automaticallyResize:=False:C215
					
				End if 
				
				  //…………………………………………………………
			: ($Txt_buffer="zoomIn")
				
				TRANSFORM PICTURE:C988(<>SVG_viewerPicture;Scale:K61:2;1.5;1.5)
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				  //…………………………………………………………
			: ($Txt_buffer="zoomOut")
				
				TRANSFORM PICTURE:C988(<>SVG_viewerPicture;Scale:K61:2;0.5;0.5)
				<>Lon_viewerTimerEvent:=1
				SET TIMER:C645(-1)
				
				  //…………………………………………………………
			: ($Txt_buffer="viewPicture")
				
				If (FORM Get current page:C276#1)
					
					SET MENU ITEM MARK:C208(3;11;"")
					SET MENU ITEM MARK:C208(3;10;Char:C90(18))
					xToolBox_tabHandler (On Selection Change:K2:29;-><>Pic_viewerTab;<>Lon_tabID;1)
					FORM GOTO PAGE:C247(1)
					REDRAW WINDOW:C456
					
				End if 
				
				  //…………………………………………………………
			: ($Txt_buffer="viewSource")
				
				If (FORM Get current page:C276#2)
					
					SET MENU ITEM MARK:C208(3;10;"")
					SET MENU ITEM MARK:C208(3;11;Char:C90(18))
					xToolBox_tabHandler (On Selection Change:K2:29;-><>Pic_viewerTab;<>Lon_tabID;2)
					FORM GOTO PAGE:C247(2)
					REDRAW WINDOW:C456
					
				End if 
				
				  //…………………………………………………………
			: ($Txt_buffer="recentClear")
				
				For ($Lon_i;Count menu items:C405(<>svg_recentMenuRef);1;-1)
					
					DELETE MENU ITEM:C413(<>svg_recentMenuRef;$Lon_i)
					
				End for 
				
				DISABLE MENU ITEM:C150(1;2)
				
				  //…………………………………………………………
			: ($Txt_buffer="recent@")
				
				GET MENU ITEM PROPERTY:C972(<>svg_recentMenuRef;Menu selected:C152%65536;"path";$Txt_Path)
				Viewer_main ("menu";"open_recent"+$Txt_Path)
				
				  //…………………………………………………………
		End case 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_run")
		
		  //First launch of this method executed in a new process
		Viewer_main ("_declarations")
		
		PREFERENCES ("viewerOptions";-><>showColoredBackground;-><>backgroundColor;-><>automaticallyResize;-><>sourceFontSize)
		
		Viewer_main ("_init")
		
		$Lon_windowRef:=Open form window:C675("viewer";Plain form window:K39:10+4096;Horizontally centered:K39:1;Vertically centered:K39:4;*)
		
		DIALOG:C40("viewer")
		CLOSE WINDOW:C154
		
		PREFERENCES ("viewerOptions.set";-><>showColoredBackground;-><>backgroundColor;-><>automaticallyResize;-><>sourceFontSize)
		
		ARRAY TEXT:C222($tTxt_Recent;0x0000)
		
		For ($Lon_i;1;Count menu items:C405(<>svg_recentMenuRef)-2;1)
			
			GET MENU ITEM PROPERTY:C972(<>svg_recentMenuRef;$Lon_i;"path";$Txt_buffer)
			APPEND TO ARRAY:C911($tTxt_Recent;$Txt_buffer)
			
		End for 
		
		PREFERENCES ("openRecent.set";->$tTxt_Recent)
		
		Viewer_main ("_deinit")
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_declarations")
		
		Compiler_SVG 
		COMPILER_Not_Thread_Safe 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_init")
		
		$Txt_menuBar:=Create menu:C408
		
		  //++++++++++++++++ FILE
		$Txt_menu:=Create menu:C408
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonOpen")+"…")
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"open")
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"O";0)
		
		  //================ RECENT
		ARRAY TEXT:C222($tTxt_Recent;0x0000)
		PREFERENCES ("openRecent";->$tTxt_Recent)
		
		<>svg_recentMenuRef:=Create menu:C408
		
		For ($Lon_i;1;Size of array:C274($tTxt_Recent);1)
			
			APPEND MENU ITEM:C411(<>svg_recentMenuRef;xToolbox_GetLastItemFromPath ($tTxt_Recent{$Lon_i}))
			SET MENU ITEM PROPERTY:C973(<>svg_recentMenuRef;-1;"path";$tTxt_Recent{$Lon_i})
			SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef;-1;"recent_"+String:C10($Lon_i))
			
		End for 
		
		If (Size of array:C274($tTxt_Recent)>0)
			
			APPEND MENU ITEM:C411(<>svg_recentMenuRef;"-")
			APPEND MENU ITEM:C411(<>svg_recentMenuRef;Get localized string:C991("clearMenu"))
			SET MENU ITEM PARAMETER:C1004(<>svg_recentMenuRef;-1;"recentClear")
			APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("openRecent");<>svg_recentMenuRef)
			
		Else 
			
			APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("openRecent");<>svg_recentMenuRef)
			DISABLE MENU ITEM:C150($Txt_menu;-1)
			
		End if 
		
		APPEND MENU ITEM:C411($Txt_menu;"-")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonClose"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"close")
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"W";0)
		
		APPEND MENU ITEM:C411($Txt_menu;"-")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonSaveDial"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"save")
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"S";0)
		
		APPEND MENU ITEM:C411($Txt_menuBar;Get localized string:C991("CommonMenuFile");$Txt_menu)
		
		  //++++++++++++++++ EDIT
		$Txt_menu:=Create menu:C408
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemUndo"))
		SET MENU ITEM PROPERTY:C973($Txt_menu;-1;Associated standard action:K28:8;_o_Undo action:K59:16)
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"Z";0)
		
		APPEND MENU ITEM:C411($Txt_menu;"-")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemCut"))
		
		DISABLE MENU ITEM:C150($Txt_menu;-1)
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"X";0)
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemCopy"))
		SET MENU ITEM PROPERTY:C973($Txt_menu;-1;Associated standard action:K28:8;_o_Copy action:K59:19)
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"C";0)
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemPaste"))
		SET MENU ITEM PROPERTY:C973($Txt_menu;-1;Associated standard action:K28:8;_o_Paste action:K59:20)
		
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"V";0)
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemClear"))
		
		DISABLE MENU ITEM:C150($Txt_menu;-1)
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemSelectAll"))
		SET MENU ITEM PROPERTY:C973($Txt_menu;-1;Associated standard action:K28:8;_o_Select all action:K59:22)
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"A";0)
		
		APPEND MENU ITEM:C411($Txt_menu;"-")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("CommonMenuItemShowClipboard"))
		SET MENU ITEM PROPERTY:C973($Txt_menu;-1;Associated standard action:K28:8;_o_Show clipboard action:K59:23)
		
		APPEND MENU ITEM:C411($Txt_menuBar;Get localized string:C991("CommonMenuEdit");$Txt_menu)
		
		  //++++++++++++++++ VIEW
		$Txt_menu:=Create menu:C408
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("showColoredBackground"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"showColoredBackground")
		
		If (<>showColoredBackground)
			
			SET MENU ITEM MARK:C208($Txt_menu;-1;Char:C90(18))
			
		End if 
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("backgroundColor"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"backgroundColor")
		
		APPEND MENU ITEM:C411($Txt_menu;"-")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("actualSize"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"actualSize")
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"=";0)
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("zoomToFit"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"zoomToFit")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("automaticallyResize"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"automaticallyResize")
		
		If (<>automaticallyResize)
			
			SET MENU ITEM MARK:C208($Txt_menu;-1;Char:C90(18))
			
		End if 
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("zoomIn"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"zoomIn")
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"+";0)
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("zoomOut"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"zoomOut")
		SET MENU ITEM SHORTCUT:C423($Txt_menu;-1;"-";0)
		
		APPEND MENU ITEM:C411($Txt_menu;"-")
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("picture"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"viewPicture")
		SET MENU ITEM MARK:C208($Txt_menu;-1;Char:C90(18))
		
		APPEND MENU ITEM:C411($Txt_menu;Get localized string:C991("source"))
		SET MENU ITEM PARAMETER:C1004($Txt_menu;-1;"viewSource")
		
		APPEND MENU ITEM:C411($Txt_menuBar;Get localized string:C991("menuView");$Txt_menu)
		
		SET MENU BAR:C67($Txt_menuBar)
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_deinit")
		
		  //CLEAR LIST(<>Lon_tabID;*)
		xToolBox_RELEASE_MENU (Get menu bar reference:C979)
		
		  //___________________________________________________________
	Else 
		
		TRACE:C157
		
		  //___________________________________________________________
End case 