//%attributes = {"invisible":true,"shared":true,"preemptive":"incapable"}
// ----------------------------------------------------
// Method : SVGTool_SHOW_IN_VIEWER
// Created 01/10/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($root : Text; $page : Text)

var $sources : Text

Compiler_SVG

COMPILER_Not_Thread_Safe

DOM EXPORT TO VAR:C863($root; $sources)

If (<>sourceFontSize=0)
	
	PREFERENCES("viewerOptions"; -><>showColoredBackground; -><>backgroundColor; -><>automaticallyResize; -><>sourceFontSize)
	
End if 

<>SVG_viewerSource:=viewer_sources($sources)

Use (Storage:C1525.svg)
	
	Storage:C1525.svg.options:=Storage:C1525.svg.options ?- 0
	
	If (Count parameters:C259>=2)
		
		If ($page="sources")
			
			Storage:C1525.svg.options:=Storage:C1525.svg.options ?+ 0
			
		End if 
	End if 
End use 

Viewer_main