//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Define_style
  // Created 30/11/09 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)
C_TEXT:C284($4)
C_TEXT:C284($5)

C_BOOLEAN:C305($Boo_inline;$Boo_link)
C_LONGINT:C283($Lon_i;$Lon_parameters;$Lon_platform)
C_TEXT:C284($Dom_buffer;$Dom_defs;$Dom_doc;$Dom_root;$Dom_style;$kTxt_currentMethod)
C_TEXT:C284($Txt_ID;$Txt_instruction;$Txt_media;$Txt_path;$Txt_style;$Txt_svgObject)
C_TEXT:C284($Txt_title;$Txt_type;$Txt_URL;$Txt_volume)

If (False:C215)
	C_TEXT:C284(SVG_Define_style ;$0)
	C_TEXT:C284(SVG_Define_style ;$1)
	C_TEXT:C284(SVG_Define_style ;$2)
	C_TEXT:C284(SVG_Define_style ;$3)
	C_TEXT:C284(SVG_Define_style ;$4)
	C_TEXT:C284(SVG_Define_style ;$5)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Define_style"  //Nom methode courante

  // ----------------------------------------------------

If ($Lon_parameters>=2)
	
	$Txt_svgObject:=$1
	$Txt_style:=$2
	
	$Txt_type:="text/css"
	
	If ($Lon_parameters>=3)
		
		$Txt_type:=Choose:C955(Length:C16($3)>0;$3;$Txt_type)
		
		If ($Lon_parameters>=4)
			
			$Txt_media:=Choose:C955(Length:C16($4)>0;$4;$Txt_media)
			
			If ($Lon_parameters>=5)
				
				$Txt_title:=$5
				
			End if 
		End if 
	End if 
	
	Component_errorHandler ("init";$kTxt_currentMethod)
	
	Case of 
			
			  //……………………………………………………………………………
		: ($Txt_style[[1]]=".")\
			 & ($Txt_style[[2]]#".")\
			 & ($Txt_style[[2]]#"/")
			
			  //……………………………………………………………………………
		: ($Txt_style[[1]]="#")\
			 | ($Txt_style="file://@")  //Relative path in the resources folder.
			
			$Boo_link:=True:C214
			
			If ($Txt_URL="file://@")
				
				If ($Lon_platform=Windows:K25:3)
					
					  //file:///C:\Users\vdelachaux\Desktop\bild.4dbase\resources\Pictures\\XC-EG-i.png
					$Txt_URL:=Replace string:C233($Txt_URL;"file:///";"";1)
					
				Else 
					
					  //file:///Volumes/Macintosh HD/Images/banner.svg
					$Txt_URL:=Replace string:C233($Txt_URL;"file://";"";1)
					
				End if 
				
				$Txt_path:=Replace string:C233(Replace string:C233($Txt_URL;"/Volumes/";"";1);"/";Folder separator:K24:12)
				
				If ($Txt_path[[1]]=Folder separator:K24:12)  //"file:///Users/banner.svg" -> :Users:banner.svg
					
					  // Get the boot volume
					$Txt_volume:=System folder:C487  //"Macintosh_HD:System:"
					
					For ($Lon_i;1;Length:C16($Txt_volume);1)
						
						If ($Txt_volume[[$Lon_i]]=":")
							
							$Txt_volume:=Substring:C12($Txt_volume;1;$Lon_i-1)
							$Lon_i:=MAXLONG:K35:2-1
							
						End if 
					End for 
					
					$Txt_path:=$Txt_volume+$Txt_path  //-> Macintosh_HD:Users:banner.svg
					
				End if 
				
			Else 
				
				$Txt_URL:=Delete string:C232($Txt_URL;1;1)
				
				$Txt_path:=Get 4D folder:C485(Current resources folder:K5:16;*)\
					+Replace string:C233($Txt_URL;"/";Folder separator:K24:12)
				
			End if 
			
			$Boo_link:=(Test path name:C476($Txt_path)=Is a document:K24:1)
			
			If ($Boo_link)
				
				$Txt_URL:="file://"\
					+Choose:C955($Lon_platform=Windows:K25:3;"/";"")\
					+Convert path system to POSIX:C1106($Txt_path;*)
				
			Else 
				
				$Txt_url:=""
				
			End if 
			
			  //……………………………………………………………………………
		: ($Txt_style="http@")  //URL
			
			$Boo_link:=True:C214
			
			$Txt_URL:=$Txt_style
			
			  //……………………………………………………………………………
		: (Test path name:C476($Txt_style)=Is a document:K24:1)
			
			$Boo_link:=True:C214
			
			$Txt_URL:="file://"\
				+Choose:C955($Lon_platform=Windows:K25:3;"/";"")\
				+Convert path system to POSIX:C1106($Txt_style;*)
			
			  //……………………………………………………………………………
		Else   //Relative path
			
			$Txt_path:=svg_relativeURL (->$Txt_style)
			
			$Boo_link:=(Test path name:C476($Txt_path)=Is a document:K24:1)
			
			$Txt_URL:=Choose:C955($Boo_link;$Txt_style;"")
			
			  //……………………………………………………………………………
	End case 
	
	  //determine if it is an inline style
	$Dom_root:=DOM Get root XML element:C1053($Txt_svgObject)
	$Boo_inline:=($Dom_root#$Txt_svgObject)
	
	If ($Boo_inline & Not:C34($Boo_link))
		
		If (Position:C15("{";$Txt_style)=1)  //Embedded style
			
			$Txt_style:=Replace string:C233(Substring:C12($Txt_style;2);"}";"")
			
		End if 
		
		DOM SET XML ATTRIBUTE:C866($Txt_svgObject;\
			"style";$Txt_style)
		
	Else 
		
		  //find the 'defs' node...
		$Dom_defs:=DOM Find XML element:C864($Dom_root;"svg/defs")
		
		  //...create it if it does not exist.
		If (OK=0)
			
			$Dom_defs:=DOM Create XML element:C865($Dom_root;"defs")
			
		End if 
		  //}
		
		If (OK=1)
			
			$Dom_style:=DOM Find XML element by ID:C1010($Dom_defs;$Txt_ID)
			
			If (OK=1)  //Delete the existing symbol
				
				DOM REMOVE XML ELEMENT:C869($Dom_style)
				
			End if 
			
			  //Create the style
			If (Length:C16($Txt_url)>0)
				
				  //Then define the attribute
				DOM SET XML ATTRIBUTE:C866($Dom_root;\
					"xmlns:xlink";"http://www.w3.org/1999/xlink")
				
				$Dom_doc:=DOM Get XML document ref:C1088($Dom_root)
				
				  //<?xml-stylesheet href="file://localhost/Users/vdl/Desktop/monstyle.css" type="text/css"?>
				$Txt_instruction:="xml-stylesheet type=\"text/css\" href=\""+$Txt_url+"\""
				
				$Dom_buffer:=DOM Append XML child node:C1080($Dom_doc;XML processing instruction:K45:9;$Txt_instruction)
				
			Else 
				
				$Dom_style:=DOM Create XML element:C865($Dom_defs;"style";\
					"type";$Txt_type)
				
				If (OK=1)
					
					DOM SET XML ELEMENT VALUE:C868($Dom_style;$Txt_style)
					
					If (OK=1)\
						 & (Length:C16($Txt_media)>0)
						
						ARRAY TEXT:C222($tTxt_medias;0x0000)
						COLLECTION TO ARRAY:C1562(Storage:C1525.svg["media"];$tTxt_medias)
						
						If (Find in array:C230($tTxt_medias;$Txt_media)>0)
							
							DOM SET XML ATTRIBUTE:C866($Dom_style;\
								"media";$Txt_media)
							
						Else 
							
							ASSERT:C1129(Component_putError (8853;$kTxt_currentMethod))  //Invalid Value for an Attribute
							
						End if 
						
						  //#ACI0091143
						CLEAR VARIABLE:C89($tTxt_medias)
						
					End if 
					
					If (OK=1)\
						 & (Length:C16($Txt_title)>0)
						
						DOM SET XML ATTRIBUTE:C866($Dom_style;\
							"title";$Txt_title)
						
					End if 
				End if 
			End if 
			
			If (OK=1)
				
				$0:=$Dom_style
				
			End if 
		End if 
	End if 
	
	ASSERT:C1129(Component_errorHandler ("deinit"))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 