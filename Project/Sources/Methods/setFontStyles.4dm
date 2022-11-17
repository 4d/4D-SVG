//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($target : Text; $style : Integer)

If (False:C215)
	C_TEXT:C284(setFontStyles; $1)
	C_LONGINT:C283(setFontStyles; $2)
End if 

var $c : Collection

// Mark:font-weight
If ($style ?? 0)
	
	DOM SET XML ATTRIBUTE:C866($target; \
		"font-weight"; "bold")
	
End if 

// Mark:font-style
If ($style ?? 1)
	
	DOM SET XML ATTRIBUTE:C866($target; \
		"font-style"; "italic")
	
End if 

// Mark:text-decoration
$c:=New collection:C1472

If ($style ?? 2)  // Underline
	
	$c.push("underline")
	
End if 

If ($style ?? 3)  // Line-through
	
	$c.push("line-through")
	
End if 

If ($c.length>0)
	
	DOM SET XML ATTRIBUTE:C866($target; \
		"text-decoration"; $c.join(" "))
	
End if 