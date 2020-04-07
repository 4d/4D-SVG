//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : str_styledText
  // Database: labels
  // ID[9310DF7599B34B70A797327D9F97F20C]
  // Created #20-4-2015 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_BOOLEAN:C305($0)
C_TEXT:C284($1)

C_BOOLEAN:C305($Boo_styled)
C_LONGINT:C283($Lon_parameters)
C_TEXT:C284($Txt_textIn)

If (False:C215)
	C_BOOLEAN:C305(str_styledText ;$0)
	C_TEXT:C284(str_styledText ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	  // Required parameters
	$Txt_textIn:=$1
	
	  // Optional parameters
	If ($Lon_parameters>=2)
		
		  // <NONE>
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
  //#ACI0095430
$Txt_textIn:=Replace string:C233($Txt_textIn;"\n";"")

If (Length:C16($Txt_textIn)#0)
	
	  // Not thread-safe {
	  //$Txt_buffer:=ST Get plain text($Txt_textIn)
	  //}
	
	  //#ACI0100277
	  //$Txt_buffer:=$Txt_textIn
	  //If (0=Rgx_SubstituteText ("(?m-si)(<[^>]*>)";"";->$Txt_buffer;0))
	  //If (Length($Txt_buffer)#Length($Txt_textIn))
	  //$Boo_styled:=(Position($Txt_buffer;$Txt_textIn;*)#1)
	  //End if 
	  //End if 
	
	$Boo_styled:=Match regex:C1019("(?i-ms)<span [^>]*>";$Txt_textIn;1)
	
End if 

  // ----------------------------------------------------
  // Return
$0:=$Boo_styled

  // ----------------------------------------------------
  // End