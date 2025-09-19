# SVG_SET_ID

>**SVG_SET_ID** ( *svgObject* ; *id* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| id | String | &#x1F852; | ID to assign to object |



#### Description 

The SVG\_SET\_ID command can be used to set the ‘ID’ property of the SVG object having the *svgObject* reference. If this attribute already exists, its value is replaced by the value passed in the parameter.

The object id is used to reference an object. This reference will then be recovered using the *SVG\_Get\_ID* command. The id is also used by the 4D *SVG Find element ID by coordinates* command (see the 4D documentation).

#### Example 

```4d
 $svg:=SVG_New
 $object:=SVG_New_rect($svg;10;10;200;200;0;0;"black";" white";2)
 SVG_SET_ID($object;"border")
```

#### See also 

[SVG\_Find\_ID](SVG%5FFind%5FID.md)  
[SVG\_Get\_ID](SVG%5FGet%5FID.md)  