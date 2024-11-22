<!-- svgReference := SVG_Set_description ( svgObject ; description )
 -> svgObject (Text)
 -> description (Text)
 <- svgReference (Text)-->
# SVG_Set_description

> SVG_Set_description ( parentSVGObject ; description ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| description |     | String |     | ➡️ |     | Text of comments |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of description |     |

## Description

The SVG_Set_description command sets a text for the SVG element designated by [parentSVGObject](## "Reference of parent element") and returns its reference. If [parentSVGObject](## "Reference of parent element") is not an SVG element, an error is generated.

A description is often used to insert a comment or explanatory text in the SVG code.

### Example  

```4d
 $SVG:=SVG_New   
 $g:=SVG_group($SVG)  
 SVG_Set_title ($g;"Company sales per region")  
 SVG_Set_description ($g;"Bar diagram of company sales per region.")  
 
```

## See also

[SVG_Set_title](SVG_Set_title.md)
