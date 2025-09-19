# SVG_APPEND_TEXT_TO_TEXTAREA

>**SVG_APPEND_TEXT_TO_TEXTAREA** ( *svgObject* ; *addedText* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of text element |
| addedText | Text | &#8594; | Text to be added |



#### Description 

The SVG\_APPEND\_TEXT\_TO\_TEXTAREA command is used to append text to the textual content of the text object designated by *svgObject*. If *svgObject* is not a "textArea" object, an error is generated. 

Line return characters are automatically replaced by "<tbreak/>" elements. 

#### Example 

Adding the following text:  
![](../images/pict359222.en.png)

```4d
  //Display outlines using 'rect' element
 $Dom_rect:=SVG_New_rect($Dom_SVG;10;10;500;200;0;0;"blue:50";"none")
 
  //Creating the text
 $Dom_text:=SVG_New_textArea($Dom_SVG;"It is today, ";10;30;500;200;"'Arial'";36;0;3)
 
  //Adding the date and 2 CR
 SVG_APPEND_TEXT_TO_TEXTAREA($Dom_text;String(Current date)+"\r\r")
 
  //Lastly, adding the current time
 SVG_APPEND_TEXT_TO_TEXTAREA($Dom_text;"and it was exactly "+String(Current time))
```

#### See also 

[SVG\_New\_textArea](SVG_New_textArea.md)  
[SVG\_SET\_TEXTAREA\_TEXT](SVG_SET_TEXTAREA_TEXT.md)  