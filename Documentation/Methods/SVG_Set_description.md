# SVG_Set_description

>**SVG_Set_description** ( *parentSVGObject* ; *description* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| description | String | &#8594; | Text of comments |
| Function result | SVG_Ref | &#8592; | Reference of description |



#### Description 

The SVG\_Set\_description command sets a text for the SVG element designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG element, an error is generated.

A description is often used to insert a comment or explanatory text in the SVG code.

#### Example 

```4d
 $SVG:=SVG_New
 $g:=SVG_group($SVG)
 SVG_Set_title($g;"Company sales per region")
 SVG_Set_description($g;"Bar diagram of company sales per region.")
 
```

#### See also 

[SVG\_Set\_title](SVG%5FSet%5Ftitle.md)  