//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method: SVG_New_image
// Date et heure : 16/03/06, 10:07:53
// Framework SVgg
// Author : Gérald Czwiklinski
// ----------------------------------------------------
// Modified by Vincent de Lachaux (01/07/08)
// 2004 -> v11
// ----------------------------------------------------
// Modified by Vincent de Lachaux (09/10/08)
// Add picture lib
// ----------------------------------------------------
// Modified 27-2-2013 by Vincent de Lachaux
// add url svg: management
// ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_REAL:C285($4)
C_REAL:C285($5)
C_REAL:C285($6)

C_BLOB:C604($Blb_Buffer)
C_BOOLEAN:C305($Boo_link)
C_LONGINT:C283($Lon_i; $Lon_parameters; $Lon_platform)
C_PICTURE:C286($Pic_Buffer)
C_REAL:C285($Num_height; $Num_heightPicture; $Num_left; $Num_top; $Num_width; $Num_widthPicture)
C_TEXT:C284($kTxt_currentMethod; $Txt_Buffer; $Txt_nodeReference; $Txt_parentReference; $Txt_path; $Txt_rootReference)
C_TEXT:C284($Txt_URL; $Txt_volume)

If (False:C215)
	C_TEXT:C284(SVG_New_image; $0)
	C_TEXT:C284(SVG_New_image; $1)
	C_TEXT:C284(SVG_New_image; $2)
	C_REAL:C285(SVG_New_image; $3)
	C_REAL:C285(SVG_New_image; $4)
	C_REAL:C285(SVG_New_image; $5)
	C_REAL:C285(SVG_New_image; $6)
End if 

Compiler_SVG

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_New_image"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Txt_parentReference:=$1
	
	$Txt_URL:=$2
	
	_O_PLATFORM PROPERTIES:C365($Lon_platform)
	
	$Num_width:=-1
	$Num_height:=-1
	
	If ($Lon_parameters>=3)
		
		$Num_left:=$3
		$Num_top:=$4
		
		If ($Lon_parameters>=6)
			
			$Num_width:=$5
			$Num_height:=$6
			
		End if 
	End if 
	
	If (Asserted:C1132(xml_referenceValid($Txt_parentReference); Get localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; $kTxt_currentMethod)
		
		Case of 
				
				//…………………………………………………………………………………………………………………………………………………………………………………………………………………………………
			: ($Txt_URL[[1]]="#")\
				 | ($Txt_URL="file://@")  //absolute path (# is for resources' folder)
				
				$Boo_link:=True:C214
				
				If ($Txt_URL="file://@")
					
					If ($Lon_platform=Windows:K25:3)
						
						//file:///C:\Users\vdelachaux\Desktop\bild.4dbase\resources\Pictures\XC-EG-i.png
						$Txt_URL:=Replace string:C233($Txt_URL; "file:///"; ""; 1)
						
					Else 
						
						//file:///Volumes/Macintosh HD/Images/banner.svg
						$Txt_URL:=Replace string:C233($Txt_URL; "file://"; ""; 1)
						
					End if 
					
					$Txt_path:=Replace string:C233(Replace string:C233($Txt_URL; "/Volumes/"; ""; 1); "/"; Folder separator:K24:12)
					
					If ($Txt_path[[1]]=Folder separator:K24:12)  //"file:///Users/banner.svg" -> :Users:banner.svg
						
						// Get the boot volume
						$Txt_volume:=System folder:C487  //"Macintosh_HD:System:"
						
						For ($Lon_i; 1; Length:C16($Txt_volume); 1)
							
							If ($Txt_volume[[$Lon_i]]=":")
								
								$Txt_volume:=Substring:C12($Txt_volume; 1; $Lon_i-1)
								$Lon_i:=MAXLONG:K35:2-1
								
							End if 
						End for 
						
						$Txt_path:=$Txt_volume+$Txt_path  //-> Macintosh_HD:Users:banner.svg
						
					End if 
					
				Else 
					
					$Txt_URL:=Delete string:C232($Txt_URL; 1; 1)
					
					$Txt_path:=Get 4D folder:C485(Current resources folder:K5:16; *)\
						+Replace string:C233($Txt_URL; "/"; Folder separator:K24:12)
					
				End if 
				
				OK:=Num:C11(Test path name:C476($Txt_path)=Is a document:K24:1)
				
				//get width & height of the picture
				If (OK=1)\
					 & (($Num_width=-1)\
					 | ($Num_height=-1))
					
					READ PICTURE FILE:C678($Txt_path; $Pic_Buffer)
					
					If (OK=1)
						
						PICTURE PROPERTIES:C457($Pic_Buffer; $Num_widthPicture; $Num_heightPicture)
						$Pic_Buffer:=$Pic_Buffer*0
						
						If ($Num_width=-1)
							
							$Num_width:=$Num_widthPicture
							
						End if 
						
						If ($Num_height=-1)
							
							$Num_height:=$Num_heightPicture
							
						End if 
					End if 
				End if 
				
				If (OK=1)
					
					$Txt_URL:="file://"\
						+Choose:C955($Lon_platform=Windows:K25:3; "/"; "")\
						+Convert path system to POSIX:C1106($Txt_path; *)
					
				End if 
				
				//…………………………………………………………………………………………………………………………………………………………………………………………………………………………………
			: ($Txt_URL="?@")\
				 | ($Txt_URL="pictlib:@")  //Image de la bibliothèque
				
				//$Txt_URL:=Choose($Txt_URL="pictlib:@";Replace string($Txt_URL;"pictlib:";"";1);Delete string($Txt_URL;1;1))
				//GET PICTURE FROM LIBRARY(Num($Txt_URL);$Pic_Buffer)
				//If (OK=1)
				//CONVERT PICTURE($Pic_Buffer;"JPEG")
				//End if
				//If (OK=1)
				//PICTURE PROPERTIES($Pic_Buffer;$Num_widthPicture;$Num_heightPicture)
				//If ($Num_width=-1)
				//$Num_width:=$Num_widthPicture
				//End if
				//If ($Num_height=-1)
				//$Num_height:=$Num_heightPicture
				//End if
				//End if
				
				ASSERT:C1129(Component_putError(8860; Current method name:C684))  //The reference is not a svg object
				
				//…………………………………………………………………………………………………………………………………………………………………………………………………………………………………
			: ($Txt_URL="http@")\
				 & ($Lon_parameters<6)  //URL but without width and/or height
				
				$Boo_link:=True:C214
				
				ASSERT:C1129(Component_putError(8850; Current method name:C684))  //Parameters Missing
				
				//…………………………………………………………………………………………………………………………………………………………………………………………………………………………………
			: ($Txt_URL="http@")
				
				$Boo_link:=True:C214
				
				//__________________________________________________________________________________________
			Else   //Relative path
				
				$Txt_path:=svg_relativeURL(->$Txt_URL)
				
				OK:=Num:C11(Test path name:C476($Txt_path)=Is a document:K24:1)
				
				//get width & height of the picture
				If (OK=1)
					
					$Boo_link:=True:C214
					
					If (($Num_width=-1)\
						 | ($Num_height=-1))
						
						READ PICTURE FILE:C678($Txt_path; $Pic_Buffer)
						
						If (OK=1)
							
							PICTURE PROPERTIES:C457($Pic_Buffer; $Num_widthPicture; $Num_heightPicture)
							$Pic_Buffer:=$Pic_Buffer*0
							
							If ($Num_width=-1)
								
								$Num_width:=$Num_widthPicture
								
							End if 
							
							If ($Num_height=-1)
								
								$Num_height:=$Num_heightPicture
								
							End if 
						End if 
					End if 
				End if 
				
				//……………………………………………………………………………
		End case 
		
		If (OK=1)
			
			//Add the xmlns:link {
			$Txt_rootReference:=DOM Get root XML element:C1053($Txt_parentReference)
			DOM SET XML ATTRIBUTE:C866($Txt_rootReference; \
				"xmlns:xlink"; "http://www.w3.org/1999/xlink")  //}
			
			If ($Boo_link)
				
				$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference; "image"; \
					"xlink:href"; Replace string:C233($Txt_URL; " "; "%20"); \
					"x"; $Num_left; \
					"y"; $Num_top; \
					"width"; $Num_width; \
					"height"; $Num_height)
				
			Else 
				
				PICTURE PROPERTIES:C457($Pic_Buffer; $Num_width; $Num_height)
				
				//Encode in base64{
				PICTURE TO BLOB:C692($Pic_Buffer; $Blb_Buffer; ".png")
				
				If (OK=1)
					
					//BASE64 ENCODE($Blb_Buffer)
					//If (OK=1)
					//$Txt_Buffer:=BLOB to text($Blb_Buffer;Mac text without length)
					//End if
					BASE64 ENCODE:C895($Blb_Buffer; $Txt_Buffer)
					
				End if   //}
				
				If (OK=1)
					
					$Txt_nodeReference:=DOM Create XML element:C865($Txt_parentReference; "image"; \
						"xlink:href"; "data:;base64,"+$Txt_Buffer; \
						"x"; $Num_left; \
						"y"; $Num_top; \
						"width"; $Num_width; \
						"height"; $Num_height)
					
				End if 
			End if 
		End if 
		
		If (OK=1)
			
			$0:=$Txt_nodeReference
			
			//Set the id {
			If (Storage:C1525.svg.options ?? 1)
				
				DOM SET XML ATTRIBUTE:C866($Txt_nodeReference; \
					"id"; $Txt_nodeReference)
				
			End if   //}
		End if 
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; Current method name:C684))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; Current method name:C684))  //Parameters Missing
	
End if 