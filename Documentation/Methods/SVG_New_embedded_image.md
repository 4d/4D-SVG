# SVG_New_embedded_image

>**SVG_New_embedded_image** ( *parentSVGObject* ; *picture* {; *x* {; *y*}}{; *codec*} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#x1F852; | Reference of parent element |
| picture | Picture | &#x1F852; | Picture to be embedded |
| x | Longint | &#x1F852; | Coordinate on X axis of upper left corner |
| y | Longint | &#x1F852; | Coordinate on Y axis of upper left corner |
| codec | Text | &#x1F852; | Codec to use |
| Function result | SVG_Ref | &#x1F850; | SVG object reference |



#### Description 

The **SVG\_New\_embedded\_image** command can be used to embed the *picture* picture in the SVG container designated by *parentSVGObject* and to return its reference. If *parentSVGObject* is not an SVG document, an error is generated.

The picture will be encoded in base64 then embedded in the document.

The *picture* parameter is a 4D picture field or variable.

The optional *x* and *y* parameters can be used to specify the position of the upper left corner of the picture in the SVG containers (default value 0).

The optional *codec* parameter sets the codec to use for the *picture*. By default, if this parameter is omitted, the codec is ".png".

#### Example 

Embed the ‘logo4D.png’ picture located in the ‘Resources’ folder:  
![](../images/pict195077.en.png)

```4d
 svgRef:=SVG_New
 $Path:=Get 4D folder(Current resources folder)+"logo4D.png")
 READ PICTURE FILE($Path;$Picture)
 If(OK=1)
    objectRef:=SVG_New_embedded_image(svgRef;$Picture)
 End if
```

#### See also 

[SVG\_New\_image](SVG%5FNew%5Fimage.md)  
[SVG\_Open\_picture](SVG%5FOpen%5Fpicture.md)  