//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_SAVE_AS_PICTURE
  // Created 16/03/06
  // Framework SVgg
  // Author : Gérald Czwiklinski
  // ----------------------------------------------------
  // Modified by Vincent de Lachaux (16/06/08)
  // 2004 -> v11
  // ----------------------------------------------------
C_TEXT:C284($1)
C_TEXT:C284($2)
C_TEXT:C284($3)

C_LONGINT:C283($Lon_parameters)
C_PICTURE:C286($Pic_buffer)
C_TEXT:C284($Dom_buffer;$Dom_root;$Dom_svgObject;$kTxt_currentMethod;$Txt_buffer;$Txt_codec)
C_TEXT:C284($Txt_name;$Txt_patern;$Txt_pathname)

If (False:C215)
	C_TEXT:C284(SVG_SAVE_AS_PICTURE ;$1)
	C_TEXT:C284(SVG_SAVE_AS_PICTURE ;$2)
	C_TEXT:C284(SVG_SAVE_AS_PICTURE ;$3)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_SAVE_AS_PICTURE"  //Nom methode courante

If ($Lon_parameters>=2)
	
	$Dom_svgObject:=$1
	$Txt_pathname:=$2
	
	If (Length:C16($Txt_pathname)>0)
		
		If (Position:C15(Folder separator:K24:12;$Txt_pathname)=0)
			
			$Txt_pathname:=Get 4D folder:C485(Database folder:K5:14;*)+$Txt_pathname
			
		End if 
	End if 
	
	  //#ACI0093774 {
	  //$Txt_codec:="image/png"
	  //If ($Lon_parameters>=3)
	  //$Txt_codec:=$3
	  //End if
	If ($Lon_parameters>=3)
		
		$Txt_codec:=$3
		
	Else 
		
		  //get extension
		If (Length:C16($Txt_pathname)#0)
			
			  //ACI0098413
			  //change Txt_patern form: "(?mi-s)(\\.[^$]*)$" to "(?mi-s)(\\.[.]*)$"
			
			$Txt_patern:="(?mi-s)(\\.[.]*)$"
			ARRAY TEXT:C222($tTxt_result;0x0000)
			
			If (Rgx_ExtractText ($Txt_patern;$Txt_pathname;"1";->$tTxt_result)=0)
				
				$Txt_codec:=$tTxt_result{1}
				
			End if 
		End if 
	End if 
	
	$Txt_codec:=Choose:C955(Length:C16($Txt_codec)=0;"image/png";$Txt_codec)
	  //}
	
	$Dom_root:=DOM Get root XML element:C1053($Dom_svgObject)
	DOM GET XML ELEMENT NAME:C730($Dom_root;$Txt_name)
	
	If ($Txt_name="svg")
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		If (Test path name:C476($Txt_pathname)=Is a document:K24:1)
			
			DELETE DOCUMENT:C159($Txt_pathname)
			
		Else 
			
			OK:=1
			
		End if 
		
		If (OK=1)
			
			  //Turn_around #ACI0093875
			  //#ACI0093774 {
			  //SVG EXPORT TO PICTURE($Dom_svgObject;$Pic_buffer)
			DOM EXPORT TO VAR:C863($Dom_svgObject;$Txt_buffer)
			$Txt_buffer:=Replace string:C233($Txt_buffer;" xmlns=\"\"";"")
			$Dom_buffer:=DOM Parse XML variable:C720($Txt_buffer)
			CLEAR VARIABLE:C89($Txt_buffer)
			SVG EXPORT TO PICTURE:C1017($Dom_buffer;$Pic_buffer)
			DOM CLOSE XML:C722($Dom_buffer)
			  //}
			
			If (OK=1)
				
				WRITE PICTURE FILE:C680($Txt_pathname;$Pic_buffer;$Txt_codec)
				
				If (OK=1)
					
					  // If (Not(Is nil pointer(<>Ptr_Document)))
					  //<>Ptr_Document->:=DOCUMENT
					  // End if
					
					If (Num:C11(Storage:C1525.svg.variableDocument)>0)
						
						CALL WORKER:C1389(1;"fallBack_Not_thread_safe";New object:C1471(\
							"document";DOCUMENT))
						
					End if 
					
				Else 
					
					ASSERT:C1129(Component_putError (8858;$kTxt_currentMethod))  //Unknown error
					
				End if 
			End if 
		End if 
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError (8852;$kTxt_currentMethod))  //The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 