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
#DECLARE($esultPtr : Pointer) : Text

var $path; $resourcesPath; $url : Text

$url:=$esultPtr->
$resourcesPath:=Get 4D folder:C485(Current resources folder:K5:16; *)

Case of 
		
		//______________________________________________________
	: ($url="../@")  // Base = database folder
		
		$url:=Delete string:C232($url; 1; 3)
		
		$path:=Get 4D folder:C485(Database folder:K5:14)\
			+Replace string:C233($url; "/"; Folder separator:K24:12)
		
		$url:="../../"+$url
		
		//______________________________________________________
	: ($url="/@")  // Base = ~/Resources/SVG/
		
		// Be sure the folder SVG is present in the folder Resources
		CREATE FOLDER:C475($resourcesPath+"SVG"+Folder separator:K24:12; *)
		
		$url:=Delete string:C232($url; 1; 1)
		
		$path:=$resourcesPath+"SVG"+Folder separator:K24:12\
			+Replace string:C233($url; "/"; Folder separator:K24:12)
		
		//______________________________________________________
	: ($url="./@")  // Base = ~/Resources/
		
		$url:=Delete string:C232($url; 1; 2)
		
		$path:=$resourcesPath\
			+Replace string:C233($url; "/"; Folder separator:K24:12)
		
		$url:="../"+$url
		
		//______________________________________________________
	Else 
		
		$path:=$resourcesPath+"SVG"+Folder separator:K24:12\
			+Replace string:C233($url; "/"; Folder separator:K24:12)
		
		//______________________________________________________
End case 

If (Test path name:C476($path)=Is a document:K24:1)
	
	$esultPtr->:=url_encode($url)
	
	return $path
	
End if 