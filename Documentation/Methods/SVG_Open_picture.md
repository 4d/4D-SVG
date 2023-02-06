<!-- rootReference := SVG_Open_picture ( picture )
 -> picture (Picture)
 <- rootReference (Text)-->
# SVG_Open_picture

> SVG_Open_picture ( picture ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| picture |     | Picture |     | ➡️ |     | 4D picture field or variable |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of SVG document |     |

## Description

The SVG_Open_picture command analyzes an SVG picture and returns an SVG reference for this picture. If [picture](# "4D picture field or variable") does not contain an SVG picture, the command returns an empty string.

**Important:** Once you no longer need it, remember to call the [SVG_CLEAR](SVG_CLEAR.md)  command with this reference in order to free up the memory.

### Example  

```4d
 READ PICTURE FILE("";$picture)  
 If(OK=1)  
    $ref:=SVG_Open_picture ($picture)  
    ...  
    SVG_CLEAR ($ref)  
 End if
```

## See also

[SVG_Export_to_picture](SVG_Export_to_picture.md)
