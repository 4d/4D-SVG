<!-- SVG_SET_TRANSFORM_FLIP ( svgObject ; vertical ; horizontal )
 -> svgObject (Text)
 -> vertical (Boolean)
 -> horizontal (Boolean)-->
# SVG_SET_TRANSFORM_FLIP

> SVG_SET_TRANSFORM_FLIP ( svgObject ; horizontal {; vertical} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| horizontal |     | Boolean |     | ➡️ |     | Horizontal flip |     |
| vertical |     | Boolean |     | ➡️ |     | Vertical flip |     |

## Description

The SVG_SET_TRANSFORM_FLIP command can be used to apply a horizontal andHome.mdor vertical flip to an SVG object having the [svgObject](# "Reference of SVG element") reference.

If the [horizontal](# "Horizontal flip") parameter is set to True, a horizontal flip is applied.  
If the [vertical](# "Vertical flip") parameter is set to True, a vertical flip is applied.

### Example  

Flipping of a text object:  
![](..Home.md..Home.mdpictureHome.md194228Home.mdpict194228.en.png)
 

```4d
 svgRef:=SVG_New   
 [SVG_SET_VIEWBOX](SVG_SET_VIEWBOX.md) (svgRef;0;0;400;200)  
 $tx:=SVG_New_text (svgRef;"4D";10;0;"";96)  
 [SVG_SET_FONT_COLOR](SVG_SET_FONT_COLOR.md) ($tx;"blue") 
```

Change the color 
```4d 
 &[NBSP](ASCII-Codes.302-6103210.en.html "NBSP");  
  
```
Effect: 
```4d
 $tx:=SVG_New_text (svgRef;"4D";10;0;"";96) 
```

Take the same text  
```4d
 SVG_SET_FONT_COLOR ($tx;"lightblue")

```
 Change the color  
```4d
 SVG_SET_TRANSFORM_FLIP($tx;True) 
```

Apply a vertical flip  
```4d
 SVG_SET_TRANSFORM_SKEW ($tx;-10)

```
Incline  
```4d
 SVG_SET_TRANSFORM_TRANSLATE ($tx;-17;-193) 
```

Reposition

```

```4d


  
  

## See also 

[SVG_SET_TRANSFORM_SKEW](SVG_SET_TRANSFORM_SKEW.md)
