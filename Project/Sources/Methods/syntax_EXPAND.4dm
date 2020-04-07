//%attributes = {"invisible":true,"preemptive":"incapable"}
  // ----------------------------------------------------
  // Project method : syntax_EXPAND
  // Database: 4D SVG
  // ID[3A7EDAFE4C014393BF97BBD93C908804]
  // Created #23-5-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_BOOLEAN:C305($1)

C_LONGINT:C283($bottom;$height;$l;$left;$Lon_parameters;$Lon_windowRef)
C_LONGINT:C283($right;$top;$width)

If (False:C215)
	C_BOOLEAN:C305(syntax_EXPAND ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0;"Missing parameter"))
	
	  // NO PARAMETERS REQUIRED
	$Lon_windowRef:=Current form window:C827
	
	If ($Lon_parameters>=1)
		
		$l:=Num:C11($1)
		(OBJECT Get pointer:C1124(Object named:K67:5;"collapse_expand"))->:=$l
		
	Else 
		
		$l:=(OBJECT Get pointer:C1124(Object named:K67:5;"collapse_expand"))->
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
If ($l=1)  // Expand
	
	OBJECT GET COORDINATES:C663(*;"help";$left;$top;$right;$bottom)
	$width:=$right
	
	FORM SET HORIZONTAL RESIZING:C892(True:C214)
	
	WA OPEN URL:C1020(*;"help";"about:blank")
	
	<>Lon_timerEvent:=10
	SET TIMER:C645(-1)
	
Else   // Collapse
	
	FORM GET PROPERTIES:C674("syntaxPalette";$width;$height)
	
	FORM SET HORIZONTAL RESIZING:C892(False:C215)
	
End if 

GET WINDOW RECT:C443($left;$top;$right;$bottom;$Lon_windowRef)
SET WINDOW RECT:C444($left;$top;$left+$width;$bottom;$Lon_windowRef)

  // ----------------------------------------------------
  // End