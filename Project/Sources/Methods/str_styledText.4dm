//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Project method : str_styledText
// Database: labels
// ID[9310DF7599B34B70A797327D9F97F20C]
// Created #20-4-2015 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($in : Text) : Boolean

// #ACI0095430
$in:=Replace string:C233($in; "\n"; "")

If (Length:C16($in)=0)
	
	return 
	
End if 

return Match regex:C1019("(?i-ms)<span [^>]*>"; $in; 1)