# SVG_SET_TRANSFORM_FLIP

>**SVG_SET_TRANSFORM_FLIP** ( *svgObject* ; *horizontal* {; *vertical*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| horizontal | Boolean | &#8594; | Horizontal flip |
| vertical | Boolean | &#8594; | Vertical flip |



#### Description 

The SVG\_SET\_TRANSFORM\_FLIP command can be used to apply a horizontal and/or vertical flip to an SVG object having the *svgObject* reference.

If the *horizontal* parameter is set to True, a horizontal flip is applied.  
If the *vertical* parameter is set to True, a vertical flip is applied.

#### Example 

Flipping of a text object:  
![](../images/pict194228.en.png)

```4d
 svgRef:=SVG_New
 SVG_SET_VIEWBOX(svgRef;0;0;400;200)
 $tx:=SVG_New_text(svgRef;"4D";10;0;"";96)
 SVG_SET_FONT_COLOR($tx;"blue") //Change the color
 &NBSP;
  //Effect:
 $tx:=SVG_New_text(svgRef;"4D";10;0;"";96) //Take the same text
 SVG_SET_FONT_COLOR($tx;"lightblue") // Change the color
 SVG_SET_TRANSFORM_FLIP($tx;True) //Apply a vertical flip
 SVG_SET_TRANSFORM_SKEW($tx;-10) //Incline
 SVG_SET_TRANSFORM_TRANSLATE($tx;-17;-193) //Reposition
```

#### See also 

[SVG\_SET\_TRANSFORM\_SKEW](SVG_SET_TRANSFORM_SKEW.md)  