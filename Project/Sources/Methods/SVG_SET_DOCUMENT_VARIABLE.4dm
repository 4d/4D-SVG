//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_SET_DOCUMENT_VARIABLE
  // ID[1A51D838737E4FDDA68ACD563FBBE97F]
  // Created 14/04/11 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // SVG_SET_DOCUMENT_VARIABLE (Pointer)
  // Allows to record a pointer to the variable of the host database that will be updated after a call to  SVG_SAVE_AS_PICTURE or SVG_SAVE_AS_TEXT
  // You can call this method only once per session (in an init method for example)
  // Pass a variable's pointer as a parameter (typically the Document variable)
  // which will be updated after each call to the command SVG_SAVE_AS_PICTURE or SVG_SAVE_AS_TEXT
  // Pass a nil pointer if you want to stop the link
  // ----------------------------------------------------
  // Declarations
C_POINTER:C301($1)

C_LONGINT:C283($Lon_parameters;$Lon_state)

If (False:C215)
	C_POINTER:C301(SVG_SET_DOCUMENT_VARIABLE ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;Get localized string:C991("error_missingParameter")))
	
	CALL WORKER:C1389(1;"fallBack_Not_thread_safe";New object:C1471(\
		"set";$1))
	
	$Lon_state:=Num:C11(Storage:C1525.svg.variableDocument)
	
	Repeat 
		
		DELAY PROCESS:C323(Current process:C322;10)
		IDLE:C311
		
	Until ($Lon_state#Num:C11(Storage:C1525.svg.variableDocument))
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  // Argument missing
	
End if 

  // ----------------------------------------------------
  // End