//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Set_error_handler
  // Created 17/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Sets the method to execute when the component encounters an
  // error. The previous error handler is returned.
  // ----------------------------------------------------
  // Syntax
  // SVG_Set_error_handler(inHandler) -> String
  // ----------------------------------------------------
  // Documentation
  // If you pass the name of an existing 4D method in inHandler, that method will
  // get called when an error occurs. The method must take two String parameters.
  // The ﬁrst parameter will contain a description of the error that occurred. The
  // second parameter will contain the name of the component method that was
  // called when the error occurred.
C_TEXT:C284($0)
C_TEXT:C284($1)

If (False:C215)
	C_TEXT:C284(SVG_Set_error_handler ;$0)
	C_TEXT:C284(SVG_Set_error_handler ;$1)
End if 

  // Note: You must set the "Shared" attribut for the  inhandler method.

  // Note If you put a TRACE statement at the end of your error handler method,
  // when an error occurs the 4D debugger will come up. If you then step one line,
  // you will be at the line after the one that caused the error.

  // Whether or not an error handler is set, whenever an error occurs the OK
  // variable is set to zero.

  // SVG_Set_error_handler returns the old handler so that you may dynamically change
  // the error handling within your code.
  // ----------------------------------------------------

Compiler_SVG 

$0:=Storage:C1525.svg.Host_Error_Method

Use (Storage:C1525.svg)
	
	If (Count parameters:C259>=1)
		
		Storage:C1525.svg.Host_Error_Method:=$1
		
	Else 
		
		Storage:C1525.svg.Host_Error_Method:=""
		
	End if 
End use 