<!-- SVG_SET_TEXT_LETTER_SPACING ( svgObject ; letterspacing ; unit )
 -> svgObject (Text)
 -> letterspacing (Real)
 -> unit (Text)-->
# SVG_SET_TEXT_LETTER_SPACING

> SVG_SET_TEXT_LETTER_SPACING ( svgObject ; spacing {; unit} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| spacing |     | Real |     | ➡️ |     | Letter spacing |     |
| unit |     | Text |     | ➡️ |     | Unit of value |     |

## Description

The SVG_SET_TEXT_LETTER_SPACING command is used to modify the letter spacing for the text object designated by [svgObject](# "Reference of text element") in addition to the spacing due to the 'kerning' property. If [svgObject](# "Reference of text element") is not an SVG text object, an error is generated.

The optional [unit](# "Unit of value") parameter is used to specify the unit of the spacing value. The default value is "%".

If [spacing](# "Letter spacing") is -1, the spacing value is set to 'normal'.

**See Also:** [http://www.w3.org/TR/SVG/text.html#LetterSpacingProperty](http://www.w3.org/TR/SVG/text.html#LetterSpacingProperty)

### Example  

Examples of spacing variations:  
![](https://doc.4d.com/4Dv19/picture/359244/pict359244.en.png)

```4d
  // Reference  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;40;"";36)  
   
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;80;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1)  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;120;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"em")  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;160;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"px")  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;200;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"pt")  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;240;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"pc")  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;280;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"mm")  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;320;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"cm")  
 $Dom_text:=SVG_New_text ($Dom_SVG;"Hello world !";20;360;"";36)  
 SVG_SET_TEXT_LETTER_SPACING ($Dom_text;1;"in")
```

## See also

[SVG_SET_TEXT_KERNING](SVG_SET_TEXT_KERNING.md)
