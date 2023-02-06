<!-- SVG_SET_CLASS ( element ; class )
 -> element (Text)
 -> class (Text)-->
# SVG_SET_CLASS

> SVG_SET_CLASS ( svgObject ; class )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| class |     | Text |     | ➡️ |     | Name of class |     |

## Description

The SVG_SET_CLASS command sets the [class](# "Name of class") for the object passed in [svgObject](# "Reference of SVG element"). An error is generated if [svgObject](# "Reference of SVG element") is not a valid reference.

**See Also**: [http://www.w3.org/TR/SVG/styling.html#ClassAttribute](http://www.w3.org/TR/SVG/styling.html#ClassAttribute)

### Example  

Refer to the example for the [SVG_Define_style](SVG_Define_style.md) command.
