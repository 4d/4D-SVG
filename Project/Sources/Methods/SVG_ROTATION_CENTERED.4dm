//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method: SVG_ROTATION_CENTERED
// Created 19/02/13 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($dom : Text; $angle : Real)

If (False:C215)
	C_TEXT:C284(SVG_ROTATION_CENTERED; $1)
	C_REAL:C285(SVG_ROTATION_CENTERED; $2)
End if 

var $cx; $cy : Real
var $name; $transform : Text
var $end; $height; $Lon_y; $start; $width; $x : Integer

Compiler_SVG

If (Count parameters:C259>=2)
	
	If (Asserted:C1132(xml_referenceValid($dom); Get localized string:C991("error_badReference")))
		
		Component_errorHandler("init"; "SVG_ROTATION_CENTERED")
		
		// Get the current value of transform attribute if any
		Component_errorHandler("ERROR_OFF")
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "transform"; $transform)
		
		If (Bool:C1537(OK))
			
			$start:=Position:C15("rotate("; $transform)
			
			If ($start>0)
				
				$end:=Position:C15(")"; $transform; $start+1)
				$transform:=Delete string:C232($transform; $start; $end-$start+1)
				
			End if 
			
			If (Length:C16($transform)>0)
				
				If ($transform[[1]]=" ")
					
					$transform:=Substring:C12($transform; 2)
					
				End if 
				
				If (Length:C16($transform)>0)
					
					$transform+=" "
					
				End if 
			End if 
		End if 
		
		// Mark:ACI0100389
		DOM GET XML ELEMENT NAME:C730($dom; $name)
		
		Case of 
				
				//______________________________________________________
			: ($name="ellipse")\
				 | ($name="circle")
				
				DOM GET XML ATTRIBUTE BY NAME:C728($dom; "cx"; $cx)
				DOM GET XML ATTRIBUTE BY NAME:C728($dom; "cy"; $cy)
				
				//______________________________________________________
			Else 
				
				DOM GET XML ATTRIBUTE BY NAME:C728($dom; "x"; $x)
				DOM GET XML ATTRIBUTE BY NAME:C728($dom; "width"; $width)
				$cx:=$x+($width/2)
				
				DOM GET XML ATTRIBUTE BY NAME:C728($dom; "y"; $Lon_y)
				DOM GET XML ATTRIBUTE BY NAME:C728($dom; "height"; $height)
				$cy:=$Lon_y+($height/2)
				
				//______________________________________________________
		End case 
		
		Component_errorHandler("ERROR_ON")
		
		$transform+="rotate("+String:C10($angle; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")"
		
		DOM SET XML ATTRIBUTE:C866($dom; \
			"transform"; $transform)
		
		ASSERT:C1129(Component_errorHandler("deinit"))
		
	Else 
		
		ASSERT:C1129(Component_putError(8852; "SVG_ROTATION_CENTERED"))  // The reference is not a svg object
		
	End if 
	
Else 
	
	ASSERT:C1129(Component_putError(8850; "SVG_ROTATION_CENTERED"))  // Parameters Missing
	
End if 