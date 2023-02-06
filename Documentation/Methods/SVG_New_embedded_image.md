<!-- nodeReference := SVG_New_embedded_image ( parentReference ; image ; left ; top ; codec )
 -> parentReference (Text)
 -> image (Picture)
 -> left (Real) - default is 0
 -> top (Real) - default is 0
 -> codec (Text) - default is .png
 <- nodeReference (Text)-->
# SVG_New_embedded_image

> SVG_New_embedded_image ( parentSVGObject ; picture {; x {; y}}{; codec} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| picture |     | Picture |     | ➡️ |     | Picture to be embedded |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of upper left corner |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of upper left corner |     |
| codec |     | Text |     | ➡️ |     | Codec to use |     |
| Function result |     | SVG_Ref |     | ↩️ |     | SVG object reference |     |

## Description

The **SVG_New_embedded_image** command can be used to embed the [picture](# "Picture to be embedded") picture in the SVG container designated by [parentSVGObject](# "Reference of parent element") and to return its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The picture will be encoded in base64 then embedded in the document.

The [picture](# "Picture to be embedded") parameter is a 4D picture field or variable.

The optional [x](# "Coordinate on X axis of upper left corner") and [y](# "Coordinate on Y axis of upper left corner") parameters can be used to specify the position of the upper left corner of the picture in the SVG containers (default value 0).

The optional [codec](# "Codec to use") parameter sets the codec to use for the [picture](# "Picture to be embedded"). By default, if this parameter is omitted, the codec is ".png".

### Example  

Embed the ‘logo4D.png’ picture located in the ‘Resources’ folder:  
![](https://doc.4d.com/4Dv19/picture/195077/pict195077.en.png)

```4d
 svgRef:=SVG_New   
 $Path:=Get 4D folder([Current resources folder](4D-Environment.302-6103271.en.html "Current resources folder"))+"logo4D.png")  
 READ PICTURE FILE($Path;$Picture)  
 If(OK=1)  
    objectRef:=SVG_New_embedded_image (svgRef;$Picture)  
 End if
```

## See also

[SVG_New_image](SVG_New_image.md)  
[SVG_Open_picture](SVG_Open_picture.md)
