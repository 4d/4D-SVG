//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Method : Color_main
  // Created 27/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)

C_BLOB:C604($x)
C_BOOLEAN:C305($Boo_White)
C_LONGINT:C283($Lon_column;$Lon_currentPage;$Lon_formEvent;$Lon_i;$Lon_index;$Lon_line)
C_LONGINT:C283($Lon_parameters;$Lon_timerEvent;$Lon_windowRef)
C_PICTURE:C286($p)
C_TEXT:C284($Txt_color;$Txt_ColorThemeCode;$Txt_entryPoint;$t;$Dom_svg;$t)

If (False:C215)
	C_TEXT:C284(Color_main ;$1)
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
				BRING TO FRONT:C326(New process:C317(Current method name:C684;0;"$"+Current method name:C684;"_run";*))
				
				  //……………………………………………………………………
		End case 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="onDrag")
		
		LISTBOX GET CELL POSITION:C971(<>tBoo_listbox;$Lon_column;$Lon_line)
		
		If (Length:C16(<>tTxt_colorNames{$Lon_line})>0)
			
			$Txt_color:=<>tTxt_colorNames{$Lon_line}
			
			If (<>Lon_opacity#100)
				
				$Txt_color:=$Txt_color+":"+String:C10(<>Lon_opacity)
				
			End if 
			
			SET TEXT TO PASTEBOARD:C523("\""+$Txt_color+"\"")
			$Dom_svg:=SVG_New (40;40)
			$t:=SVG_New_rect ($Dom_svg;0;0;40;40;0;0;"none";$Txt_color;0)
			$p:=SVG_Export_to_picture ($Dom_svg)
			PICTURE TO BLOB:C692($p;$x;".png")
			APPEND DATA TO PASTEBOARD:C403("com.4d.private.picture.png";$x)
			
		End if 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="formMethod")
		
		$Lon_formEvent:=Form event code:C388
		$Lon_currentPage:=FORM Get current page:C276
		
		Case of 
				
				  //……………………………………………………………………………
			: ($Lon_formEvent=On Timer:K2:25)
				
				SET TIMER:C645(0)
				$Lon_timerEvent:=<>Lon_timerEvent
				<>Lon_timerEvent:=0
				
				Case of 
						
						  //.....................................................
					: ($Lon_timerEvent=-1)  //INIT
						
						ARRAY PICTURE:C279(<>tPic_Colors;0x0000)
						ARRAY TEXT:C222(<>tTxt_colorNames;0x0000)
						
						For ($Lon_i;1;10;1)
							
							$Dom_svg:=SVG_New (245;30)
							$t:=SVG_New_rect ($Dom_svg;0;0;245;30;0;0;"none";"none";0)
							$t:=SVG_New_text ($Dom_svg;Get localized string:C991("ColorTheme_"+String:C10($Lon_i));5;8;"'lucida grande' 'arial'";12;Bold:K14:2;Align left:K42:2;"cadetblue")
							$p:=SVG_Export_to_picture ($Dom_svg)
							SVG_CLEAR ($Dom_svg)
							
							APPEND TO ARRAY:C911(<>tPic_Colors;$p)
							APPEND TO ARRAY:C911(<>tTxt_colorNames;"")
							
							$Txt_ColorThemeCode:=Get localized string:C991("ColorThemeCode_"+String:C10($Lon_i))
							$Lon_index:=0
							
							Repeat 
								
								$Lon_index:=$Lon_index+1
								$Txt_color:=Get localized string:C991($Txt_ColorThemeCode+String:C10($Lon_index;"00"))
								
								If (OK=1)
									
									If ($Txt_color[[1]]="_")
										
										$Txt_color:=Delete string:C232($Txt_color;1;1)
										$Boo_White:=True:C214
										
									Else 
										
										$Boo_White:=False:C215
										
									End if 
									
									APPEND TO ARRAY:C911(<>tTxt_colorNames;$Txt_color)
									$Dom_svg:=SVG_New (245;30)
									$t:=SVG_New_rect ($Dom_svg;0;0;245;28;0;0;$Txt_color;$Txt_color;0)
									
									If (<>Lon_opacity#100)
										
										SVG_SET_OPACITY ($t;<>Lon_opacity)
										
									End if 
									
									$t:=SVG_New_text ($Dom_svg;$Txt_color;5;7;"'lucida grande' 'arial'";12)
									
									If ($Boo_White)
										
										If (<>Lon_opacity>50)
											
											SVG_SET_FONT_COLOR ($t;"white")
											
										End if 
									End if 
									
									$p:=SVG_Export_to_picture ($Dom_svg)
									SVG_CLEAR ($Dom_svg)
									APPEND TO ARRAY:C911(<>tPic_Colors;$p)
									
								End if 
							Until (OK=0)
						End for 
						
						<>Lon_timerEvent:=1
						
						  //.....................................................
					: ($Lon_timerEvent=1)  //Display
						
						  //.....................................................
					Else 
						
						  //.....................................................
				End case 
				
				If (<>Lon_timerEvent#0)
					
					SET TIMER:C645(-1)
					
				End if 
				
				  //……………………………………………………………………………
			: ($Lon_formEvent=On Resize:K2:27)
				
				  //……………………………………………………………………………
			: ($Lon_formEvent=On Menu Selected:K2:14)
				
				  //
				
				  //……………………………………………………………………………
			: ($Lon_formEvent=On Close Box:K2:21)
				
				CANCEL:C270
				
				  //……………………………………………………………………………
			: ($Lon_formEvent=On Load:K2:1)
				
				<>Lon_opacity:=100
				
				<>Lon_timerEvent:=-1
				SET TIMER:C645(-1)
				
				  //……………………………………………………………………………
			: ($Lon_formEvent=On Unload:K2:2)
				
				  //……………………………………………………………………………
		End case 
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_run")
		
		  // First launch of this method executed in a new process
		Color_main ("_declarations")
		Color_main ("_init")
		
		$Lon_windowRef:=Open form window:C675("colorPalette";Plain form window:K39:10+4096;On the left:K39:2;At the top:K39:5;*)
		DIALOG:C40("colorPalette")
		
		Color_main ("_deinit")
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_declarations")
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_init")
		
		ARRAY PICTURE:C279(<>tPic_Colors;0x0000)
		ARRAY TEXT:C222(<>tTxt_colorNames;0x0000)
		<>tPic_Colors:=0
		
		  //___________________________________________________________
	: ($Txt_entryPoint="_deinit")
		
		ARRAY PICTURE:C279(<>tPic_Colors;0x0000)
		ARRAY TEXT:C222(<>tTxt_colorNames;0x0000)
		
		  //___________________________________________________________
	Else 
		
		TRACE:C157
		
		  //___________________________________________________________
End case 