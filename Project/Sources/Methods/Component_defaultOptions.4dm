//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Component_defaultOptions
// Created 23/09/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
var $0 : Integer

If (False:C215)
	C_LONGINT:C283(Component_defaultOptions; $0)
End if 

$0:=0 ?- 1  //Do not automatically assign ID
$0:=$0 ?- 2  //Do not automatically close objects
$0:=$0 ?+ 3  //With background
$0:=$0 ?+ 4  //Absolute coordinate
$0:=$0 ?- 5  //Not indented
$0:=$0 ?+ 6  //BEEP on error
$0:=$0 ?- 7  //Install error-catching method
$0:=$0 ?+ 8  //Image transparente
$0:=$0 ?- 9  //trigonometric origin

// Added by Vincent de Lachaux (18/03/10)
$0:=$0 ?+ 10  //Substitute 'Arial Unicode MS' to 'Arial'
$0:=$0 ?- 11  //Default Shape-rendering to 'crispEdges'

// Added by Vincent de Lachaux (11/04/12)
$0:=$0 ?+ 12  //Parameter control is ON

$0:=$0 ?- 13  //xml:space="preserve" turn around is OFF

$0:=$0 ?- 14  //centered rotation is OFF

// #18-3-2015
$0:=$0 ?- 15  //don't add default style attributes

// #21-7-2016
$0:=$0 ?+ 16  //add the "xlink:href" by default