//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method: SVG_ROTATION_CENTERED
// Created 19/02/13 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($dom : Text; $angle : Real)

Compiler_SVG

Component_errorHandler("init"; "SVG_ROTATION_CENTERED")

Case of 
		
		// ______________________________________________________
	: (Not:C34(xml_referenceValid($dom)))  // The reference is not a svg object
		
		ASSERT:C1129(Component_putError(8852; "SVG_SET_TEXT_ANCHOR"))
		
		return 
		
		// ______________________________________________________
	: (Count parameters:C259<2)  // Parameters Missing
		
		ASSERT:C1129(Component_putError(8850; "SVG_SET_TEXT_ANCHOR"))
		
		return 
		
		// ______________________________________________________
End case 

// Get the current value of transform attribute if any
Component_errorHandler("ERROR_OFF")

var $transform : Text
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "transform"; $transform)

If (Bool:C1537(OK))
	
	var $start:=Position:C15("rotate("; $transform)
	
	If ($start>0)
		
		var $end:=Position:C15(")"; $transform; $start+1)
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
var $name : Text
var $cx; $cy : Real

DOM GET XML ELEMENT NAME:C730($dom; $name)

Case of 
		
		//______________________________________________________
	: ($name="ellipse")\
		 | ($name="circle")
		
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "cx"; $cx)
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "cy"; $cy)
		
		//______________________________________________________
	Else 
		
		var $x : Integer
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "x"; $x)
		var $width : Integer
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "width"; $width)
		$cx:=$x+($width/2)
		
		var $y : Integer
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "y"; $y)
		var $height : Integer
		DOM GET XML ATTRIBUTE BY NAME:C728($dom; "height"; $height)
		$cy:=$y+($height/2)
		
		//______________________________________________________
End case 

Component_errorHandler("ERROR_ON")

$transform+="rotate("+String:C10($angle; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")"

DOM SET XML ATTRIBUTE:C866($dom; "transform"; $transform)

ASSERT:C1129(Component_errorHandler("deinit"))
