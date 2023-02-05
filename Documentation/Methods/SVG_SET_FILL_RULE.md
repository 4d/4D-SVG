<!-- SVG_SET_FILL_RULE ( element ; fileRule )
 -> element (Text)
 -> fileRule (Text)-->
# SVG_SET_FILL_RULE

> SVG_SET_FILL_RULE ( svgObject ; fillRule )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| fillRule |     | Text |     | ➡️ |     | Mode for filling object |     |

## Description

The SVG_SET_FILL_RULE command is used to specify the fill rule for the SVG object designated by [svgObject](# "Reference of SVG element"). An error is generated if [svgObject](# "Reference of SVG element") is not a valid reference.

The [fillRule](# "Mode for filling object") parameter must contain one of the following values: "nonzero", "evenodd" or "inherit". Otherwise, an error is generated.

**See Also:** [www.w3.orgHome.mdTRHome.mdSVGHome.mdpainting.html#FillRuleProperty](www.w3.orgHome.mdTRHome.mdSVGHome.mdpainting.html#FillRuleProperty)

### Example  

Illustration of filling modes:  
![](..Home.md..Home.mdpictureHome.md359095Home.mdpict359095.en.png)

```4d
  //Creating a path with the 'evenodd' fill rule  
 $Dom_path:=SVG_New_path ($Dom_SVG;250;75)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($Dom_path;323;301;131;161;369;161;177;301)  
 [SVG_PATH_CLOSE](SVG_PATH_CLOSE.md) ($Dom_path)  
 [SVG_SET_FILL_BRUSH](SVG_SET_FILL_BRUSH.md) ($Dom_path;"red")  
 [SVG_SET_STROKE_WIDTH](SVG_SET_STROKE_WIDTH.md) ($Dom_path;3)  
 [SVG_SET_FILL_RULE](SVG_SET_FILL_RULE.md) ($Dom_path;"evenodd")  
   
  //Creating a similar object with the 'nonzero' fill rule  
 $Dom_path:=SVG_New_path ($Dom_SVG;250;75)  
 [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md) ($Dom_path;323;301;131;161;369;161;177;301)  
 [SVG_PATH_CLOSE](SVG_PATH_CLOSE.md) ($Dom_path)  
 [SVG_SET_FILL_BRUSH](SVG_SET_FILL_BRUSH.md) ($Dom_path;"red")  
 SVG_SET_STROKE_WIDTH"($Dom_path;3)  
 SVG_SET_FILL_RULE($Dom_path;"nonzero")  
  //Horizontal movement  
 SVG_SET_TRANSFORM_TRANSLATE($Dom_path;300)
```
