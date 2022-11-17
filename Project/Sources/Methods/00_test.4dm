//%attributes = {}
C_BOOLEAN:C305($Boo_OK)
C_LONGINT:C283($Lon_alignStart; $Lon_height; $Lon_i; $Lon_middleX; $Lon_middleY; $Lon_modules)
C_LONGINT:C283($Lon_quiet; $Lon_recHeight; $Lon_recWidth; $Lon_size; $Lon_tx; $Lon_ty)
C_LONGINT:C283($Lon_version; $Lon_width; $Lon_x; $Lon_y; $Lon_zoom)
C_PICTURE:C286($Pic_buffer)
C_TEXT:C284($Dom_arc; $Dom_buffer; $Dom_circle; $Dom_end; $Dom_filter; $Dom_g)
C_TEXT:C284($Dom_gradient; $Dom_line; $Dom_main; $Dom_new; $Dom_node; $Dom_origine)
C_TEXT:C284($Dom_path; $Dom_pattern; $Dom_picture; $Dom_point; $Dom_rect; $Dom_root)
C_TEXT:C284($Dom_start; $Dom_svg; $Dom_symbol; $Dom_text; $Dom_use; $Txt_buffer)
C_TEXT:C284($Txt_code; $Txt_color; $Txt_font; $Txt_inputData; $Txt_path; $Txt_source)
C_TEXT:C284($Txt_style)
C_OBJECT:C1216($Obj_buffer)

ARRAY LONGINT:C221($tLon_X; 0)
ARRAY LONGINT:C221($tLon_Y; 0)
ARRAY TEXT:C222($tDom_stop; 0)
ARRAY TEXT:C222($tTxt_classes; 0)

SVG_CLEAR

SVG_SET_OPTIONS

SVG_SET_OPTIONS(SVG_Get_options ?+ 5)

$Dom_svg:=SVG_New

Case of 
		
		//________________________________________ ACI0103472
	: (True:C214)
		
		$Dom_text:=SVG_New_text($Dom_svg; "underline & line-throught"; 10; 10; "Arial"; 24; 12)
		$Dom_text:=SVG_New_textArea($Dom_svg; "underline & line-throught"; 10; 40; -1; -1; "Arial"; 24; 12)
		$Dom_text:=SVG_New_text($Dom_svg; "tspan"; 10; 80; "Arial"; 24)
		$Dom_text:=SVG_New_tspan($Dom_text; "underline & line-throught"; 30; 130; "Arial"; -1; 12)
		
		//________________________________________
	: (True:C214)
		
		READ PICTURE FILE:C678(File:C1566("/Users/vincentdelachaux/Desktop/Pierre.JPG").platformPath; $Pic_buffer)
		
		READ PICTURE FILE:C678(File:C1566("/Users/vincentdelachaux/Desktop/IMG_0029.HEIC").platformPath; $Pic_buffer)
		
		READ PICTURE FILE:C678(File:C1566("/Users/vincentdelachaux/Desktop/L1004220.DNG").platformPath; $Pic_buffer)
		
		TRANSFORM PICTURE:C988($Pic_buffer; Scale:K61:2; 0.5; 0.5)
		
		$Dom_picture:=SVG_New_embedded_image($Dom_svg; $Pic_buffer)
		//SVG_ROTATION_CENTERED($Dom_picture; 90)
		
		//________________________________________
	: (True:C214)
		
		$Txt_path:=System folder:C487(Desktop:K41:16)+"Elevation _1.tiff"
		READ PICTURE FILE:C678($Txt_path; $Pic_buffer)
		SVG_New_embedded_image($Dom_svg; $Pic_buffer)
		
		//________________________________________
	: (True:C214)  // Embedded SVG
		
		$Dom_picture:=SVG_New
		$Dom_rect:=SVG_New_rect($Dom_picture; 10; 10; 100; 100)
		$Dom_circle:=SVG_New_circle($Dom_picture; 60; 60; 30; "red"; "blue:50")
		
		$Pic_buffer:=SVG_Export_to_picture($Dom_picture)
		SVG_CLEAR($Dom_picture)
		
		$Dom_picture:=SVG_New_embedded_image($Dom_svg; $Pic_buffer)  //; 100; 100; ".svg")
		
		
		//________________________________________
	: (True:C214)
		
		$Txt_path:=System folder:C487(Desktop:K41:16)+"Elevation _1.tiff"
		READ PICTURE FILE:C678($Txt_path; $Pic_buffer)
		SVG_New_embedded_image($Dom_svg; $Pic_buffer)
		
		//________________________________________
	: (True:C214)  // Define picture
		
		$Dom_root:=SVG_New
		SVG_New_rect($Dom_root; 10; 10; 50; 50; 0; 0; "blue"; "red")
		$Pic_buffer:=SVG_Export_to_picture($Dom_root)
		SVG_CLEAR($Dom_root)
		
		SVG_Define_image($Dom_svg; "myPicture"; $Pic_buffer; ".svg")
		
		$Dom_use:=SVG_Use($Dom_svg; "myPicture"; 50; 50)
		
		$Dom_use:=SVG_Use($Dom_svg; "myPicture"; 80; 80)
		
		$Dom_use:=SVG_Use($Dom_svg; "myPicture"; 100; 100)
		
		//________________________________________
	: (True:C214)
		$Txt_path:=Select document:C905(""; ".svg"; ""; 0)
		
		If (OK=1)
			
			$Dom_svg:=SVG_Open_file(DOCUMENT; True:C214)
			
		End if 
		
		//________________________________________
	: (True:C214)  //#ACI0097608
		
		SVG_SET_OPTIONS(SVG_Get_options ?+ 1)  // Enable the auto ID
		
		$Dom_g:=SVG_New_group($Dom_svg; "GroupID")  // This group should have the id of "GroupID", but it gets an auto id
		
		$Dom_g:=SVG_New_group($Dom_svg)
		SVG_SET_ID($Dom_g; "NewGroupID")  // this group correctly gets the id "NewGroupID"
		
		//________________________________________
	: (True:C214)
		
		$Lon_x:=200
		$Lon_y:=100
		$Dom_circle:=SVG_New_ellipse($Dom_svg; $Lon_x; $Lon_y; 50; 80; "black"; "white"; 1)
		$Dom_circle:=SVG_New_ellipse($Dom_svg; $Lon_x; $Lon_y; 50; 80; "red"; "white"; 1)
		SVG_ROTATION_CENTERED($Dom_circle; 45)
		$Dom_rect:=SVG_New_rect($Dom_svg; $Lon_x; $Lon_y; 3; 3; 0; 0; "black"; "red"; 0)
		
		$Dom_circle:=SVG_New_circle($Dom_svg; 100; 100; 50)
		
		//________________________________________
	: (True:C214)
		
		$Txt_buffer:="Application par circulation :\nConcentration bactéricide : 1.4%\nTempérature : "\
			+"< 60°C\nTemps de contact : >5 minutes\nRinçage final à l'eau potable\nA utiliser "\
			+"avec précaution sur métaux légers"
		
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_buffer)
		
		//________________________________________
	: (True:C214)  // SVG_SET_STROKE_VECTOR_EFFECT
		
		SVG_SET_DIMENSIONS($Dom_svg; 100; 100; "px")
		SVG_SET_VIEWBOX($Dom_svg; -1; -1; 1002; 1002; "none")
		SVG_SET_SHAPE_RENDERING($Dom_svg; "crispEdges")
		
		// Define pattern
		$Dom_pattern:=SVG_Define_pattern($Dom_svg; "p"; 250; 250; -1; -1; "userSpaceOnUse")
		
		SVG_SET_PATTERN_CONTENT_UNITS($Dom_pattern; "userSpaceOnUse")
		
		$Dom_path:=SVG_New_path($Dom_pattern; 250; 0; "black"; "none")
		SVG_PATH_LINE_TO($Dom_path; 0; 0)
		SVG_PATH_LINE_TO($Dom_path; 0; 250)
		SVG_SET_STROKE_VECTOR_EFFECT($Dom_path; "non-scaling-stroke")
		
		// Create rect
		$Dom_rect:=SVG_New_rect($Dom_svg; 0; 0; 1000; 1000; 0; 0; "black"; "url(#p)")
		SVG_SET_STROKE_VECTOR_EFFECT($Dom_rect; "non-scaling-stroke")
		
		//________________________________________
	: (True:C214)  //#ACI0096676
		
		$Txt_source:="<span>\n<span style=\"color:#D81E05\">Hi, please set some styles<br/>for this "\
			+"text</span>\n<br/>by selecting and right<br/>clicking it.</span>"
		
		$Dom_text:=SVG_New_text($Dom_svg; $Txt_source; 0; 0)
		
		//________________________________________
	: (True:C214)
		
		$Dom_text:=SVG_New_textArea($Dom_svg; "HELLO WORLD")
		SVG_SET_FONT_FAMILY($Dom_text; "MS sans serif"; "sans-serif")
		
		//________________________________________
	: (True:C214)
		
		SVG_Set_title($Dom_svg; "test")
		
		//________________________________________
	: (True:C214)
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 10; 10; 10; 10)
		
		//________________________________________
	: (True:C214)  //#ACI0098253 - Dominique
		
		$Dom_text:=SVG_New_textArea($Dom_svg; "S&P"; 10; 10)
		
		//SVG_SAVE_AS_TEXT ($Svg_root;System folder(Desktop)+"export.txt")
		//________________________________________
	: (True:C214)
		
		$Txt_source:="<SPAN>Mon test à moi</SPAN>"
		
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_source; 10; 10; 790; 30)
		$Txt_buffer:=SVG_Get_text($Dom_text)
		
		//________________________________________
	: (True:C214)  // Relative path for css' files
		
		Case of 
				
				// ----------------------------------------
			: (False:C215)  // Base is the folder "SVG" in the folder "Resources"
				
				SVG_Define_style($Dom_svg; "/monstyle.css")
				
				// ----------------------------------------
			: (True:C214)  // Base is the folder "Resources"
				
				SVG_Define_style($Dom_svg; "./DEV/monstyle.css")
				
				// ----------------------------------------
			: (True:C214)  // Base is the database's folder
				
				SVG_Define_style($Dom_svg; "../styles/monstyle.css")
				
				//----------------------------------------
		End case 
		
		$Dom_g:=SVG_New_group($Dom_SVG)
		SVG_SET_CLASS($Dom_g; "colored")
		
		// Draw a rectangle
		$Dom_rect:=SVG_New_rect($Dom_g; 25; 30; 320; 240; 10; 10; ""; "")
		
		//______________________________________________________
	: (True:C214)  // SVG_SET_HUE with style
		
		$Dom_filter:=SVG_Define_filter($Dom_svg; "hue_360")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "360")
		$Dom_filter:=SVG_Define_filter($Dom_svg; "hue_300")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "300")
		$Dom_filter:=SVG_Define_filter($Dom_svg; "hue_240")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "240")
		$Dom_filter:=SVG_Define_filter($Dom_svg; "hue_180")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "180")
		$Dom_filter:=SVG_Define_filter($Dom_svg; "hue_120")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "120")
		$Dom_filter:=SVG_Define_filter($Dom_svg; "hue_60")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "60")
		
		SVG_Define_style($Dom_svg; "#pict_1{filter:url(#hue_360);}")
		SVG_Define_style($Dom_svg; "#pict_2{filter:url(#hue_300);}")
		SVG_Define_style($Dom_svg; "#pict_3{filter:url(#hue_240);}")
		SVG_Define_style($Dom_svg; "#pict_4{filter:url(#hue_180);}")
		SVG_Define_style($Dom_svg; "#pict_5{filter:url(#hue_120);}")
		SVG_Define_style($Dom_svg; "#pict_6{filter:url(#hue_60);}")
		
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "mona")
		SVG_New_image($Dom_symbol; "#dev/mona.jpg")
		
		For ($Lon_i; 0; 5; 1)
			
			$Dom_node:=SVG_Use($Dom_svg; "mona")
			
			SVG_SET_ID($Dom_node; "pict_"+String:C10($Lon_i+1))
			SVG_SET_TRANSFORM_TRANSLATE($Dom_node; 160*$Lon_i; 50*$Lon_i)
			
		End for 
		
		//________________________________________
	: (True:C214)
		
		$Txt_path:=System folder:C487(Desktop:K41:16)+"Elevation _1.tiff"
		READ PICTURE FILE:C678($Txt_path; $Pic_buffer)
		SVG_New_embedded_image($Dom_svg; $Pic_buffer)
		
		//________________________________________
	: (True:C214)
		
		$Dom_g:=SVG_New_group($Dom_svg)
		DOM SET XML ATTRIBUTE:C866($Dom_g; \
			"font-family"; "'helvetica'"; \
			"font-size"; 24)
		$Dom_text:=SVG_New_text($Dom_g; "Aujourd'hui"; 10; 10; ""; 24)
		$Dom_text:=SVG_New_textArea($Dom_g; "Aujourd'hui"; 10; 40)
		SVG_SET_TEXTAREA_TEXT(SVG_New_textArea($Dom_g; ""; 10; 70); "Aujourd'hui")
		$Dom_text:=SVG_New_textArea($Dom_g; "Aujourd'hui"; 10; 100)
		SVG_APPEND_TEXT_TO_TEXTAREA($Dom_text; "\rAujourd'hui")
		
		SVG EXPORT TO PICTURE:C1017($Dom_svg; $Pic_buffer)
		SET PICTURE TO PASTEBOARD:C521($Pic_buffer)
		
		//________________________________________
	: (True:C214)
		
		$Txt_path:=System folder:C487(Desktop:K41:16)+"Elevation _1.tiff"
		READ PICTURE FILE:C678($Txt_path; $Pic_buffer)
		SVG_New_embedded_image($Dom_svg; $Pic_buffer)
		
		//SET BLOB SIZE($Blb_buffer;10*1024*1024;"azerty")
		//BASE64 ENCODE($Blb_buffer;$Txt_buffer)
		
		//________________________________________
	: (True:C214)  // Define picture
		
		$Txt_source:="<\r&\r'\r\"\r/\r>"
		
		//$Dom_text:=SVG_New_textArea ($Dom_svg;$Txt_sources;25;10;90;82;"Helvetica";80;0;Align center)
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_source; 25; 10; -1; -1; "Helvetica"; 80; 0; Align center:K42:3)
		
		//________________________________________
	: (True:C214)  // Define picture
		
		$Dom_root:=SVG_New
		SVG_New_rect($Dom_root; 10; 10; 50; 50; 0; 0; "blue"; "red")
		$Pic_buffer:=SVG_Export_to_picture($Dom_root)
		SVG_CLEAR($Dom_root)
		
		SVG_Define_image($Dom_svg; "myPicture"; $Pic_buffer; ".svg")
		
		$Dom_use:=SVG_Use($Dom_svg; "myPicture"; 50; 50)
		
		$Dom_use:=SVG_Use($Dom_svg; "myPicture"; 80; 80)
		
		$Dom_use:=SVG_Use($Dom_svg; "myPicture"; 100; 100)
		
		//________________________________________
	: (True:C214)  // Support for styled text in textArea
		
		$Txt_buffer:="<SPAN STYLE=\"font-size:24pt\">Hello </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">world</SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\"> !</SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\"><BR/>it's me</SPAN>"
		
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_buffer; 50; 50)
		
		// Get plain text
		$Txt_code:=SVG_Get_text($Dom_text)
		
		// Get styled text
		$Txt_code:=SVG_Get_styled_text($Dom_text)
		
		//________________________________________
	: (True:C214)
		
		SVG_New_line($Dom_svg; 150; 1; 150; 100; "red"; 0.5)
		SVG_New_text($Dom_svg; "Hello world"; 150; 10; "arial"; 24; 0; Align left:K42:2)
		SVG_New_text($Dom_svg; "Hello world"; 150; 60; "arial"; 24; 0; Align center:K42:3)
		SVG_New_text($Dom_svg; "Hello world"; 150; 30; "arial"; 24; 0; Align right:K42:4)
		
		//________________________________________
	: (True:C214)  //#ACI0093774
		
		$Txt_buffer:="Hello"
		ST SET ATTRIBUTES:C1093($Txt_buffer; ST Start text:K78:15; ST End text:K78:16; \
			Attribute font name:K65:5; "arial")
		
		$Txt_buffer:="<SPAN STYLE=\"font-size:18pt\">Hello </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">World</SPAN>"+\
			"<SPAN STYLE=\"font-size:36pt\">!</SPAN><BR/>"+\
			"<SPAN STYLE=\"font-size:19pt;font-style:italic\">It's </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\">Monday</SPAN>"
		
		$Dom_main:=SVG_New_group($Dom_svg)
		
		// Limits
		SVG_Post_comment($Dom_main; "grid")
		$Dom_g:=SVG_New_group($Dom_main)
		
		For ($Lon_i; 0; 135; 5)
			
			$Dom_line:=SVG_New_line($Dom_g; $Lon_i; 0; $Lon_i; 80; "blue"; 0.5)
			
		End for 
		
		For ($Lon_i; 0; 80; 5)
			
			$Dom_line:=SVG_New_line($Dom_g; 0; $Lon_i; 135; $Lon_i; "blue"; 0.5)
			
		End for 
		
		SVG_SET_TRANSFORM_TRANSLATE($Dom_g; 0.5; 0.5)
		
		// Text
		SVG_Post_comment($Dom_main; "text")
		$Dom_text:=SVG_New_text($Dom_main; $Txt_buffer; 5; 1)
		SVG_SET_FONT_FAMILY($Dom_text; "Arial")
		
		SVG_SET_TRANSFORM_SCALE($Dom_main; 4)
		
		If (True:C214)
			
			$Txt_path:=System folder:C487(Desktop:K41:16)+"DEV"+Folder separator:K24:12
			
			DOM EXPORT TO VAR:C863($Dom_svg; $Txt_source)
			$Txt_source:=Replace string:C233($Txt_source; " xmlns=\"\""; "")
			$Dom_buffer:=DOM Parse XML variable:C720($Txt_source)
			
			// Export as XML
			DOM EXPORT TO FILE:C862($Dom_buffer; $Txt_path+"DOM EXPORT TO FILE.svg")
			
			// Export as picture
			SVG EXPORT TO PICTURE:C1017($Dom_buffer; $Pic_buffer; Own XML data source:K45:18)
			WRITE PICTURE FILE:C680($Txt_path+"WRITE PICTURE FILE.svg"; $Pic_buffer)
			
			SVG_SAVE_AS_PICTURE($Dom_svg; $Txt_path+"SVG_SAVE_AS_PICTURE.svg")
			SVG_SAVE_AS_TEXT($Dom_svg; $Txt_path+"SVG_SAVE_AS_TEXT.svg")
			
		End if 
		
		//________________________________________
	: (True:C214)  // JFR
		
		$Txt_buffer:="12 rue de la republique\r13001 Marseille"
		$Lon_size:=18
		$Txt_font:="helvetica"
		$Txt_style:="{fill:red;font-family:'"+$Txt_font+"';font-size:"+String:C10($Lon_size)+"pt}"
		
		$Dom_text:=SVG_New_text($Dom_svg; $Txt_buffer; 400; 80; $Txt_font; $Lon_size; -1; Align right:K42:4; "blue")
		$Dom_text:=SVG_New_text($Dom_svg; $Txt_buffer; 400; 80; $Txt_style)
		
		//________________________________________
	: (True:C214)  // ACI00????? (FD)
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 5; 5; 210; 320; 0; 0; "#777"; "peachpuff"; 3)
		
		$Txt_buffer:=System folder:C487(Desktop:K41:16)+"DEV"+Folder separator:K24:12+"test.svg"
		SVG_SAVE_AS_TEXT($Dom_svg; $Txt_buffer)
		
		$Boo_OK:=SVG_Validate_file($Txt_buffer)
		
		//________________________________________
	: (True:C214)  // ACI00????? (FD)
		
		// SVG_SET_DEFAULT_BRUSHES ("red";"blue")
		//$z:=SVG_New_path($z;10;10;
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 5; 5; 210; 320; 0; 0; "#777"; "peachpuff"; 3)
		SVG_SET_STROKE_MITERLIMIT($Dom_rect; 0)
		
		//________________________________________
	: (True:C214)
		
		$Dom_svg:=SVG_New
		$Dom_rect:=SVG_New_rect($Dom_svg; 5; 5; 210; 320; 0; 0; "#777"; "peachpuff"; 3)
		$Txt_buffer:="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor."
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_buffer; 10; 10; 200; 310; "Georgia"; 25; Italic:K14:3; 5)
		
		//________________________________________
	: (True:C214)
		
		SVG_SET_SHAPE_RENDERING($Dom_svg; "crispEdges")
		
		$Txt_inputData:="01234567"
		
		$Txt_code:="0001"  // Numeric
		
		$Lon_version:=7  // 1-40
		
		$Lon_modules:=21+(4*($Lon_version-1))  // 21-177
		
		$Lon_quiet:=4
		$Lon_zoom:=15
		
		$Lon_width:=$Lon_modules+($Lon_quiet*2)  // +2
		
		SVG_SET_DIMENSIONS($Dom_svg; $Lon_width*$Lon_zoom; $Lon_width*$Lon_zoom)
		SVG_SET_VIEWBOX($Dom_svg; 0; 0; $Lon_width; $Lon_width)
		
		SVG_New_rect($Dom_svg; 0; 0; $Lon_width-1; $Lon_width-1; -1; -1; "lightgray"; "white")
		
		// Grid
		$Dom_g:=SVG_New_group($Dom_svg; "dev-tools")
		
		For ($Lon_i; 4; $Lon_width-4; 2)
			
			SVG_New_line($Dom_g; 3.5; $Lon_i; $Lon_width-4.5; $Lon_i; "grey:10"; 1)
			
		End for 
		
		For ($Lon_i; 4; $Lon_width-4; 2)
			
			SVG_New_line($Dom_g; $Lon_i; 3.5; $Lon_i; $Lon_width-4.5; "grey:10"; 1)
			
		End for 
		
		// Detection pattern
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "detect"; 0; 0; 7; 7)
		SVG_New_rect($Dom_symbol; -1; -1; 8; 8; -1; -1; "white"; "")
		SVG_New_rect($Dom_symbol; 0; 0; 6; 6; -1; -1; "black"; "white")
		SVG_New_rect($Dom_symbol; 2; 2; 2; 2; -1; -1; "black"; "black")
		
		// Alignment pattern
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "align"; 0; 0; 5; 5)
		SVG_New_rect($Dom_symbol; 0; 0; 4; 4; -1; -1; "black"; "white")
		SVG_New_rect($Dom_symbol; 1.5; 1.5; 1; 1; -1; -1; "black"; "black"; 0.25)
		
		SVG_New_line($Dom_svg; 11.5; 10; $Lon_width-11; 10; "white")
		SVG_SET_STROKE_DASHARRAY(SVG_New_line($Dom_svg; 11.5; 10; $Lon_width-11; 10); 1)
		
		SVG_New_line($Dom_svg; 10; 11.5; 10; $Lon_width-11; "white")
		SVG_SET_STROKE_DASHARRAY(SVG_New_line($Dom_svg; 10; 11.5; 10; $Lon_width-11); 1)
		
		// Detection patterns
		SVG_Use($Dom_svg; "detect"; 4; 4)
		
		SVG_Use($Dom_svg; "detect"; $Lon_modules-3; 4)
		
		SVG_Use($Dom_svg; "detect"; 4; $Lon_modules-3)
		
		$Lon_alignStart:=Int:C8($Lon_modules/2)+1
		
		Case of 
				
				//______________________________________________________
			: ($Lon_modules>21)\
				 & ($Lon_modules<45)
				
				SVG_Use($Dom_svg; "align"; $Lon_modules-5; $Lon_modules-5)
				
				//______________________________________________________
			: ($Lon_modules>44)\
				 & ($Lon_modules<101)
				
				SVG_Use($Dom_svg; "align"; $Lon_alignStart+2; 8)
				
				SVG_Use($Dom_svg; "align"; 8; $Lon_alignStart+2)
				
				SVG_Use($Dom_svg; "align"; $Lon_alignStart+2; $Lon_alignStart+2)
				
				SVG_Use($Dom_svg; "align"; ($Lon_width-13); $Lon_alignStart+2)
				
				SVG_Use($Dom_svg; "align"; $Lon_modules-4; $Lon_modules-5)
				
				SVG_Use($Dom_svg; "align"; $Lon_alignStart; $Lon_modules-5)
				
				//______________________________________________________
				
			Else 
				
				//______________________________________________________
		End case 
		
		SVG_SET_TRANSFORM_TRANSLATE($Dom_svg; 0.5; 0.5)
		
		//________________________________________
	: (False:C215)
		
		$Dom_picture:=SVG_New_embedded_image($Dom_svg; $Pic_buffer)
		
		$Dom_new:=DOM Create XML element:C865($Dom_svg; "test")
		
		//DOM Append XML child node($Dom_new;XML DATA;"&#0D;")
		
		//________________________________________
	: (True:C214)  //http://forums.4d.fr/Post//12706909/1/
		
		$Txt_buffer:=""\
			+"=======================\r"\
			+"|   ITEM   |   TOTAL  |\r"\
			+"=======================\r"\
			+"|line 1    |     78.60|\r"\
			+"|line 2    |    125.36|\r"\
			+"|line 3    |   2564.00|\r"\
			+"=======================\r"\
			+"           |   2767.96|\r"\
			+"           ============\r"
		
		// Default
		$Dom_text:=SVG_New_text($Dom_svg; "Default display"; 50; 35)
		SVG_SET_FONT_FAMILY(SVG_New_textArea($Dom_svg; $Txt_buffer; 50; 50); "Monaco"; "Lucida Console"; "monospace")
		
		$Dom_text:=SVG_New_text($Dom_svg; "Option: Preserve spaces"; 50; 205)
		SVG_SET_OPTIONS(SVG_Get_options ?+ 13)  // Preserve spaces in text objects
		SVG_SET_FONT_FAMILY(SVG_New_textArea($Dom_svg; $Txt_buffer; 50; 225); "Monaco"; "Lucida Console"; "monospace")
		
		$Dom_text:=SVG_New_text($Dom_svg; "Option: Preserve spaces with SVG_SET_TEXTAREA_TEXT"; 50; 400)
		SVG_SET_OPTIONS(SVG_Get_options ?+ 13)  // Preserve spaces in text objects
		
		$Dom_text:=SVG_New_textArea($Dom_svg; ""; 50; 420)
		SVG_SET_FONT_FAMILY($Dom_text; "Monaco"; "Lucida Console"; "monospace")
		
		$Txt_buffer:="<SPAN STYLE=\"font-size:18pt\">         Hello </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt;   font-weight:bold;   color:#D81E05\">Paul</SPAN>"+\
			"<SPAN STYLE=\"font-size:36pt\">!</SPAN>"+\
			"<SPAN STYLE=\"font-size:19pt;font-style:italic\"><BR/>        Hello it's </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\">vdl</SPAN>"
		
		SVG_SET_TEXTAREA_TEXT($Dom_text; $Txt_buffer)
		
		//______________________________________________________
	: (True:C214)  // #18-3-2015
		
		// Define default stroke and fill
		SVG_Define_style($Dom_svg; "*{stroke:blue;fill:none}")
		
		// Don't append default stroke and fill
		SVG_SET_OPTIONS(SVG_Get_options ?+ 15)
		
		DOM SET XML ATTRIBUTE:C866($Dom_svg; \
			"width"; "100%"; \
			"height"; "100%")
		SVG_SET_VIEWBOX($Dom_svg; -200; -150; 401; 301; "none")
		$Dom_rect:=SVG_New_rect($Dom_svg; -199; -149; 400; 300)
		$Dom_circle:=SVG_New_circle($Dom_svg; 0; 0; 10)
		
		//______________________________________________________
	: (False:C215)  // SVG_SET_HUE with style
		
		$Dom_filter:=SVG_Define_filter($Dom_svg; "Matrix")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "matrix"; ".33 .33 .33 0 0 .33 .33 .33 0 0 .33 .33 .33 0 0 .33 .33 .33 0 0")
		
		$Dom_filter:=SVG_Define_filter($Dom_svg; "Saturate")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "saturate"; "150%")
		
		$Dom_filter:=SVG_Define_filter($Dom_svg; "HueRotate90")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "hueRotate"; "90")
		
		$Dom_filter:=SVG_Define_filter($Dom_svg; "LuminanceToAlpha")
		$Dom_node:=SVG_Filter_ColorMatrix($Dom_filter; "SourceGraphic"; ""; "luminanceToAlpha")
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 2; 0; 797; 100; 0; 0; "none"; "coral")
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 2; 100; 797; 100; 0; 0; "none"; "coral")
		SVG_SET_FILTER($Dom_rect; "Matrix")
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 2; 200; 797; 100; 0; 0; "none"; "coral")
		SVG_SET_FILTER($Dom_rect; "Saturate")
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 2; 300; 797; 100; 0; 0; "none"; "coral")
		SVG_SET_FILTER($Dom_rect; "HueRotate90")
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 2; 400; 797; 100; 0; 0; "none"; "coral")
		SVG_SET_FILTER($Dom_rect; "LuminanceToAlpha")
		
		SVG_New_text($Dom_svg; "Pas de filtre"; 110; 10; "Verdana"; 60; Bold:K14:2; -1; "black")
		SVG_New_text($Dom_svg; "Matrix"; 110; 110; "Verdana"; 60; Bold:K14:2; -1; "black")
		SVG_New_text($Dom_svg; "Saturate"; 110; 210; "Verdana"; 60; Bold:K14:2; -1; "black")
		SVG_New_text($Dom_svg; "HueRotate"; 110; 310; "Verdana"; 60; Bold:K14:2; -1; "black")
		SVG_New_text($Dom_svg; "Luminance"; 110; 410; "Verdana"; 60; Bold:K14:2; -1; "black")
		
		//________________________________________
	: (True:C214)
		
		$Txt_buffer:="<SPAN STYLE=\"font-size:18pt\">Hello </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">Paul</SPAN>"+\
			"<SPAN STYLE=\"font-size:36pt\"> !</SPAN><BR/>"+\
			"<SPAN STYLE=\"font-size:19pt;font-style:italic\">it's </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\">vdl</SPAN>"
		
		// Title
		SVG_SET_FONT_COLOR(SVG_New_text($Dom_svg; "_______ SVG_New_textArea ______"; 10; 30; ""; -1); "blue")
		
		// TextArea
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_buffer; 50; 50)
		
		// Title
		SVG_SET_FONT_COLOR(SVG_New_text($Dom_svg; "_______ svg_Newtext _______"; 10; 180); "blue")
		
		// Text
		$Dom_text:=SVG_New_text($Dom_svg; $Txt_buffer; 50; 200)
		
		//________________________________________
	: (True:C214)  // Relative path for pictures
		
		// Base is the folder "SVG" in the folder "Resources"
		SVG_New_image($Dom_svg; "mona.jpg"; 0; 0)
		
		// Base is the folder "Resources"
		SVG_New_image($Dom_svg; "./DEV/apple.png"; 45; 5)
		
		// Base is the database's folder
		SVG_New_image($Dom_svg; "../4d_40.png"; 140; 190)
		
		// Base is the folder "SVG" in the folder "Resources"
		SVG_New_image($Dom_svg; "/sample pictures/php.gif"; 110; 95; 100; 100)
		SVG_SET_TRANSFORM_TRANSLATE(SVG_New_image($Dom_svg; "sample pictures/square.svg"; 110; 180; 200; 200); -25; 150)
		
		//________________________________________
	: (True:C214)
		
		SVG_Set_error_handler("onErrCallMethod")
		
		$Dom_rect:=SVG_New_rect($Dom_g; 0; 0; 10; 0; 0; 0; "none"; "red")
		
		//________________________________________
	: (True:C214)
		
		//$Dom_rect:=SVG_New_rect ($Dom_svg;0;0;10;-1;0;0;"none";"red";0.5)
		//DOM SET XML ATTRIBUTE($Dom_rect;"height";"1em")
		//$Dom_text:=SVG_New_textArea ($Dom_svg;"1em";20;0)
		//DOM SET XML ATTRIBUTE($Dom_text;"font-size";"1em")
		
		//$Dom_rect:=SVG_New_rect ($Dom_svg;0;20;10;-1;0;0;"none";"red";0.5)
		//DOM SET XML ATTRIBUTE($Dom_rect;"height";"2em")
		//$Dom_text:=SVG_New_textArea ($Dom_svg;"2em";20;20)
		//DOM SET XML ATTRIBUTE($Dom_text;"font-size";"2em")
		
		//$Dom_rect:=SVG_New_rect ($Dom_svg;0;50;10;-1;0;0;"none";"red";0.5)
		//DOM SET XML ATTRIBUTE($Dom_rect;"height";"3em")
		//$Dom_text:=SVG_New_textArea ($Dom_svg;"3em";20;50)
		//DOM SET XML ATTRIBUTE($Dom_text;"font-size";"3em")
		
		//SVG_Define_style ($Dom_svg;"textArea{font-size:3em}")
		//SVG_Define_style ($Dom_svg;"rect{height:3em}")
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "symbol")
		$Dom_text:=SVG_New_textArea($Dom_symbol; "Hello world"; 20)
		
		$Dom_g:=SVG_New_group($Dom_svg)
		SVG_Define_style($Dom_g; "{font-size:3em;height:3em}")
		
		$Dom_rect:=SVG_New_rect($Dom_g; 0; 0; 10; 0; 0; 0; "none"; "red")
		DOM REMOVE XML ATTRIBUTE:C1084($Dom_rect; "height")
		DOM REMOVE XML ATTRIBUTE:C1084($Dom_rect; "rx")
		DOM REMOVE XML ATTRIBUTE:C1084($Dom_rect; "ry")
		
		$Dom_text:=SVG_New_textArea($Dom_g; "3em"; 20)
		DOM REMOVE XML ATTRIBUTE:C1084($Dom_text; "height")
		
		//SVG_Define_style ($Dom_svg;".em3{height:3em;font-size:3em}")
		//SVG_SET_CLASS ($Dom_group;"em3")
		
		//________________________________________
	: (True:C214)
		
		// #26-8-2014
		// http://forums.4d.fr/Post/FR/15125439/1/15129432#15129432
		
		OB SET:C1220($Obj_buffer; \
			"amp"; "&"; \
			"gt"; "<"; \
			"apos"; "'"; \
			"quot"; "\"")
		$Txt_buffer:=JSON Stringify:C1217($Obj_buffer)
		
		SVG_ADD_NAMESPACE($Dom_svg; "vdl"; "vdl@4d.fr")
		$Dom_rect:=SVG_New_rect($Dom_svg; 30; 30; 200; 60)
		SVG_SET_ATTRIBUTES($Dom_rect; "vdl:test"; $Txt_buffer)
		
		If (False:C215)
			DOM GET XML ATTRIBUTE BY NAME:C728($Dom_rect; "vdl:test"; $Txt_inputData)
			
			$Txt_inputData:=Replace string:C233($Txt_inputData; "'"; "\"")
			$Txt_inputData:=Replace string:C233($Txt_inputData; "&quot;"; "\\\"")
			$Txt_inputData:=Replace string:C233($Txt_inputData; "&apos;"; "'")
			$Txt_inputData:=Replace string:C233($Txt_inputData; "&lt;"; "<")
			$Txt_inputData:=Replace string:C233($Txt_inputData; "&amp;"; "&")
			
		Else 
			
			SVG_GET_ATTRIBUTES($Dom_rect; ->$tTxt_attributeNames; ->$tTxt_attributeValues)
			
			$Lon_x:=Find in array:C230($tTxt_attributeNames; "vdl:test")
			
			If ($Lon_x>0)
				
				$Txt_inputData:=$tTxt_attributeValues{$Lon_x}
				
			End if 
		End if 
		
		CLEAR VARIABLE:C89($Obj_buffer)
		$Obj_buffer:=JSON Parse:C1218($Txt_inputData)
		
		SVG_SAVE_AS_TEXT($Dom_svg; System folder:C487(Desktop:K41:16)+"Untitled.svg")
		
		//______________________________________________________
	: (True:C214)  // Quadrillage vertical
		
		SVG_Define_style($Dom_svg; ".grid {stroke-dasharray:1,10;}")
		SVG_SET_CLASS(SVG_New_line($Dom_svg; 20; 210; 829; 210; "Silver"; 400); "grid")
		
		//______________________________________________________
	: (False:C215)
		
		SVG_SET_DIMENSIONS($Dom_svg; 8; 4; "cm")
		SVG_SET_VIEWBOX($Dom_svg; 0; 0; 800; 400)
		
		SVG_Set_description($Dom_svg; "Example lingrad01 - fill a rectangle using a linear gradient paint server")
		
		SVG_Define_linear_gradient($Dom_svg; "MyGradient"; "#F60"; "#FF6"; 0; ""; 0.05; 0.95)
		
		SVG_Post_comment($Dom_svg; "Outline the drawing area in blue")
		SVG_New_rect($Dom_svg; 1; 1; 798; 398; 0; 0; "blue"; "none")
		
		SVG_Post_comment($Dom_svg; "The rectangle is filled using the linear gradient")
		SVG_New_rect($Dom_svg; 100; 100; 600; 200; 0; 0; "black"; "url(#MyGradient)")
		
		//______________________________________________________
	: (True:C214)  // How do I make a button (2) v12
		
		SVG_SET_DIMENSIONS($Dom_svg; 1200; 800)
		
		// Define the gradient
		$Dom_gradient:=SVG_Define_linear_gradient($Dom_svg; "buttonGradient"; "cornflowerblue:50"; "blue:50"; 90; "reflect"; 0; 0.5; 0; 1)
		
		//$Dom_gradient:=SVG_Define_linear_gradient ($Dom_svg;"buttonGradient";"lavenderblush";"red";90;"reflect";0;0,1;0;1)
		
		// Define a standard shadow
		SVG_Define_shadow($Dom_svg; "Shadow")
		
		// Define the title style
		$Txt_buffer:=".title{fill:black;font-family:'lucida grande',san-serif;font-size:20px;text-align:center;}"
		SVG_Define_style($Dom_svg; $Txt_buffer)
		
		// Draw the button {
		$Dom_g:=SVG_New_group($Dom_svg; "MyButton")
		
		// Put the color gradient
		SVG_SET_FILL_BRUSH($Dom_g; "url(#buttonGradient)")
		$Dom_rect:=SVG_New_rect($Dom_g; 30; 30; 200; 60; 10; 10; ""; "")
		
		//$Dom_text:=SVG_New_textArea ($Dom_g;"New Button…";30;45;200;60;"'Lucida Grande' Verdana";20;-1;Centré)
		$Dom_text:=SVG_New_textArea($Dom_g; "New Button…"; 30; 47; 200; 60)
		
		//SVG_SET_FONT_COLOR ($Dom_text;"white")
		
		//SVG_SET_INLINE_STYLE ($Dom_text;$Txt_buffer)
		//DOM ECRIRE ATTRIBUT XML($Dom_text;"style";$Txt_buffer)
		
		SVG_SET_CLASS($Dom_text; "title")
		
		// Put the shadow
		SVG_SET_FILTER($Dom_rect; "Shadow")
		//}
		
		//________________________________________
	: (True:C214)  // Relative path for css' files
		
		Case of 
				
				// ----------------------------------------
			: (False:C215)  // Base is the folder "SVG" in the folder "Resources"
				
				SVG_Define_style($Dom_svg; "/monstyle.css")
				
				// ----------------------------------------
			: (False:C215)  // Base is the folder "Resources"
				
				SVG_Define_style($Dom_svg; "./DEV/monstyle.css")
				
				// ----------------------------------------
			: (True:C214)  // Base is the database's folder
				
				SVG_Define_style($Dom_svg; "../styles/monstyle.css")
				
				//----------------------------------------
		End case 
		
		$Dom_g:=SVG_New_group($Dom_SVG)
		SVG_SET_CLASS($Dom_g; "colored")
		
		// Draw a rectangle
		$Dom_rect:=SVG_New_rect($Dom_g; 25; 30; 320; 240; 10; 10; ""; "")
		
		//________________________________________
	: (True:C214)
		
		$Txt_color:="black"
		$Dom_node:=SVG_Define_linear_gradient($Dom_svg; "gClicked"; ($Txt_color+":50"); ($Txt_color+":20"); -90; "reflect"; 0; 80)
		
		//$Dom_node:=SVG_Define_linear_gradient ($Dom_svg;"gClicked";($Txt_color+":50");($Txt_color+":20");-90;"reflect")
		//$tDom_stop{0}:=DOM Find XML element($Dom_node;"linearGradient/stop";$tDom_stop)
		//DOM SET XML ATTRIBUTE($tDom_stop{2};"offset";"90%")
		//________________________________________
	: (False:C215)
		
		SVG_SET_SHAPE_RENDERING($Dom_svg; "crispEdges")
		
		$Txt_inputData:="01234567"
		
		$Txt_code:="0001"  // Numeric
		
		$Lon_version:=7  // 1-40
		
		$Lon_modules:=21+(4*($Lon_version-1))  // 21-177
		
		$Lon_quiet:=4
		$Lon_zoom:=15
		
		$Lon_width:=$Lon_modules+($Lon_quiet*2)  // +2
		
		SVG_SET_DIMENSIONS($Dom_svg; $Lon_width*$Lon_zoom; $Lon_width*$Lon_zoom)
		SVG_SET_VIEWBOX($Dom_svg; 0; 0; $Lon_width; $Lon_width)
		
		SVG_New_rect($Dom_svg; 0; 0; $Lon_width-1; $Lon_width-1; -1; -1; "lightgray"; "white")
		
		// Grid
		$Dom_g:=SVG_New_group($Dom_svg; "dev-tools")
		
		For ($Lon_i; 4; $Lon_width-4; 2)
			
			SVG_New_line($Dom_g; 3.5; $Lon_i; $Lon_width-4.5; $Lon_i; "grey:10"; 1)
			
		End for 
		
		For ($Lon_i; 4; $Lon_width-4; 2)
			
			SVG_New_line($Dom_g; $Lon_i; 3.5; $Lon_i; $Lon_width-4.5; "grey:10"; 1)
			
		End for 
		
		// Detection pattern
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "detect"; 0; 0; 7; 7)
		SVG_New_rect($Dom_symbol; -1; -1; 8; 8; -1; -1; "white"; "")
		SVG_New_rect($Dom_symbol; 0; 0; 6; 6; -1; -1; "black"; "white")
		SVG_New_rect($Dom_symbol; 2; 2; 2; 2; -1; -1; "black"; "black")
		
		// Alignment pattern
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "align"; 0; 0; 5; 5)
		SVG_New_rect($Dom_symbol; 0; 0; 4; 4; -1; -1; "black"; "white")
		SVG_New_rect($Dom_symbol; 1.5; 1.5; 1; 1; -1; -1; "black"; "black"; 0.25)
		
		SVG_New_line($Dom_svg; 11.5; 10; $Lon_width-11; 10; "white")
		SVG_SET_STROKE_DASHARRAY(SVG_New_line($Dom_svg; 11.5; 10; $Lon_width-11; 10); 1)
		
		SVG_New_line($Dom_svg; 10; 11.5; 10; $Lon_width-11; "white")
		SVG_SET_STROKE_DASHARRAY(SVG_New_line($Dom_svg; 10; 11.5; 10; $Lon_width-11); 1)
		
		// Detection patterns
		SVG_Use($Dom_svg; "detect"; 4; 4)
		
		SVG_Use($Dom_svg; "detect"; $Lon_modules-3; 4)
		
		SVG_Use($Dom_svg; "detect"; 4; $Lon_modules-3)
		
		$Lon_alignStart:=Int:C8($Lon_modules/2)+1
		
		Case of 
				
				//______________________________________________________
			: ($Lon_modules>21)\
				 & ($Lon_modules<45)
				
				SVG_Use($Dom_svg; "align"; $Lon_modules-5; $Lon_modules-5)
				
				//______________________________________________________
			: ($Lon_modules>44)\
				 & ($Lon_modules<101)
				
				SVG_Use($Dom_svg; "align"; $Lon_alignStart+2; 8)
				
				SVG_Use($Dom_svg; "align"; 8; $Lon_alignStart+2)
				
				SVG_Use($Dom_svg; "align"; $Lon_alignStart+2; $Lon_alignStart+2)
				
				SVG_Use($Dom_svg; "align"; ($Lon_width-13); $Lon_alignStart+2)
				
				SVG_Use($Dom_svg; "align"; $Lon_modules-4; $Lon_modules-5)
				
				SVG_Use($Dom_svg; "align"; $Lon_alignStart; $Lon_modules-5)
				
				//______________________________________________________
				
			Else 
				
				//______________________________________________________
		End case 
		
		SVG_SET_TRANSFORM_TRANSLATE($Dom_svg; 0.5; 0.5)
		
		//________________________________________
	: (False:C215)  // Fade picture
		
		SVG_Define_radial_gradient($Dom_svg; "fade"; "black"; "white")
		
		SVG_New_image($Dom_svg; "#dev/mona.jpg"; 10; 10)
		SVG_New_rect($Dom_svg; 10; 10; 358; 529; 0; 0; "none"; "url(#fade)")
		
		//________________________________________
	: (True:C214)  // Relative path for pictures
		
		SVG_New_image($Dom_svg; "./DEV/apple.png"; 20; 10)  //base is the folder "Resources"
		SVG_New_image($Dom_svg; "../4d_40.png"; 70; 170)  //base is the database's folder
		SVG_New_image($Dom_svg; "/sample pictures/php.gif"; 110; 95; 100; 100)  //base is the folder "SVG" in the folder "Resources"
		SVG_SET_TRANSFORM_ROTATE(SVG_New_image($Dom_svg; "sample pictures/php.gif"; 110; 180; 100; 100); 180)  //base is the folder "SVG" in the folder "Resources"
		
		//________________________________________
	: (False:C215)
		
		$Dom_line:=SVG_New_line($Dom_svg; 10; 10; 100; 10; "black"; 1)
		$Dom_line:=SVG_New_line($Dom_svg; 10; 20; 100; 20; "black"; 1)
		SVG_SET_SHAPE_RENDERING($Dom_line; "crispEdges")
		
		//________________________________________
	: (True:C214)
		
		SVG_ADD_NAMESPACE($Dom_svg; "xlinkNS")
		SVG_Define_style($Dom_svg; "monstyle.css")
		$Dom_g:=SVG_New_group($Dom_SVG)
		SVG_SET_CLASS($Dom_g; "colored")
		
		// Draw a rectangle
		$Dom_rect:=SVG_New_rect($Dom_g; 25; 30; 320; 240; 10; 10; ""; "")
		
		//________________________________________
	: (True:C214)
		
		//SVG_New_image ($Dom_svg;"svg:mona.jpg";10;10)
		//SVG_New_image ($Dom_svg;"svg:level 1/level 2/mona.jpg";10;10)
		SVG_New_image($Dom_svg; "#dev/mona.jpg"; 10; 10)
		
		//________________________________________
	: (False:C215)  //http://forums.4d.fr/Post/FR/12135209/1/12135210#12135210
		
		$Dom_text:=SVG_New_textArea($Dom_svg; "Hello\rworld!")
		
		//______________________________________________________
	: (False:C215)  // SVG_SET_HUE
		
		SVG_SET_HUE(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 10; 10); 360)
		SVG_SET_HUE(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170; 60); 300)
		SVG_SET_HUE(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+160; 110); 240)
		SVG_SET_HUE(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+320; 160); 180)
		SVG_SET_HUE(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+480; 210); 120)
		SVG_SET_HUE(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+480+160; 260); 60)
		
		//$Dom_node:=SVG_Use ($Dom_svg;"mona")
		//SVG_SET_ID ($Dom_node;"pict_1")
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_node;10;10)
		
		//$Dom_node:=SVG_Use ($Dom_svg;"mona")
		//SVG_SET_ID ($Dom_node;"pict_2")
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_node;170;60)
		
		//$Dom_node:=SVG_Use ($Dom_svg;"mona")
		//SVG_SET_ID ($Dom_node;"pict_3")
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_node;170+160;110)
		
		//$Dom_node:=SVG_Use ($Dom_svg;"mona")
		//SVG_SET_ID ($Dom_node;"pict_4")
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_node;170+320;160)
		
		//$Dom_node:=SVG_Use ($Dom_svg;"mona")
		//SVG_SET_ID ($Dom_node;"pict_5")
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_node;170+480;210)
		
		//$Dom_node:=SVG_Use ($Dom_svg;"mona")
		//SVG_SET_ID ($Dom_node;"pict_6")
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_node;170+480+160;260)
		
		//SVG_SET_HUE (SVG_Use ($Dom_svg;"#dev/mona.jpg";10;10);360)
		//SVG_SET_HUE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170;60);300)
		//SVG_SET_HUE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+160;110);240)
		//SVG_SET_HUE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+320;160);180)
		//SVG_SET_HUE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+480;210);120)
		//SVG_SET_HUE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+480+160;260);60)
		//________________________________________
	: (False:C215)
		
		//css is in the folder"/Resources/dev/"
		//SVG_Define_style ($Dom_svg;"styles/monstyle.css")
		
		// Define 2 styles
		SVG_Define_style($Dom_SVG; ".colored {fill: yellow; fill-opacity: 0.6; stroke: red; stroke-width:8; stroke-opacity: 0.6}")
		SVG_Define_style($Dom_svg; ".blue{fill: blue;}")
		
		// Create a group and set a default style
		$Dom_g:=SVG_New_group($Dom_SVG)
		SVG_SET_CLASS($Dom_g; "colored blue")
		
		$Txt_buffer:=SVG_Get_class($Dom_g; ->$tTxt_classes)
		
		SVG_New_image($Dom_svg; "#dev/mona.jpg"; 10; 10)
		
		// Draw an object in the group
		$Dom_rect:=SVG_New_rect($Dom_g; 25; 30; 320; 240; 10; 10; ""; "")
		
		//________________________________________
	: (False:C215)
		
		SVG_ADD_NAMESPACE($Dom_svg; "xlinkNS")
		$Dom_picture:=DOM Create XML element:C865($Dom_svg; "image"; \
			"xlink:href"; "pictures/mona.jpg"; \
			"x"; 10; \
			"y"; 10; \
			"width"; 358; \
			"height"; 529)
		
		//SVG_New_image ($Dom_svg;"pictures/mona.jpg";10;10)
		//________________________________________
	: (False:C215)  // Brightness
		
		SVG_SET_BRIGHTNESS(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 10; 10); 4)
		SVG_SET_BRIGHTNESS(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170; 60); 2)
		SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+160; 110)
		SVG_SET_BRIGHTNESS(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+320; 160); 0.5)
		SVG_SET_BRIGHTNESS(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+480; 210); 0.125)
		
		//SVG_SET_BRIGHTNESS (SVG_New_image ($Dom_svg;"#dev/mona.jpg";10;10);2)
		//SVG_SET_BRIGHTNESS (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170;60);1)
		//SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+160;110)
		//SVG_SET_BRIGHTNESS (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+320;160);-0,2)
		//SVG_SET_BRIGHTNESS (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+480;210);-0,5)
		
		//______________________________________________________
	: (False:C215)  // Quadrillage vertical
		
		SVG_Define_style($Dom_svg; ".grid {stroke-dasharray:1,10;}")
		SVG_SET_CLASS(SVG_New_line($Dom_svg; 20; 210; 829; 210; "Silver"; 400); "grid")
		
		//$Dom_line:=SVG_New_line ($Dom_svg;400;10;400;408;"Silver";806)
		//SVG_SET_STROKE_DASHARRAY ($Dom_line;1;10)
		
		//SVG_SET_TRANSFORM_TRANSLATE($Dom_svg;50)
		//________________________________________
	: (False:C215)  // inlining style
		
		$Dom_line:=SVG_New_line($Dom_svg; 10; 20; 100; 20)
		SVG_Define_style($Dom_line; "{stroke:blue;stroke-width:5px;}")
		
		//________________________________________
	: (False:C215)
		
		$Dom_line:=SVG_New_line($Dom_svg; 10; 10; 100; 10; "black"; 1)
		
		// 1ère solution
		$Dom_line:=SVG_New_line($Dom_svg; 10; 20; 100; 20; "black"; 1)
		SVG_SET_SHAPE_RENDERING($Dom_line; "crispEdges")
		
		//$Dom_line:=SVG_New_line ($Dom_svg;10;40;100;40;"black";1)
		//$Dom_line:=SVG_New_line ($Dom_svg;10;50,5;100;50,5;"black";1)
		//________________________________________
	: (False:C215)
		
		SVG_SET_VIEWPORT_FILL($Dom_svg; "white")
		SVG_SET_OPACITY($Dom_svg; 50)
		$Dom_rect:=SVG_New_rect($Dom_svg; 50; 50; 50; 50; 0; 0; "black"; "white")
		
		//________________________________________
	: (False:C215)
		
		$Dom_picture:=SVG_New_image($Dom_svg; "#dev/mona.jpg"; 70; 40)
		
		READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"dev:plugin.png"; $Pic_buffer)
		
		$Dom_picture:=SVG_New_embedded_image($Dom_svg; $Pic_buffer; 20; 0)
		
		//________________________________________
	: (False:C215)
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 19; 0; 60; 40)
		SVG_SET_STROKE_DASHARRAY($Dom_rect; 0)
		
		//________________________________________
	: (False:C215)
		
		// SVG_SET_OPTIONS (SVG_Get_options  ?+ 11)
		//$Dom_circle:=SVG_New_circle ($Dom_svg;20;20;20)
		//$Dom_clip:=SVG_Define_clip_Path ($Dom_svg;"clipCircle")
		//SVG_New_rect ($Dom_clip;0;0;20;40)
		//SVG_SET_CLIP_PATH ($Dom_circle;"clipCircle")
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 19; 0; 60; 40)
		SVG_New_arc($Dom_svg; 20; 20; 20; 180; 0)
		
		//________________________________________
	: (False:C215)
		
		$Dom_text:=SVG_New_textArea($Dom_svg; "Hello world !")
		
		ARRAY TEXT:C222($tTxt_attributeNames; 0x0000)
		ARRAY TEXT:C222($tTxt_attributeValues; 0x0000)
		
		APPEND TO ARRAY:C911($tTxt_attributeNames; "fill")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "black")
		APPEND TO ARRAY:C911($tTxt_attributeNames; "font-family")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "'Lucida Grande' Verdana")
		APPEND TO ARRAY:C911($tTxt_attributeNames; "font-size")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "20px")
		APPEND TO ARRAY:C911($tTxt_attributeNames; "text-align")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "center")
		
		SVG_DEFINE_STYLE_WITH_ARRAYS($Dom_svg; ->$tTxt_attributeNames; ->$tTxt_attributeValues; "title")
		SVG_SET_CLASS($Dom_text; "title")
		
		//________________________________________
	: (False:C215)
		
		SVG_SET_VIEWPORT_FILL($Dom_svg; "red")
		
		For ($Lon_i; 0; 5000; 1)
			
			SVG_New_rect($Dom_svg; Random:C100; Random:C100; 100; 100)
			
		End for 
		
		//________________________________________
	: (False:C215)
		
		SVG_ADD_NAMESPACE($Dom_svg; "vdl"; "vincent@de-lachaux.net")
		
		//SVG_ADD_NAME_SPACE ($Dom_svg;"xlinkNS")
		
		$Dom_circle:=SVG_New_circle($Dom_svg; 100; 100; 50)
		DOM SET XML ATTRIBUTE:C866($Dom_circle; \
			"vdl:myAttribut"; "toto")
		
		//________________________________________
	: (False:C215)
		
		//  $Dom_text:=SVG_New_text ($Dom_svg;"Hello world !")
		//SVG_SET_FONT_STYLE ($Dom_text;8)
		
		$Dom_text:=SVG_New_textArea($Dom_svg; "Hello world !")
		
		//$Txt_style:=".barre {text-decoration:underline;}"
		$Txt_style:=".barre {text-decoration:line-through;}"
		SVG_Define_style($Dom_text; $Txt_style)
		
		SVG_SET_CLASS($Dom_text; "barre")
		
		//______________________________________________________
	: (False:C215)  // How do I make a button (3) v13
		
		//SVG_ADD_NAME_SPACE ($Dom_svg;"vdl";"http://vdl.com/")
		
		SVG_SET_DIMENSIONS($Dom_svg; 1200; 800)
		
		// Define the gradient
		//$Dom_gradient:=SVG_Define_linear_gradient ($Dom_svg;"buttonGradient";"cornflowerblue:50";"blue:50";90;"reflect";0;0,5;0;1)
		$Dom_gradient:=SVG_Define_linear_gradient($Dom_svg; "buttonGradient"; "cornflowerblue:50"; "blue:50"; 90; "reflect"; 0; 50; 0; 100)
		$Dom_gradient:=SVG_Define_linear_gradient($Dom_svg; "buttonGradient"; "lavenderblush"; "red"; 90; "reflect"; 0; 0.1; 0; 100)
		$Dom_gradient:=SVG_Define_linear_gradient($Dom_svg; "buttonGradient"; "lavenderblush"; "red"; 90; "reflect"; 0; 10; 0; 100)
		
		// Define a standard shadow
		SVG_Define_shadow($Dom_svg; "Shadow")
		
		ARRAY TEXT:C222($tTxt_attributeNames; 0x0000)
		ARRAY TEXT:C222($tTxt_attributeValues; 0x0000)
		
		APPEND TO ARRAY:C911($tTxt_attributeNames; "fill")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "black")
		APPEND TO ARRAY:C911($tTxt_attributeNames; "font-family")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "'Lucida Grande' Verdana")
		APPEND TO ARRAY:C911($tTxt_attributeNames; "font-size")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "20px")
		APPEND TO ARRAY:C911($tTxt_attributeNames; "text-align")
		APPEND TO ARRAY:C911($tTxt_attributeValues; "center")
		
		SVG_DEFINE_STYLE_WITH_ARRAYS($Dom_svg; ->$tTxt_attributeNames; ->$tTxt_attributeValues; "title")
		
		// Draw the button {
		$Dom_g:=SVG_New_group($Dom_svg; "MyButton")
		
		$Dom_rect:=SVG_New_rect($Dom_g; 30; 30; 200; 60; 10; 10; ""; "")
		SVG_SET_FILL_BRUSH($Dom_rect; "url(#buttonGradient)")
		
		$Dom_text:=SVG_New_textArea($Dom_g; "New Button…"; 30; 45; 200; 60)
		
		SVG_SET_CLASS($Dom_text; "title")
		
		// Put the shadow
		SVG_SET_FILTER($Dom_rect; "Shadow")
		//}
		
		//______________________________________________________
	: (False:C215)  //http://forums.4d.fr/Post//6110068/1/
		
		//$nButtonLeft:=72
		//$nButtonTop:=17
		//$nButtonWidth:=55
		//$nButtonHeight:=22
		
		//$nDiameter:=$nButtonHeight
		//$nRadius:=$nDiameter\2
		
		//$nX:=$nRadius
		//$nY:=0
		
		//$nArcFlag:=0
		//$nSweepFlag:=0
		
		//$Dom_symbol:=SVG_Define_symbol ($Dom_svg;"myButton")
		//$tPath:=SVG_New_path ($Dom_symbol;$nButtonLeft;$nButtonTop;$tStrokeColor;$tFillColor;$rStroke)
		//SVG_PATH_MOVE_TO ($tPath;$nRadius;$nDiameter)
		//SVG_PATH_ARC ($tPath;$nRadius;$nRadius;$nX;$nY;$nRotation;$nArcFlag+$nSweepFlag)
		//SVG_PATH_LINE_TO ($tPath;$nButtonWidth-$nRadius;0)
		//SVG_PATH_LINE_TO ($tPath;$nButtonWidth-$nRadius;$nDiameter)
		//SVG_PATH_CLOSE ($tPath)
		//$Dom_buffer:=SVG_Use ($Dom_svg;"myButton";$nButtonLeft;$nButtonTop)
		
		//______________________________________________________
	: (False:C215)  // ACI0072296
		
		$Dom_svg:=SVG_New
		$Dom_text:=SVG_New_textArea($Dom_svg; "2\r3\r4\r5")
		
		$Dom_new:=SVG_Copy($Dom_svg)
		SVG_CLEAR($Dom_svg)
		
		$Dom_svg:=SVG_Copy($Dom_new)
		SVG_CLEAR($Dom_new)
		
		//______________________________________________________
	: (False:C215)  // Support for styled text in textArea
		
		$Txt_buffer:="<SPAN STYLE=\"font-size:24pt\">Hello </SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">world</SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\"> !</SPAN>"+\
			"<SPAN STYLE=\"font-size:24pt\"><BR/>it's me</SPAN>"
		
		$Dom_text:=SVG_New_textArea($Dom_svg; $Txt_buffer; 50; 50)
		
		//______________________________________________________
	: (False:C215)  // Embedded style for SVG_New_text & SVG_New_tspan (alternative syntax)
		
		$Dom_text:=SVG_New_text($Dom_svg; "Hello\rWorld !"; 10; 50; "{font-size:48px;fill:blue;font-weight:bold;}")
		SVG_New_tspan($Dom_text; "it's me"; 10; 108; "{fill:red;font-size:12px;}")
		
		//______________________________________________________
	: (False:C215)  // Embedded style for SVG_New_textArea (alternative syntax)
		
		$Dom_text:=SVG_New_textArea($Dom_svg; "Hello World !"; 0; 0; -1; -1; "{font-size:48px;fill:red;font-weight:bold;}")
		
		//______________________________________________________
	: (False:C215)  // Style definition & tspan included in a textArea
		
		$Txt_buffer:=SVG_Define_style($Dom_svg; "textArea {font-size:48px;}")
		$Txt_buffer:=SVG_Define_style($Dom_svg; ".colorRed {fill:red;}")
		$Dom_text:=SVG_New_textArea($Dom_svg; "Hello \r")
		SVG_SET_CLASS(SVG_New_tspan($Dom_text; "World "; -1; -1; ""; -1); "colorRed")
		SVG_APPEND_TEXT_TO_TEXTAREA($Dom_text; "!")
		
		//______________________________________________________
	: (False:C215)  // SVG_Get_root_reference
		
		$Dom_g:=SVG_New_group($Dom_svg)
		SVG_Post_comment($Dom_svg; $Dom_svg)
		SVG_New_text($Dom_svg; SVG_Get_root_reference($Dom_g))
		
		//______________________________________________________
	: (False:C215)  // Marker - delete marker - delete element with SVG_CLEAR
		
		SVG_SET_DEFAULT_BRUSHES("red"; "red")
		
		// Définir un cercle pour marquer les points
		$Dom_point:=SVG_Define_marker($Dom_svg; "pointMarker"; 2; 2; 3; 3)
		SVG_SET_VIEWBOX($Dom_point; 0; 0; 4; 4)
		SVG_New_circle($Dom_point; 2; 2; 1)
		
		// Définir un carré pour le point de début
		$Dom_start:=SVG_Define_marker($Dom_svg; "startMarker"; 1; 1; 2; 2)
		SVG_New_rect($Dom_start; 0; 0; 2; 2)
		
		// Définir un triangle pour le point de fin
		$Dom_end:=SVG_Define_marker($Dom_svg; "endMarker"; 5; 5; 3; 3; 60)
		SVG_SET_VIEWBOX($Dom_end; 0; 0; 10; 10)
		SVG_New_regular_polygon($Dom_end; 10; 3)
		
		// Axe des x
		For ($Lon_i; 0; 200; 20)
			
			APPEND TO ARRAY:C911($tLon_X; $Lon_i+10)
			
		End for 
		
		// Données
		APPEND TO ARRAY:C911($tLon_Y; 100)
		APPEND TO ARRAY:C911($tLon_Y; 100)
		APPEND TO ARRAY:C911($tLon_Y; 30)
		APPEND TO ARRAY:C911($tLon_Y; 30)
		APPEND TO ARRAY:C911($tLon_Y; 80)
		APPEND TO ARRAY:C911($tLon_Y; 60)
		APPEND TO ARRAY:C911($tLon_Y; 10)
		APPEND TO ARRAY:C911($tLon_Y; 40)
		APPEND TO ARRAY:C911($tLon_Y; 50)
		APPEND TO ARRAY:C911($tLon_Y; 70)
		$Dom_line:=SVG_New_polyline_by_arrays($Dom_svg; ->$tLon_X; ->$tLon_Y; "red"; "none"; 5)
		
		// Disposer les marqueurs :
		SVG_SET_MARKER($Dom_line; "startMarker"; "start")
		SVG_SET_MARKER($Dom_line; "pointMarker"; "middle")
		SVG_SET_MARKER($Dom_line; "endMarker"; "end")
		
		// Clear the pointMarker
		SVG_CLEAR($Dom_point)
		
		// Delete middle marker
		SVG_SET_MARKER($Dom_line; ""; "middle")
		
		//______________________________________________________
	: (False:C215)
		
		//<filter id="Matrix" filterUnits="objectBoundingBox"
		//            x="0%" y="0%" width="100%" height="100%">
		//      <feColorMatrix type="matrix" in="SourceGraphic"
		//           values=".33 .33 .33 0 0
		//                   .33 .33 .33 0 0
		//                   .33 .33 .33 0 0
		//                   .33 .33 .33 0 0"/>
		//    </filter>
		//$Dom_filter:=SVG_Define_filter ($Dom_svg;"greyscale";0;0;100;100;"objectBoundingBox")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".33 .33 .33 0 0 .33 .33 .33 0 0 .33 .33 .33 0 0 .33 .33 .33 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".15 .15 .15 0 0 .15 .15 .15 0 0 .15 .15 .15 0 0 .15 .15 .15 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".05 .05 .05 0 0 .05 .05 .05 0 0 .05 .05 .05 0 0 .05 .05 .05 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".66 .66 .66 0 0 .66 .66 .66 0 0 .66 .66 .66 0 0 .66 .66 .66 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".100 .100 .100 0 0 .100 .100 .100 0 0 .100 .100 .100 0 0 .100 .100 .100 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".255 .255 .255 0 0 .255 .255 .255 0 0 .255 .255 .255 0 0 .255 .255 .255 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";".999 .999 .999 0 0 .999 .999 .999 0 0 .999 .999 .999 0 0 .999 .999 .999 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";"1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";"255 255 255 0 0 255 255 255 0 0 255 255 255 0 0 255 255 255 0 0")
		//$Dom_fe:=SVG_Filter_ColorMatrix ($Dom_filter;"SourceGraphic";"";"matrix";"-1 0 0 0 1 0 -1 0 0 1 0 0 -1 0 1 0 0 0 0 0")
		
		//$Dom_picture:=SVG_New_image ($Dom_svg;"#dev/php.gif";10;10)
		
		//  //$Dom_picture:=SVG_New_image ($Dom_svg;"#dev/php.gif";10;10)
		//$Dom_picture:=SVG_New_image ($Dom_svg;"#dev/php.gif";100;100)
		//  //SVG_SET_FILTER ($Dom_picture;"greyscale")
		//  SVG_FADE_TO_GREY_SCALE($Dom_picture;10)
		
		$Dom_symbol:=SVG_Define_symbol($Dom_svg; "picture")
		SVG_New_image($Dom_symbol; "#dev/pl3436.jpg")
		
		//SVG_Use ($Dom_svg;"picture")
		$Dom_g:=SVG_New_group($Dom_svg)
		
		SVG_Use($Dom_g; "picture")
		
		SVG_SET_SATURATION($Dom_g; 0)
		
		//SVG_FADE_TO_GREY_SCALE ($Dom_g;0,8)
		
		//SVG_New_image ($Dom_svg;"#dev/pl3436.jpg";10;10)
		//SVG_FADE_TO_GREY_SCALE (SVG_New_image ($Dom_svg;"#dev/pl3436.jpg";170;60);33)
		//SVG_FADE_TO_GREY_SCALE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170;60);33)
		//SVG_FADE_TO_GREY_SCALE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+160;110);66)
		//SVG_FADE_TO_GREY_SCALE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+320;160);132)
		//SVG_FADE_TO_GREY_SCALE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+480;210);264)
		//SVG_FADE_TO_GREY_SCALE (SVG_New_image ($Dom_svg;"#dev/mona.jpg";170+480+160;260);264+264)
		
		//______________________________________________________
	: (False:C215)  // Colors
		
		$Dom_circle:=SVG_New_circle($Dom_svg; 200; 100; 80; "none"; "red:60")
		$Dom_circle:=SVG_New_circle($Dom_svg; 250; 175; 80; "none"; "blue:60")
		$Dom_circle:=SVG_New_circle($Dom_svg; 150; 175; 80; "none"; "yellow:60")
		
		SVG_SAVE_AS_TEXT($Dom_svg; System folder:C487(Desktop:K41:16)+"test.svg")
		
		//______________________________________________________
	: (False:C215)  // SVG_SET_SATURATION
		
		SVG_SET_SATURATION(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 10; 10); 100)
		SVG_SET_SATURATION(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170; 60); 50)
		SVG_SET_SATURATION(SVG_New_image($Dom_svg; "#dev/mona.jpg"; 170+160; 110); 0)
		
		//______________________________________________________
	: (False:C215)  // How do I make a button (2) v12
		
		SVG_SET_DIMENSIONS($Dom_svg; 1200; 800)
		
		// Define the gradient
		$Dom_gradient:=SVG_Define_linear_gradient($Dom_svg; "buttonGradient"; "cornflowerblue:50"; "blue:50"; 90; "reflect"; 0; 0.5; 0; 1)
		
		//$Dom_gradient:=SVG_Define_linear_gradient ($Dom_svg;"buttonGradient";"lavenderblush";"red";90;"reflect";0;0,1;0;1)
		
		// Define a standard shadow
		SVG_Define_shadow($Dom_svg; "Shadow")
		
		// Define the title style
		$Txt_buffer:=".title{fill:black;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;}"
		SVG_Define_style($Dom_svg; $Txt_buffer)
		
		// Draw the button {
		$Dom_g:=SVG_New_group($Dom_svg; "MyButton")
		
		// Put the color gradient
		SVG_SET_FILL_BRUSH($Dom_g; "url(#buttonGradient)")
		$Dom_rect:=SVG_New_rect($Dom_g; 30; 30; 200; 60; 10; 10; ""; "")
		
		//$Dom_text:=SVG_New_textArea ($Dom_g;"New Button…";30;45;200;60;"'Lucida Grande' Verdana";20;-1;Centré)
		$Dom_text:=SVG_New_textArea($Dom_g; "New Button…"; 30; 45; 200; 60)
		
		//SVG_SET_FONT_COLOR ($Dom_text;"white")
		
		//SVG_SET_INLINE_STYLE ($Dom_text;$Txt_buffer)
		//DOM ECRIRE ATTRIBUT XML($Dom_text;"style";$Txt_buffer)
		
		SVG_SET_CLASS($Dom_text; "title")
		
		// Put the shadow
		SVG_SET_FILTER($Dom_rect; "Shadow")
		//}
		
		//______________________________________________________
	: (False:C215)  // How do I make a button (1) v11
		
		SVG_SET_DIMENSIONS($Dom_svg; 1200; 800)
		
		// Define the gradient
		$Dom_gradient:=SVG_Define_linear_gradient($Dom_svg; "buttonGradient"; "cornflowerblue:50"; "blue:50"; 90; "reflect"; 0; 0.5; 0; 1)
		
		//$Dom_gradient:=SVG_Define_linear_gradient ($Dom_svg;"buttonGradient";"lavenderblush";"red";90;"reflect";0;0,1;0;1)
		
		// Define a standard shadow
		SVG_Define_shadow($Dom_svg; "Shadow")
		
		// Draw the button {
		$Dom_g:=SVG_New_group($Dom_svg; "MyButton")
		
		// Put the color gradient
		SVG_SET_FILL_BRUSH($Dom_g; "url(#buttonBlue)")
		$Dom_rect:=SVG_New_rect($Dom_g; 30; 30; 200; 60; 20; 20; ""; "")
		$Dom_text:=SVG_New_textArea($Dom_g; "New Button…"; 30; 45; 200; 60; "'Lucida Grande' Verdana"; 20; -1; Align center:K42:3)
		SVG_SET_FONT_COLOR($Dom_text; "white")
		
		// Put the shadow
		SVG_SET_FILTER($Dom_rect; "Shadow")
		//}
		
		//______________________________________________________
	: (False:C215)  // Filligrane
		
		$Dom_picture:=SVG_New_image($Dom_svg; "#dev/mona.jpg"; 70; 40)
		$Dom_picture:=SVG_New_image($Dom_svg; "#dev/plugin.png"; 20; 0)
		SVG_SET_OPACITY($Dom_picture; 40)
		
		//________________________________________
	: (False:C215)
		
		$Dom_text:=SVG_New_text($Dom_svg; "Lucida Grande"; 10; 20; "'Lucida Grande'"; 24)
		$Dom_text:=SVG_New_text($Dom_svg; "Lucida Blackletter"; 10; 60; "'Lucida Blackletter'"; 24)
		$Dom_text:=SVG_New_text($Dom_svg; "Missing Font"; 10; 100; "'Missing Font'"; 24)
		$Dom_text:=SVG_New_text($Dom_svg; "Missing Font, Lucida Blackletter"; 10; 140; "'Missing Font' 'Lucida Blackletter'"; 24)
		
		$Dom_text:=SVG_New_text($Dom_svg; "Helvetica"; 10; 200; "'Helvetica'"; 24)
		$Dom_text:=SVG_New_text($Dom_svg; "Helvetica Neue"; 10; 240; "'Helvetica Neue'"; 24)
		$Dom_text:=SVG_New_text($Dom_svg; "Helvetica Neue Black Condensed"; 10; 280; "'Helvetica Neue Black Condensed'"; 24)
		
		//______________________________________________________
	: (False:C215)  // Filligrane
		
		$Dom_picture:=SVG_New_image($Dom_svg; "#dev/mona.jpg"; 70; 40)
		$Dom_picture:=SVG_New_image($Dom_svg; "#dev/plugin.png"; 20; 0)
		SVG_SET_OPACITY($Dom_picture; 40)
		
		//SVG_SAVE_AS_PICTURE ($Dom_svg;"";".png")
		
		//______________________________________________________
	: (False:C215)  // Transparence
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 0; 0; 192; 341; 0; 0; "black"; "black")
		$Dom_picture:=SVG_New_image($Dom_svg; "#dev/Sv hund.gif")
		
		//______________________________________________________
	: (False:C215)
		
		$Dom_svg:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg")
		$Dom_rect:=DOM Create XML element:C865($Dom_svg; "rect"; \
			"x"; 10; \
			"y"; 10; \
			"width"; 200; \
			"height"; 100; \
			"rx"; 20; \
			"ry"; 20; \
			"fill"; "white"; \
			"stroke"; "black")
		
		SVG EXPORT TO PICTURE:C1017($Dom_SVG; $Pic_buffer)
		
		WRITE PICTURE FILE:C680(System folder:C487(Desktop:K41:16)+"test.svg"; $Pic_buffer; ".svg")
		WRITE PICTURE FILE:C680(System folder:C487(Desktop:K41:16)+"test.png"; $Pic_buffer; ".png")
		
		DOM CLOSE XML:C722($Dom_svg)
		
		//______________________________________________________
	: (False:C215)
		
		//SVG_Define_shadow ($Dom_svg;"Shadow")
		
		//$Txt_buffer:=".selected{filter: #Shadow}"
		//SVG_Define_style ($Dom_svg;$Txt_buffer)
		
		//$Txt_buffer:=".not_selected{filter: none}"
		//SVG_Define_style ($Dom_svg;$Txt_buffer)
		
		$Dom_rect:=SVG_New_rect($Dom_svg; 10; 10; 200; 100; 20; 20)
		
		//SVG_SET_ID ($Dom_rect;"toto")
		//SVG_SET_FILTER ($Dom_rect;"none")
		
		//DOM ECRIRE ATTRIBUT XML($rect;"filter";"none")
		//SVG_SET_CLASS ($rect;"not_selected")
		
		// SVGTool_SET_VIEWER_CALLBACK ("testCallbackMethod")
		
		//______________________________________________________
	: (False:C215)
		
		$Dom_text:=SVG_New_text($Dom_svg; "tagada")
		SVG_SET_FONT_STYLE($Dom_text; Bold:K14:2)
		
		//______________________________________________________
	: (False:C215)
		
		//LIRE FICHIER IMAGE(Dossier 4D(Dossier Resources courant)+"Images:icon.svg";$Pic_buffer)
		//$Dom_picture:=SVG_New_embedded_image ($Dom_svg;$Pic_buffer;0;0;".svg")
		//SVG_SET_OPACITY ($Dom_picture;50)
		
		$Dom_g:=SVG_New_group($Dom_svg)
		$Dom_circle:=SVG_New_circle($Dom_g; 100; 100; 25; "blue"; "blue"; 5)
		SVG_SET_OPACITY($Dom_circle; 50; 80)
		SVG_SET_OPACITY($Dom_g; 80)
		
		//______________________________________________________
	: (False:C215)
		
		ARRAY TEXT:C222($tTxt_names; 9)
		$tTxt_names{1}:="hdl-top-left"
		$tTxt_names{2}:="hdl-top-middle"
		$tTxt_names{3}:="hdl-top-right"
		$tTxt_names{4}:="hdl-middle-left"
		$tTxt_names{5}:="hdl-middle-right"
		$tTxt_names{6}:="hdl-bottom-left"
		$tTxt_names{7}:="hdl-bottom-middle"
		$tTxt_names{8}:="hdl-bottom-right"
		$tTxt_names{9}:="select-rect"
		
		$Dom_g:=SVG_New_group($Dom_svg)
		
		For ($Lon_i; 1; 8; 1)
			
			SVG_SET_ID(SVG_New_circle($Dom_g; 0; 0; 5; "bkue:50"; "blue"; 1); $tTxt_names{$Lon_i})
			
		End for 
		
		SVG_SET_ID(SVG_New_rect($Dom_g; 0; 0; 0; 0; 0; 0; "blue:50"; "none"; 1); $tTxt_names{9})
		
		SVG_SET_VISIBILITY(SVG_Find_ID($Dom_svg; "tools"); True:C214)
		
		//______________________________________________________
	: (False:C215)
		
		$Dom_text:=SVG_New_text($Dom_svg; "Salut tout le monde"; 20; 20)
		SVG_SET_TEXT_RENDERING($Dom_text; "optimizeLegibility")
		$Dom_text:=SVG_New_text($Dom_svg; "Salut tout le monde"; 20; 60)
		
		//______________________________________________________
	: (False:C215)  // Denis report
		
		$Dom_arc:=SVG_New_arc($Dom_svg; 55; 55; 50; 0; 365; "steelblue"; "steelblue:50")
		SVG_New_text($Dom_svg; "365º"; 45; 50)
		$Dom_arc:=SVG_New_arc($Dom_svg; 150; 150; 50; 0; 360; "steelblue"; "steelblue:50")
		SVG_New_text($Dom_svg; "360º"; 140; 145)
		$Dom_arc:=SVG_New_arc($Dom_svg; 250; 250; 50; 0; 359; "steelblue"; "steelblue:50")
		SVG_New_text($Dom_svg; "359º"; 240; 245)
		
		//______________________________________________________
	: (False:C215)
		
		$Dom_picture:=SVG_New_image($Dom_svg; "#Images/banner.svg")  //OK
		
		//______________________________________________________
	: (False:C215)
		
		//$Dom_text:=SVG_New_textArea ($Dom_svg;"test1\r\rtest2\r\r";10;10;300;100;"Times New Roman";9;Normal;Aligné à gauche)
		//$rayon:=2
		//$cx:=100
		//$cy:=100
		//$points:=Chaine($cx-$rayon)+","+Chaine($cy+$rayon)+" "+Chaine($cx)+","+Chaine($cy-$rayon)+" "+Chaine($cx+$rayon)+","+Chaine($cy+$rayon)+" "+Chaine($cx-$rayon)+","+Chaine($cy+$rayon)
		
		//$couleurFond:="red"
		//$couleurLigne:="red"
		
		//$R:=SVG_New_polygon ($Dom_svg;$points;$couleurLigne;$couleurFond;0,25)
		
		$Dom_text:=SVG_New_text($Dom_svg; "test"; 0; 0; "Helvetica"; 24; 0; Align left:K42:2; "red")  // returns "", wrong
		
		$Boo_OK:=xml_referenceValid($Dom_circle)
		$Boo_OK:=xml_referenceValid($Dom_text)
		
		//$Txt_onErrorBuffer:=Methode appelee sur erreur
		// APPELER SUR ERREUR("noError")
		//$Dom_root:=DOM Lire element XML racine($Dom_circle)
		//$Boo_OK:=(OK=1)
		//APPELER SUR ERREUR($Txt_onErrorBuffer)
		
		//$Txt_onErrorBuffer:=Methode appelee sur erreur
		// APPELER SUR ERREUR("noError")
		//$Dom_root:=DOM Lire element XML racine($Dom_text)
		//$Boo_OK:=(OK=1)
		//APPELER SUR ERREUR($Txt_onErrorBuffer)
		
		//______________________________________________________
	: (False:C215)
		
		READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images:icon.svg"; $Pic_buffer)
		$Dom_svg:=SVG_New(200; 100)
		SVG_SET_VIEWPORT_FILL($Dom_svg; "white")
		$Dom_picture:=SVG_New_embedded_image($Dom_svg; $Pic_buffer; 0; 0; ".svg")
		SVG_SET_TRANSFORM_SCALE($Dom_picture; 0.5)
		
		//______________________________________________________
	: (False:C215)
		
		SVG_Post_comment($Dom_svg; "Create a group and define the stroke color as blue")
		$Dom_g:=SVG_New_group($Dom_svg)
		SVG_SET_STROKE_BRUSH($Dom_g; "blue")
		
		SVG_Post_comment($Dom_g; "Create 3 rectangles with a color of contour \"inherited\"")
		SVG_SET_ID(SVG_New_rect($Dom_g; 10; 10; 400; 200; 0; 0; "inherit"; "white"); "rec_1")
		SVG_SET_ID(SVG_New_rect($Dom_g; 20; 20; 300; 150; 0; 0; "inherit"; "white"); "rec_2")
		SVG_SET_ID(SVG_New_rect($Dom_g; 30; 30; 200; 100; 0; 0; "inherit"; "white"); "rec_3")
		
		SVGTool_SET_VIEWER_CALLBACK("testCallbackMethod")
		
		//______________________________________________________
	: (False:C215)
		
		SVG_SET_TRANSFORM_SCALE($Dom_svg; 2)
		
		// Groupe pour deplacement de l'origine
		$Dom_g:=SVG_New_group($Dom_SVG)
		
		// Axes
		$Dom_line:=SVG_New_line($Dom_g; 0; 0; 300; 0; "red")
		$Dom_line:=SVG_New_line($Dom_g; 0; 0; 0; 300; "red")
		$Dom_origine:=SVG_New_circle($Dom_g; 0; 0; 1)
		
		$Dom_text:=DOM Create XML element:C865($Dom_g; "text")
		DOM SET XML ELEMENT VALUE:C868($Dom_text; "Hello paul !")
		DOM SET XML ATTRIBUTE:C866($Dom_text; \
			"fill"; "blue")
		
		$Dom_text:=DOM Create XML element:C865($Dom_g; "text")
		DOM SET XML ELEMENT VALUE:C868($Dom_text; "Hello paul !")
		DOM SET XML ATTRIBUTE:C866($Dom_text; \
			"y"; "1ex")
		
		// Deplacement de l'origine
		SVG_SET_TRANSFORM_TRANSLATE($Dom_g; 50; 50)
		
		//______________________________________________________
	: (False:C215)
		
		$Lon_x:=20
		$Lon_y:=60
		
		SVG_SET_TRANSFORM_SCALE($Dom_svg; 4)
		
		SVG_Post_comment($Dom_svg; "Groupe pour deplacement de l'origine")
		$Dom_g:=SVG_New_group($Dom_SVG)
		
		SVG_Post_comment($Dom_g; "Quadrillage")
		SVG_SET_STROKE_DASHARRAY(SVG_New_line($Dom_g; 0; 0; 400; 0; "blue:30"; 800); 1.1; 9)
		SVG_SET_STROKE_DASHARRAY(SVG_New_line($Dom_g; 0; 0; 0; 400; "blue:30"; 800); 1.1; 9)
		
		SVG_Post_comment($Dom_g; "Axes")
		$Dom_line:=SVG_New_line($Dom_g; 0; 0; 300; 0; "red")
		$Dom_line:=SVG_New_line($Dom_g; 0; 0; 0; 300; "red")
		$Dom_text:=SVG_New_text($Dom_g; "0"; -3.5; -15)
		$Dom_text:=SVG_New_text($Dom_g; "0"; -10; -8)
		$Dom_origine:=SVG_New_circle($Dom_g; 0; 0; 1)
		
		// Largeur et hauteur de l'objet
		$Lon_recWidth:=60
		$Lon_recHeight:=20
		
		SVG_Post_comment($Dom_g; "Fantome de l'objet")
		$Dom_rect:=SVG_New_rect($Dom_g; $Lon_x; $Lon_y; $Lon_recWidth; $Lon_recHeight; 0; 0; "black:60"; "yellow:80")
		
		// Coordonnées du centre
		$Lon_middleX:=($Lon_recWidth/2)+$Lon_x
		$Lon_middleY:=($Lon_recHeight/2)+$Lon_y
		
		SVG_Post_comment($Dom_g; "Objet avec rotation")
		$Dom_rect:=SVG_New_rect($Dom_g; $Lon_x; $Lon_y; $Lon_recWidth; $Lon_recHeight; 0; 0; "black"; "blue:60")
		SVG_SET_TRANSFORM_ROTATE($Dom_rect; -90; $Lon_middleX; $Lon_middleY)
		
		$Lon_tx:=-($Lon_recHeight-$Lon_recWidth)/2
		$Lon_ty:=($Lon_recHeight-$Lon_recWidth)/2
		SVG_SET_TRANSFORM_TRANSLATE($Dom_rect; $Lon_tx; $Lon_ty)
		//}
		
		// Deplacement de l'origine
		SVG_SET_TRANSFORM_TRANSLATE($Dom_g; 50; 50)
		
		//______________________________________________________
	: (False:C215)
		
		// Define a style
		$Txt_style:=".colored {fill: yellow; fill-opacity: 0.6; stroke: red; stroke-width:8; stroke-opacity: 0.6}"
		SVG_Define_style($Dom_SVG; $Txt_style)
		
		// Create a group and set a default style
		$Dom_g:=SVG_New_group($Dom_SVG)
		SVG_SET_CLASS($Dom_g; "colored")
		
		// Draw a rectangle
		$Dom_rect:=SVG_New_rect($Dom_g; 25; 30; 320; 240; 10; 10; ""; "")
		
		// Draw a circle then overload the style with a custom stroke color
		$Dom_circle:=SVG_New_circle($Dom_g; 300; 250; 100; ""; "")
		SVG_SET_STROKE_BRUSH($Dom_circle; "blue")
		
		//______________________________________________________
	: (False:C215)  // ACI0065221
		
		$Txt_buffer:="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		$Lon_width:=400
		$Lon_height:=100
		
		$Txt_buffer:=SVG_New_textArea($Dom_svg; $Txt_buffer; 30; 21; $Lon_width; $Lon_height; _O_Font name:C462(1024); 20; Bold:K14:2+Italic:K14:3+Underline:K14:4; On the left:K39:2)
		
		SVGTool_SHOW_IN_VIEWER($Txt_buffer)
		
		//______________________________________________________
	: (False:C215)  // ACI0065957
		
		$Txt_buffer:="this is a line"+Char:C90(13)+"this is a line"+Char:C90(13)+"this is a line"+Char:C90(13)+"this is a line"
		
		SVG_New_text($Dom_svg; $Txt_buffer; 10; 10; "Lucida Grande"; 12; 1; Align left:K42:2; ""; 0; 2)
		
		//______________________________________________________
	: (True:C214)
		
		//$Dom_svg:=SVG_New (440;800)
		
		//$Dom_root:=SVG_New_group ($Dom_svg)  // origin
		
		//SVG_SET_STROKE_DASHARRAY (SVG_New_line ($Dom_root;0;0;0;400);2;1)
		//SVG_SET_STROKE_DASHARRAY (SVG_New_line ($Dom_root;0;0;400;0);2;1)
		//$Dom_rect:=SVG_New_rect ($Dom_root;0;0;400;400;0;0;"none";"white")
		
		//$Dom_group:=SVG_New_group ($Dom_root)
		//SVG_SET_FONT_COLOR ($Dom_group;"red")
		
		//$Lon_x:=0
		//$Lon_y:=0
		//$Lon_width:=180
		//$Lon_height:=40
		
		//$Dom_rect:=SVG_New_rect ($Dom_group;$Lon_x;$Lon_y;$Lon_width;$Lon_height;0;0;"blue";"none")
		//$Dom_svg_TextArea_t:=SVG_New_textArea ($Dom_group;"Hello world !";$Lon_x;$Lon_y;$Lon_width;$Lon_height;"Arial";24;0;Centré)
		
		//SVG_SET_FONT_FAMILY ($Dom_svg_TextArea_t;"optima";"Lithos Pro Black")
		
		//Si ($Boo_rotate)
		
		//SVG_SET_TRANSFORM_ROTATE ($Dom_rect;-90;$Lon_x;$Lon_y)
		//SVG_SET_TRANSFORM_ROTATE ($Dom_svg_TextArea_t;-90;$Lon_x;$Lon_y)
		
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_group;0;$Lon_width)
		
		// Fin de si
		
		//SVG_SET_TRANSFORM_TRANSLATE ($Dom_root;22;185)
		SVG_Define_style($Dom_svg; "monstyle.css")
		
		// Define a style
		//$Txt_style:=".colored {fill: yellow; fill-opacity: 0.6; stroke: red; stroke-width:8; stroke-opacity: 0.6}"
		//SVG_Define_style ($Dom_SVG;$Txt_style)
		//SVG_Define_style ($Dom_svg;"#dev/monstyle.css")
		
		SVG_Define_linear_gradient($Dom_svg; "#BlockS"; "olive:70"; "palegreen:50")
		
		// Create a group and set a default style
		$Dom_g:=SVG_New_group($Dom_SVG)
		
		//SVG_SET_CLASS ($Dom_g;"colored")
		
		// Draw a rectangle
		$Dom_rect:=SVG_New_rect($Dom_g; 25; 30; 320; 240; 10; 10; ""; "")
		
		//SVG_SET_FILL_BRUSH ($Dom_rect;"url(#BlockS)")
		
		//SVGTool_SHOW_IN_VIEWER ($Dom_svg)
		
		//SVG_SAVE_AS_TEXT ($Dom_svg;Dossier systeme(Bureau)+"ACI0064988.svg")
		
		//$Dom_text:=SVG_New_textArea ($Dom_svg;"Hello world !\rIt's time to wake up\rAnother line for a test")
		//$Txt_buffer:=SVG_Get_text ($Dom_text)
		
		//SVG_SET_TEXTAREA_TEXT ($Dom_text;"Nouveau texte\ravec retour chariot")
		
		//______________________________________________________
End case 

//SVG_SAVE_AS_PICTURE ($Dom_svg;System folder(Desktop)+"DEV"+Folder separator+"test.svg";".svg")
//SVG_SAVE_AS_TEXT ($Dom_svg;System folder(Desktop)+"DEV"+Folder separator+"export.svg")

// View the result
SVGTool_SHOW_IN_VIEWER($Dom_svg)

// Don't forget to clear the memory
SVG_CLEAR($Dom_svg)

// ALERT(<>DOCUMENT)