# SVG_Post_comment

>**SVG_Post_comment** ( *svgObject* ; *comment* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | SVG object reference |
| comment | Text | &#x1F852; | Text to be added as a comment |
| Function result | SVG_Ref | &#x1F850; | Reference of comment |



#### Description 

The **SVG\_Post\_comment** adds the text passed in comment as an XML comment to the SVG object designated by the *svgObject* parameter.

The method returns the SVG reference of the comment. 

#### Example 

The following code:

\[#code4D\]C\_TEXT($comment)  
$comment:="Modified on "+String(Current date)  
$ref:= SVG\_Post\_comment ($svg; $comment )

.. adds the following to the $svg SVG object:

 <!--Modified on 12/12/2011-->\[#/codeXML\]
