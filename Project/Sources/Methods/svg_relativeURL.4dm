//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : svg_relativeURL
  // Database: 4D SVG
  // ID[CA4B53BAC56A4530BF2B9BF2D31BEB01]
  // Created 28-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Relative URL doesn't begin with sheme name and doesn't contains doamin name.
  // L'URL :
  //      {/}   base = Resources/SVG/
  //      ./    base = Resources/
  //      ../   base = database folder
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_POINTER:C301($1)

C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Txt_path;$Txt_resourcesPath;$Txt_URL)

If (False:C215)
	C_TEXT:C284(svg_relativeURL ;$0)
	C_POINTER:C301(svg_relativeURL ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	$Txt_URL:=$1->
	
	$Txt_resourcesPath:=Get 4D folder:C485(Current resources folder:K5:16;*)
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: ($Txt_URL="../@")  // base = database folder
		
		$Txt_URL:=Delete string:C232($Txt_URL;1;3)
		
		$Txt_path:=Get 4D folder:C485(Database folder:K5:14)\
			+Replace string:C233($Txt_URL;"/";Folder separator:K24:12)
		
		$Txt_URL:="../../"+$Txt_URL
		
		  //______________________________________________________
	: ($Txt_URL="/@")  // base = ~/Resources/SVG/
		
		  //be sure the folder SVG is present in the folder Resources
		CREATE FOLDER:C475($Txt_resourcesPath+"SVG"+Folder separator:K24:12;*)
		
		$Txt_URL:=Delete string:C232($Txt_URL;1;1)
		
		$Txt_path:=$Txt_resourcesPath+"SVG"+Folder separator:K24:12\
			+Replace string:C233($Txt_URL;"/";Folder separator:K24:12)
		
		  //______________________________________________________
	: ($Txt_URL="./@")  // base = ~/Resources/
		
		$Txt_URL:=Delete string:C232($Txt_URL;1;2)
		
		$Txt_path:=$Txt_resourcesPath\
			+Replace string:C233($Txt_URL;"/";Folder separator:K24:12)
		
		$Txt_URL:="../"+$Txt_URL
		
		  //______________________________________________________
	Else 
		
		$Txt_path:=$Txt_resourcesPath+"SVG"+Folder separator:K24:12\
			+Replace string:C233($Txt_URL;"/";Folder separator:K24:12)
		
		  //______________________________________________________
End case 

  // ----------------------------------------------------
  // Return

If (Test path name:C476($Txt_path)=Is a document:K24:1)
	
	$0:=$Txt_path
	$1->:=url_encode ($Txt_URL)
	
End if 

  // ----------------------------------------------------
  // End