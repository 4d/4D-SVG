//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Read_last_error
  // Created 17/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Returns (and clears) the last error number that occured.
  //
  //The command SVG_Read_last_error returns a number that represents the status of the last operation performed by 4D Draw.
  //
  //If SVG_Read_last_error equals 0, the last operation did not cause an error.
  //If SVG_Read_last_error does not equal 0, an error occurred during the last operation.
  //See Appendix C, Event Codes for a complete list of event codes.
  //
  //If the optional message parameter is passed to SVG_Read_last_error, it must be a pointer to a variable and will contain the text of the error after the call.
  //
  //SVG_Read_last_error could return a 4D error code if the error is a general database management error.
  // ----------------------------------------------------
C_LONGINT:C283($0)

If (False:C215)
	C_LONGINT:C283(SVG_Read_last_error ;$0)
End if 

Compiler_SVG 

$0:=SVG_Lon_Error