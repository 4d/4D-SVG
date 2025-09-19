# SVG_Open_picture

>**SVG_Open_picture** ( *picture* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| picture | Picture | &#8594; | 4D picture field or variable |
| Function result | SVG_Ref | &#8592; | Reference of SVG document |



#### Description 

The SVG\_Open\_picture command analyzes an SVG picture and returns an SVG reference for this picture. If *picture* does not contain an SVG picture, the command returns an empty string.

**Important:** Once you no longer need it, remember to call the *SVG\_CLEAR* command with this reference in order to free up the memory.

#### Example 

```4d
 READ PICTURE FILE("";$picture)
 If(OK=1)
    $ref:=SVG_Open_picture($picture)
    ...
    SVG_CLEAR($ref)
 End if
```

#### See also 

[SVG\_Export\_to\_picture](SVG%5FExport%5Fto%5Fpicture.md)  