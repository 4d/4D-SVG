<!-- nodeReference := SVG_Filter_Offset ( parentReference ; dx ; dy ; in ; result )
 -> parentReference (Text)
 -> dx (Long Integer)
 -> dy (Long Integer)
 -> in (Text)
 -> result (Text)
 <- nodeReference (Text)-->
# SVG_Filter_Offset

> SVG_Filter_Offset ( filterRef ; dx {; dy {; input {; name}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| filterRef |     | SVG_Ref |     | ➡️ |     | Reference of filter |     |
| dx  |     | Longint |     | ➡️ |     | Offset on X axis |     |
| dy  |     | Longint |     | ➡️ |     | Offset on Y axis |     |
| input |     | String |     | ➡️ |     | Source of filter primitive |     |
| name |     | String |     | ➡️ |     | Target of filter primitive |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of primitive |     |

## Description

The SVG_Filter_Offset command sets an offset for the [filterRef](# "Reference of filter") filter and returns its reference. If [filterRef](# "Reference of filter") is not a filter reference, an error is generated.

The [dx](# "Offset on X axis") parameter is the value of the horizontal offset.

The optional [dy](# "Offset on Y axis") parameter is the value of the vertical offset.

The optional [input](# "Source of filter primitive") parameter identifies the graphic source of the filter primitive. You can pass:

* either "sourceGraphic", indicating that the graphic is the filter source (default),
* or "sourceAlpha", which indicates that the alpha channel is the filter source.

The optional [name](# "Target of filter primitive") is the name, if any, assigned to the result of this filter primitive.

**Note:** Starting with 4D v14 R5, this command works under Windows with Direct2D enabled in software mode (see the Direct2D software constant in the description of the [SET DATABASE PARAMETER](https://developer.4d.com/docs/Desktop/user-settings/#set-database-parameter-and-user-settings) command).

### Example  

In a form, we display two identical SVG pictures then we create an "offset" filter and assign to the one on the right:

```4d
 $root:=SVG_New (400;400;"filters test") // definition of first (left) picture  
 $rect:=SVG_New_rect ($root;10;10;380;100;0;0;"darkblue";"white";1)  
 SVG_SET_FILL_BRUSH ($root;"orange")  
 $textAreaRef:=SVG_New_textArea ($root;"Hello World!";10;10;380;100;"arial";60;Normal;Align center)  
 <>pict1:=SVG_Export_to_picture ($root) // display first picture  
   
 $root2:=SVG_New (400;400;"filters test") // definition of identical (right) picture  
 $rect2:=SVG_New_rect ($root2;10;10;380;100;0;0;"darkblue";"white";1)  
 SVG_SET_FILL_BRUSH ($root2;"orange")  
 $textAreaRef2:=SVG_New_textArea ($root2;"Hello World!";10;10;380;100;"arial";60;Normal;Align center)  
   
 $filter:=SVG_Define_filter ($root2;"Offset") // create filter  
 SVG_Filter_Offset ($filter;10;20)  
 SVG_SET_FILTER ($textAreaRef2;"Offset") // apply filter  
   
 <>pict2:=SVG_Export_to_picture ($root2) // display second picture
```

Result:

![](https://doc.4d.com/4Dv19/picture/1756614/pict1756614.fr.png)

## See also

[SVG_Filter_Blend](SVG_Filter_Blend.md)  
[SVG_Filter_Blur](SVG_Filter_Blur.md)
