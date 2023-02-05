<!-- Text := SVG_Post_comment ( svgObject ; comment )
 -> svgObject (Text)
 -> comment (Text)-->
# SVG_Post_comment

> SVG_Post_comment ( svgObject ; comment ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| comment |     | Text |     | ➡️ |     | Text to be added as a comment |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of comment |     |

## Description

The **SVG_Post_comment** adds the text passed in comment as an XML comment to the SVG object designated by the [svgObject](# "SVG object reference") parameter.

The method returns the SVG reference of the comment.

### Example  

The following code:

\[#code4D\]C_TEXT($comment)  
$comment:="Modified on "+String(Current date)  
$ref:= SVG_Post_comment ($svg; $comment )

.. adds the following to the $svg SVG object:

    &lt;!--Modified on 12Home.md12Home.md2011--&gt;\[#Home.mdcodeXML\]
