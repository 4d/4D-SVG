<!-- nodeReference := SVG_Filter_Blend ( parentReference ; in ; in2 ; mode ; result )
 -> parentReference (Text)
 -> in (Text)
 -> in2 (Text)
 -> mode (Text)
 -> result (Text)
 <- nodeReference (Text)-->
# SVG_Filter_Blend

> SVG_Filter_Blend ( filterRef ; picture ; backgroundPict {; mode {; name}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| filterRef |     | SVG_Ref |     | ➡️ |     | Reference of filter |     |
| picture |     | String |     | ➡️ |     | Picture source |     |
| backgroundPict |     | String |     | ➡️ |     | Background picture source |     |
| mode |     | String |     | ➡️ |     | Mixing mode |     |
| name |     | String |     | ➡️ |     | Target of filter primitive |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of primitive |     |

## Description

The SVG_Filter_Blend command sets a blend filter for the [filterRef](# "Reference of filter") filter and returns its reference. If [filterRef](# "Reference of filter") is not a filter reference, an error is generated.

This filter is made up of two sources, [backgroundPict](# "Background picture source") and [picture](# "Picture source"), with the help of the mixing modes currently used by the imaging software.

The optional [mode](# "Mixing mode") parameter can be used to set the combination mode of the pixels used for the blend (see the specification). Its value must be: "normal" (default value), "multiply", "screen", "darken" or "lighten".

The optional [name](# "Target of filter primitive") parameter is the name, if any, assigned to the result of this filter primitive.

**Note:** Starting with 4D v14 R5, this command works under Windows with Direct2D enabled in software mode (see the Direct2D software constant in the description of the [SET DATABASE PARAMETER](https://developer.4d.com/docs/Desktop/user-settings/#set-database-parameter-and-user-settings) command).

### Example  

In a form, we display two identical SVG pictures then we create a "blend" filter and assign to the one on the right. This filter is a combination of the "offset" and "blur" filters:

```4d
 $root:=SVG_New (400;400;"filters test") // definition of first (left) picture  
 $rect:=SVG_New_rect ($root;10;10;380;100;0;0;"darkblue";"white";1)  
 SVG_SET_FILL_BRUSH ($root;"orange")  
 $textAreaRef:=SVG_New_textArea ($root;"Hello World!";10;10;380;100;"arial";60;Normal;Align center)  
 <>pict1:=SVG_Export_to_picture ($root) // display first picture  
   
 $root2:=SVG_New (400;400;"filters test") // definition of identical (right) picture  
   
  // create filter  
 $filter:=SVG_Define_filter ($root2;"MyShadow")  
 $vGraph:=True // applied on graphic layer - pass False to apply to the alpha layer  
 If($vGraph)  
    $ref1:=SVG_Filter_Blur ($filter;2;"sourceGraphic";"blurResult") // "blurResult" will be used as the "input" of the offset filter  
 Else  
    $ref1:=SVG_Filter_Blur ($filter;2;"sourceAlpha";"blurResult") // "blurResult" will be used as the "input" of the offset filter  
 End if  
  // Adding offset filter  
 $ref2:=SVG_Filter_Offset ($filter;5;5;"blurResult";"alphaBlurOffset")  
  // Adding blend filter  
 $ref3:=SVG_Filter_Blend ($filter;"sourceGraphic";"alphaBlurOffset";"normal";"finalFilter";)  
   
 $rect2:=SVG_New_rect ($root2;10;10;380;100;0;0;"darkblue";"white";1)  
 SVG_SET_FILL_BRUSH ($root2;"orange")  
 $textAreaRef2:=SVG_New_textArea ($root2;"Hello World!";10;10;380;100;"arial";60;Normal;Align center)  
   
 SVG_SET_FILTER ($textAreaRef2;"MyShadow") // apply final filter  
 <>pict2:=SVG_Export_to_picture ($root2) // display second picture
```

Result (blur input filter = sourceGraphic):

![](https://doc.4d.com/4Dv19/picture/1756656/pict1756656.fr.png)

Result (blur input filter = sourceAlpha):

![](https://doc.4d.com/4Dv19/picture/1756654/pict1756654.fr.png)

## See also

[SVG_Filter_Blur](SVG_Filter_Blur.md)  
[SVG_Filter_Offset](SVG_Filter_Offset.md)
