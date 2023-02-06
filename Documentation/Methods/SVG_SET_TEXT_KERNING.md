<!-- SVG_SET_TEXT_KERNING ( svgObject ; kerning ; unitIdentifier )
 -> svgObject (Text)
 -> kerning (Real)
 -> unitIdentifier (Text)-->
# SVG_SET_TEXT_KERNING

> SVG_SET_TEXT_KERNING ( svgObject ; kerning {; unit} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| kerning |     | Real |     | ➡️ |     | Letter spacing |     |
| unit |     | Text |     | ➡️ |     | Unit of spacing value |     |

## Description

The [SVG_Get_text](SVG_Get_text.md)  command is used to modify the kerning for the text object designated by [svgObject](## "Reference of text element"). If [svgObject](## "Reference of text element") is not an SVG text object, an error is generated.

The optional [unit](## "Unit of spacing value") parameter is used to specify the unit of the kerning value. The default value is "%".

If [kerning](## "Letter spacing") is -1, the kerning value is set to 'auto'.

**Note:** Under Windows, the implementation is limited to text from left to right and top to bottom (disabled for right to left text) and to the 'text' and 'tspan' elements; under Mac OS, support is not limited.

**See Also:** [http://www.w3.org/TR/SVG/text.html#KerningProperty](http://www.w3.org/TR/SVG/text.html#KerningProperty)

### Example  

Examples of kerning variations:  
![](https://doc.4d.com/4Dv19/picture/359232/pict359232.en.png)

```4d
  // Reference  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;40;"";36)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;80;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;0,5)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;120;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;1)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;160;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;1,5)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;200;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;2)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;240;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;1,5)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;280;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;1)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;320;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;0,5)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;360;"";36)  
 SVG_SET_TEXT_KERNING ($Dom_text;0)
```

## See also

[SVG_SET_TEXT_LETTER_SPACING](SVG_SET_TEXT_LETTER_SPACING.md)
