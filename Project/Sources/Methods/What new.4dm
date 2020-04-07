//%attributes = {}
/*  //17R6

SVG_SET_STROKE_VECTOR_EFFECT

*/

/*  //17R3

`All interface methods are Thread Safe

*/

/*  //15


/*===================================================================================================*/
% Modifications

SVG_New_text
SVG_SET_TEXTAREA_TEXT
/*
Now accepts styled text
*/

/*===================================================================================================*/
%New option
/* 

• New option (15) - don't add the default style attributes

The default value is OFF.

When the option is OFF the SVG_New_xxx commands adds the default attributes (fill & stroke) when there was not given as parameter.

with the code :*/
$Dom_rect:=SVG_New_rect ($Dom_svg;0;0;400;300)
$Dom_circle:=SVG_New_circle ($Dom_svg;10;10;10)

/*the generated XML will be:*/
<rect fill="white" height="300" stroke="black" width="400" x="0" y="0"/>
<circle cx="10" cy="10" fill="white" r="10" stroke="black"/>

/* When the option is ON the SVG_New_xxx commands don't adds these default attributes.
It's particularly interesting when using of the style sheets to produce a more compact code.

with the code :*/
SVG_SET_OPTIONS (SVG_Get_options  ?+ 15)
SVG_Define_style ($Dom_svg;"*{stroke:blue;fill:none}")
$Dom_rect:=SVG_New_rect ($Dom_svg;0;0;400;300)
$Dom_circle:=SVG_New_circle ($Dom_svg;10;10;10)

/*the generated XML will be:*/
<defs id="4D">
<style type="text/css">*{stroke:blue;fill:none}</style>
</defs>
<rect height="300" width="400" x="0" y="0"/>
<circle cx="10" cy="10" r="10"/>

*/

/*  //14

'add an option to disable some tests in the final version

/*===================================================================================================*/
%New commands

SVG_Get_named_color_value
/*
color := SVG_Get_named_color_value ( colorName ; what )
» colorName (Text) -  svg color name
» what (Text) - {what value} "r" or "g" or "v" or "b" for the color component, else long color
<- color (Long Integer)

Return the longint (default) value for a svg named color
If $2 is "r", "b" (or "v") or "g" return the red, blue or green color component
*/

SVG_SET_BRIGHTNESS
/*
SVG_SET_BRIGHTNESS ( svgObject ; Param_2;…;N )
» svgObject (Text)
» Param_2;…;N (Real)

Sets the brightness of an image or a container
2 parameters : $2 is the brightness factor to apply: < 1 for darken; > 1 for brighten
4 parameters : $2, $3 and $4 are used as values to define the matrix/
$1  0  0  0  0
0   $2 0  0  0
0   0  $3 0  0
0   0  0  1  0
*/

SVG_Filter_ColorMatrix
/*
*/


SVG_Get_class
/*
class := SVG_Get_class ( svgObject {; classesNamesArray })
» svgObject (Text)
» classesNamesArray (Pointer) - {array text} will be populated with all class names
<- class (Text)

//define 2 styles
SVG_Define_style ($Dom_SVG;".colored {fill: yellow; fill-opacity: 0.6; stroke: red; stroke-width:8; stroke-opacity: 0.6}")
SVG_Define_style ($Dom_svg;".blue{fill: blue}")

//Create a group and set a default style
$Dom_g:=SVG_New_group ($Dom_SVG)
SVG_SET_CLASS ($Dom_g;"colored blue")

ARRAY TEXT($tTxt_classes;0)
$Txt_buffer:=SVG_Get_class ($Dom_g;->$tTxt_classes)

// $Txt_buffer = "colored blue"
// $tTxt_classes{1} = "colored"
// $tTxt_classes{1} = "blue"
*/

SVG_Get_fill_brush
/*
fill := SVG_Get_fill_brush ( svgObject )
» svgObject (Text)
<- color (fill)
*/

SVG_FADE_TO_GREY_SCALE(svgObject )
/*
SVG_FADE_TO_GREY_SCALE ( svgObject {; value })
» svgObject (Text)
» value (Real) - {grey value}

Apply a filter to transform objects grayscale
If value is not passed, the transformation is made in accordance with the visual perception of the luminance
(30% red, 59% green and 11% blue)
*/

SVG_ROTATION_CENTERED
/*
SVG_ROTATION_CENTERED ( svgObject ; angle )
» svgObject (Text)
» angle (Real)

Perform a centered rotation (for an object with x, y, width and height attribute)
*/

SVG_SCALLING_CENTERED
/*
SVG_SCALLING_CENTERED ( svgObject ; scale {; X ; Y })
» svgObject (Text)
» scale (Real)
» X (Real) -  {x} (middle)
» Y (Real) -  {y} (middle)

Perform a centered scalling of the object 
scale > 0
1 = 100% 
*/



/*===================================================================================================*/

%New option
/* 
• New option (12) - Parameter control

The default value is ON.

When your code is completed and tested, you can set this option to OFF to disable the control of the parameters. So the execution will be accelerated.
The gain is about 30%.


• New option (13) allow to automatically treat the spaces in text objects to allow displaying multiple adjacent spaces.

The default value is OFF.

Example:
$Txt_buffer:="abc      def"
$Dom_text:=SVG_New_textArea ($Dom_svg;$Txt_buffer;50;50)

will be displayed as "abc def"

SVG_SET_OPTIONS (SVG_Get_options  ?+ 13)  //preserve spaces in text objects
$Txt_buffer:="abc      def"
$Dom_text:=SVG_New_textArea ($Dom_svg;$Txt_buffer;50;50)

will be displayed as "abc      def"


• New option (14) Centered rotation

The default value is "OFF". This is the pre-v14 comportement.
When this option is set to ON, The command SVG_SET_TRANSFORM_ROTATE 
try to perform a centered rotation when the 3rd and 4th parameter are not given.
The center of rotation is calculated from x, y, the width & the height. 
If the object referenced doesn't have these attributes, the rotation is performed around the point (0,0)

The default value is OFF.
*/

/*===================================================================================================*/
% Modifications

SVGTool_SHOW_IN_VIEWER
/*
now accept an optional second parameter which must be "sources" if you want open the viewer directly 
on the source page
*/

SVG_New_image
SVG_Define_style
/* 
Management of relative URLs

The commands that could reference external files like SVG_New_image or SVG_Define_style
now accepts relative URL. 

A relative URL can begin with:

"/"      the base will be the folder "~/Resources/SVG/"
"./"     the base will be the folder "~/Resources/"
"../"    the base will be the database folder

So you can now reference external files with a relative path.
This is particularly important in client / server when files are in the resources' folder

Example:

SVG_New_image ($Dom_svg;"./images/picture.png";10;10)  
//base is the folder "Resources"
//The xml code will be xlink:href="../images/picture.png"

SVG_New_image ($Dom_svg;"../picture.png";70;180)  
//base is the database's folder
//The xml code will be xlink:href="../../picture.png"

SVG_New_image ($Dom_svg;"/sample pictures/picture.png";110;90;100;100)  
//base is the folder "SVG" in the folder "Resources"
//The xml code will be xlink:href="sample%20pictures/picture.gif"

*/

SVG_Define_linear_gradient
/*
Now accepts optional $7 and $8 (or $11 & $12 if values are passed for x1, y1, x2 et y2) numeric parameters to set the offset of respectively the start color and the stop color.

You can pass indifferently a real value lower than 1 or  a longint value between 0 and 100 to set the percent value.
i.e. 0.1 or 10 will be interpreted as 10%

A negative value for the "start offset" will be interpreted as 0% and for the "stop offset" as 100%

The values greater than 100% will be interpreted as 100%

$Dom_node:=SVG_Define_linear_gradient ($Dom_svg;"clicked";"black:50";"black:20";-90;"reflect";0;80)
will give the definition :

<linearGradient id="clicked" spreadMethod="reflect" x1="0" x2="0" y1="1" y2="0">
<stop offset="0%" stop-color="black" stop-opacity="0.5"/>
<stop offset="80%" stop-color="black" stop-opacity="0.2"/>
</linearGradient>

*/

*/

/*  //13

/*===================================================================================================*/
%New commands
SVG_SET_DOCUMENT_VARIABLE (Pointer)   
`You can call this method only once per session (in an init method for example) 
`passing as a parameter a pointer to a variable (typically the Document variable) 
`which will be updated after each call to the command SVG_SAVE_AS_PICTURE
`Pass a nil pointer if you want to stop the link

SVG_Define_style_with_arrays (svgObject; namesArrayPointer; valuesArrayPointer {; className {; type {; media {; title }}}})
`Allow style definition with  2 text arrays attribute's names and attribute's values.
`If the svgObjectReference is the root the style is defined as a style element in the def section (Internal Style Sheet). In this case the className parameter is mandatory (error if not)

`The line "SVG_Define_style_with_arrays ($Root->$tTxt_attributeNames;->$tTxt_attributeValues;"title")" will give:
`<defs id="4D">
`     <style type="text/css">.title{fill:black;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;}</style>
`</defs>

`The style will be attributed to an element with SVG_SET_CLASS ( $elementRef ; "title")

`If the svgObjectReference is an element the style is defined as a style attribute for this element (Inline Style). 

`The line "SVG_Define_style_with_arrays ($elementRef; ->$tTxt_attributeNames; ->$tTxt_attributeValues)" will give:
`  <element style="fill:black;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;"…>…</element>

SVG_SET_SATURATION (svgObject; saturation)
`svgObject must be a container (svg, g, symbol, pattern,marker, …) or an image. Error if not
`saturation (LONGINT) 0 -> 100

SVG_SET_HUE (svgObject; hue)
`svgObject must be a container (svg, g, symbol, pattern,marker, …) or an image. Error if not
`hue (LONGINT) 0 -> 360

SVG_ADD_NAMESPACE ( svg_ref ; prefix {; URI })
' Add xmlns attribute to the root of the DOM tree (xmlns:prefix="URI")
' If svg_ref is not the reference of an element "svg" the attribute is added to the root of the tree.
' prefix could be a constant :
'        svgNS for the standard SVG namespace. (http://www.w3.org/2000/svg)
'        xlinkNS for the standard XLink namespace. (http://www.w3.org/1999/xlink)

SVG_Get_root_reference '(svg_ref)
`Retrieve the root SVG element

/*===================================================================================================*/
% Modifications
SVG_SAVE_AS_PICTURE 
`Now populates the variable declared with the command SVG_SET_DOCUMENT_VARIABLE if any

SVG_SAVE_AS_TEXT
`If the second parameter is omitted, or is an empty string (""), a standard new file dialog box appears.
`Now populates the variable declared with the command SVG_SET_DOCUMENT_VARIABLE if any

SVG_Define_linear_gradient `Now accept 
`$6 = spreadMethod (TEXT- optional)  value must be in ['pad', 'reflect' , 'repeat']
`$7, $8, $9, $10 = x1, y1, x2, y2 (REAL - optional) to define the gradient's vectors

SVG_SET_MARKER (svgObject ; url {; position} ) 
`If the url is "none" or is equal to empty string the marker is removed

SVG_CLEAR '( { SVG_Ref } )
' If SVG_Ref is not the root of the document and SVG_Ref is a valid reference of an object, the object is deleted

SVG_New_tspan
' can now is used with textArea elements

SVG_New_textArea 'alternative syntax
'SVG_New_textArea($Dom_svg;"Hello World !"; x ; y ; width ; height ; style_definition)
' style definition is for exemple "{font-size:48px;fill:red;}" and will be addedc as a sttyle attribute like style="font-size:48px;fill:red;"
' any extra parameters are in this case ignored

SVG_New_textArea
' Support for styled text : If a 4D styled text is passed as text, the style is converted to be displayed in the textArea

SVG_New_tspan 'alternative syntax
'SVG_New_tspan($Dom_svg;"Hello World !"; x ; y ; style_definition)
' style definition is for exemple "{font-size:48px;fill:red;}" and will be addedc as a sttyle attribute like style="font-size:48px;fill:red;"
' any extra parameters are in this case ignored

SVG_New_text 'alternative syntax
'SVG_New_text($Dom_svg;"Hello World !"; x ; y ; style_definition)
' style definition is for exemple "{font-size:48px;fill:red;}" and will be addedc as a sttyle attribute like style="font-size:48px;fill:red;"
' any extra parameters are in this case ignored


/*===================================================================================================*/
% 4DPop
`Viewer now accept opening svgz

*/

/*  //12.2

%Fix  
`ACI0070028

%Modifications
`Add the option 11 to fix the shape rendering to crispEdges at the creation of a new document       

%New commands

SVG_Post_comment ("DomReference"; "TextComment" ) -> DomReference

*/

/*  //12.1

%Fix  

%Modifications
SVG_New_embedded_image `Accept a 5th optional parameter as text to fix the codec to use (default is ".png")
       

%New commands

SVG_Post_comment ("DomReference"; "TextComment" ) -> DomReference

*/

/*  //12.0 HF2

%Fix
    `ACI0066590 
    `ACI0066665

%Modifications
       

%New commands

*/

/*  //12.0 HF1

%Fix
    `ACI0064199   

%Modifications
       

%New commands

*/

/*  //12

%Modifications
       SVG_New_textArea 'now  treats the carriage returns as elements "tbreak"'

%New commands

SVG_Append_data_tag
       SVG_PROCESS_DATA_TAG

       SVG_Define_style
       SVG_Define_clip_Path
SVG_Define_pattern

       SVG_SET_CLASS
       SVG_SET_CLIP_PATH

SVG_SET_STROKE_DASHARRAY
SVG_SET_FILL_RULE
SVG_SET_STROKE_MITERLIMIT
SVG_SET_SHAPE_RENDERING

SVG_SET_TEXT_KERNING
SVG_SET_TEXT_LETTER_SPACING
SVG_SET_WRITING_MODE
SVG_APPEND_TEXT_TO_TEXTAREA
SVG_SET_TEXT_RENDERING       

       SVG_SET_DEFAULT_ENCODING
SVG_Get_default_encoding

SVG_DELETE_OBJECT

//       SVG_Define_gradient_l_by_arrays
//       SVG_Define_gradient_r_by_arrays

*/

/*  //12 beta 1

'Compiled for v12'

*/

/*  //11.4 HF4

'ACI0062694'

*/

/*  //11.4 

SVG_SET_DIMENSIONS 'now accept '%' as unit'

SVG_SET_STROKE_WIDTH 'now accepts a third optional argument : unit'
"'Value must be in the list 'in, em, ex, px, pt, pc, cm, mm, or %'. If not, an error is generated''

SVG_PATH_ARC "now accept a 7th parameter to set the rotation way.
"see "http://www.w3.org/TR/2002/WD-SVG11-20020215/paths.html#PathDataEllipticalArcCommands"
"large-arc-flag and sweep-flag
"0 = 0,1 (time)
"1 = 1,0 (trigo)
"2 = 0,0 
"3 = 1,1

"The optional parameter 'strokeWidth' for drawing commands is a real value (rather than a long integer)

*/