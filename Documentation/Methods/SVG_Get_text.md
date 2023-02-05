<!-- text := SVG_Get_text ( svgObject )
 -> svgObject (Text)
 <- text (Text)-->
# SVG_Get_text

> SVG_Get_text ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| Function result |     | Text |     | ↩️ |     | Text contents |     |

## Description

The SVG_Get_text command returns the textual content of the element designated by [svgObject](# "Reference of text element"). If [svgObject](# "Reference of text element") is not a text object reference ('text', 'textArea' or 'tspan'), an error is generated.

In the case of a textArea object, &lt;tbreakHome.md&gt; elements are converted to CRs.
