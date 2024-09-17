<!-- SVG_SET_FONT_FAMILY ( svgObject ; Param_2 ; … ; N )
 -> svgObject (Text)
 -> Param_2 ; … ; N (Text)-->
# SVG_SET_FONT_FAMILY

> SVG_SET_FONT_FAMILY ( svgObject ; font {; font2 ; ... ; fontN} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| font |     | String |     | ➡️ |     | Font name |     |

## Description

The SVG_SET_FONT_FAMILY command can be used to specify the font for the SVG object having the [svgObject](## "Reference of SVG element") reference. If [svgObject](## "Reference of SVG element") does not reference a valid element, an error is generated.

The [font](## "Font name") parameter contains the name of the font to be used. When several names are passed, the command automatically builds the list of font family names and/or generic family names.

### Example  

Passing several font names:

```4d
 SVG_SET_FONT_FAMILY (svgObject;"Lucida grande";"Sans-serif")  
  //  will build the following list: " 'Lucida grande' 'Sans-serif'"
```
