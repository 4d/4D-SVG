<!-- SVG_SET_TEXT_WRITING_MODE ( svgObject ; writingMode )
 -> svgObject (Text)
 -> writingMode (Text)-->
# SVG_SET_TEXT_WRITING_MODE

> SVG_SET_TEXT_WRITING_MODE ( svgObject ; writingMode )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| writingMode |     | Text |     | ➡️ |     | Direction of writing |     |

## Description

The SVG_SET_TEXT_WRITING_MODE command is used to set whether the writing direction for the text object designated by [svgObject](# "Reference of text element") will be left to right, right to left or bottom to top. If [svgObject](# "Reference of text element") is not an SVG text object, an error is generated.

The [writingMode](# "Direction of writing") parameter can have one of the following values: "lr-tb", "rl-tb", "tb-rl", "lr", "rl", "tb" or "inherit ". Otherwise, an error is generated.

### Example  

Writing from right to left:  
![](..Home.md..Home.mdpictureHome.md359263Home.mdpict359263.en.png)

```4d
  // Frame  
 [SVG_New_rect](SVG_New_rect.md) ($Dom_SVG;5;5;210;310;0;0;"blue";"none")  
   
  // Text  
 $Dom_text:=SVG_New_textArea ($Dom_SVG;$Txt_sample;10;10;200;300;"Baghdad 'Arial Unicode MS'";25)  
 [SVG_SET_TEXT_WRITING_MODE](SVG_SET_TEXT_WRITING_MODE.md) ($Dom_text;"rl")
```
