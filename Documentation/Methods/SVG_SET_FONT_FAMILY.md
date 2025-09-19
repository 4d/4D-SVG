# SVG_SET_FONT_FAMILY

>**SVG_SET_FONT_FAMILY** ( *svgObject* ; *font* {; *font2* ; ... ; *fontN*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| font | String | &#8594; | Font name |



#### Description 

The SVG\_SET\_FONT\_FAMILY command can be used to specify the font for the SVG object having the *svgObject* reference. If *svgObject* does not reference a valid element, an error is generated.

The *font* parameter contains the name of the font to be used. When several names are passed, the command automatically builds the list of font family names and/or generic family names.

#### Example 

Passing several font names:

```4d
 SVG_SET_FONT_FAMILY(svgObject;"Lucida grande";"Sans-serif")
  // will build the following list: " 'Lucida grande' 'Sans-serif'"
```
