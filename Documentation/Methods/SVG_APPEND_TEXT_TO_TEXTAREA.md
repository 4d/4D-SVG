<!-- SVG_APPEND_TEXT_TO_TEXTAREA ( svgObject ; text )
-> svgObject (Text)
-> text (Text) - String to write-->
# SVG_APPEND_TEXT_TO_TEXTAREA

> SVG_APPEND_TEXT_TO_TEXTAREA ( svgObject ; addedText )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| addedText |     | Text |     | ➡️ |     | Text to be added |     |

## Description

The SVG_APPEND_TEXT_TO_TEXTAREA command is used to append text to the textual content of the text object designated by [svgObject](# "Reference of text element"). If [svgObject](# "Reference of text element") is not a "textArea" object, an error is generated.

Line return characters are automatically replaced by "&lt;tbreak/&gt;" elements.

### Example  

Adding the following text:  
![](https://doc.4d.com/4Dv19/picture/359222/pict359222.en.png)

```4d
  // Display outlines using 'rect' element  
 $Dom_rect:=SVG_New_rect ($Dom_SVG;10;10;500;200;0;0;"blue:50";"none")  
   
  // Creating the text  
 $Dom_text:=SVG_New_textArea ($Dom_SVG;"It is today, ";10;30;500;200;"'Arial'";36;0;3)  
   
  // Adding the date and 2 CR  
 SVG_APPEND_TEXT_TO_TEXTAREA ($Dom_text;String(Current date)+"\r\r")  
   
  // Lastly, adding the current time  
 SVG_APPEND_TEXT_TO_TEXTAREA ($Dom_text;"and it was exactly "+String(Current time))
```

## See also

[SVG_New_textArea](SVG_New_textArea.md)  
[SVG_SET_TEXTAREA_TEXT](SVG_SET_TEXTAREA_TEXT.md)
