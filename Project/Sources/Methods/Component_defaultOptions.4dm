//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Component_defaultOptions
// Created 23/09/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE() : Integer

var $options : Integer

$options:=0 ?- 1  //Do not automatically assign ID
$options:=$options ?- 2  //Do not automatically close objects
$options:=$options ?+ 3  //With background
$options:=$options ?+ 4  //Absolute coordinate
$options:=$options ?- 5  //Not indented
$options:=$options ?+ 6  //BEEP on error
$options:=$options ?- 7  //Install error-catching method
$options:=$options ?+ 8  //Image transparente
$options:=$options ?- 9  //trigonometric origin

// Added by Vincent de Lachaux (18/03/10)
$options:=$options ?+ 10  //Substitute 'Arial Unicode MS' to 'Arial'
$options:=$options ?- 11  //Default Shape-rendering to 'crispEdges'

// Added by Vincent de Lachaux (11/04/12)
$options:=$options ?+ 12  //Parameter control is ON

$options:=$options ?- 13  //xml:space="preserve" turn around is OFF

$options:=$options ?- 14  //centered rotation is OFF

// #18-3-2015
$options:=$options ?- 15  //don't add default style attributes

// #21-7-2016
$options:=$options ?+ 16  //add the "xlink:href" by default

return $options