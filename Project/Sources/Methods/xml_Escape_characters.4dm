//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : xml_Escape_characters
// Database: 4D SVG
// ID[65529C66F0BD4ADB99224E368FD6C504]
// Created #25-1-2017 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Encode special characters
// Ampersand (&) is escaped to &amp;
// Double quotes (") are escaped to &quot;
// Single quotes (') are escaped to &apos;
// Less than (<) is escaped to &lt;
// Greater than (>) is escaped to &gt;
// ----------------------------------------------------
#DECLARE($in : Text) : Text

var $out : Text:=$in

$out:=Replace string:C233($out; "&"; "&amp;")
$out:=Replace string:C233($out; "\""; "&quot;")
$out:=Replace string:C233($out; "'"; "&apos;")
$out:=Replace string:C233($out; "<"; "&lt;")
$out:=Replace string:C233($out; ">"; "&gt;")

return $out