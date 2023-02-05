<!-- SVG_SET_TEXT_ANCHOR ( svgObject ; fontAlignment )
 -> svgObject (Text)
 -> fontAlignment (Long Integer)-->
# SVG_SET_TEXT_ANCHOR

> SVG_SET_TEXT_ANCHOR ( svgObject ; alignment )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| alignment |     | Integer |     | ➡️ |     | Alignment |     |

## Description

The SVG_SET_TEXT_ANCHOR command can be used to modify the alignment of the SVG object having the [svgObject](# "Reference of SVG element") reference. If [svgObject](# "Reference of SVG element") does not reference a valid element, an error is generated.

In the [alignment](# "Alignment") parameter, you must pass one of the following values:

> 1 = Align default (left)  
> 2 = Align left  
> 3 = Center  
> 4 = Align right  
> 5 = Justify (only for textArea object)

## See also

[SVG_New_textArea](SVG_New_textArea.md)
