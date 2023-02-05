<!-- nodeReference := SVG_New_image ( parentReference ; URL ; left ; top ; width ; height )
 -> parentReference (Text)
 -> URL (Text)
 -> left (Real)
 -> top (Real)
 -> width (Real)
 -> height (Real)
 <- nodeReference (Text)-->
# SVG_New_image

> SVG_New_image ( parentSVGObject ; url {; x ; y {; width ; height}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| url |     | String |     | ➡️ |     | Address of picture |     |
| x   |     | Longint |     | ➡️ |     | Coordinate on X axis of upper left corner |     |
| y   |     | Longint |     | ➡️ |     | Coordinate on Y axis of upper left corner |     |
| width |     | Longint |     | ➡️ |     | Width of picture |     |
| height |     | Longint |     | ➡️ |     | Height of picture |     |
| Function result |     | SVG_Ref |     | ↩️ |     | SVG object reference |     |

## Description

The SVG_New_image command can be used to reference a picture at the [url](# "Address of picture") address in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

The [url](# "Address of picture") parameter specifies the location of the picture and can take several forms:

* A **local URL** (a pathname in the form: file:// …): in this case, the picture will only be displayed if the file is actually accessible at the time the picture is rendered. This local URL can be relative (in the form: “#PicturesHome.mdmyPicture.png”); in this case the command prefixes the pathname with that of the **Resources** folder of the host database. If the [width](# "Width of picture") and [height](# "Height of picture") parameters are omitted, they will be calculated by the command (to be avoided since this is slower than when the sizes are known). In the case of a relative path, if it is not valid, an error is generated.
* A **non-local URL** (mySite.comHome.mdpicturesHome.mdmyPicture.jpeg ). In this case, no verification is carried out concerning the validity of the link and an error will be generated if the [width](# "Width of picture") and [height](# "Height of picture") parameters are omitted.
* A **relative URL** ("..Home.mdpicture.png"). This is particularly useful in clientHome.mdserver mode, when files are stored in the "Resources" folder. Relatives URLs can begin with:  
  * "**Home.md**", to indicate the "~Home.mdResourcesHome.mdSVGHome.md" path
  * "**.Home.md**", to indicate the "~Home.mdResourcesHome.md" path
  * "**..Home.md**", to indicate the database folder.

The optional [x](# "Coordinate on X axis of upper left corner") and [y](# "Coordinate on Y axis of upper left corner") parameters can be used to specify the position of the upper left corner of the picture in the SVG containers (default value 0).

The [width](# "Width of picture") and [height](# "Height of picture") parameters specify the size of the rectangle in which the picture will be displayed and thus determine the size and aspect ratio of the picture. These parameter are only optional in the case of a picture referenced by a relative path in the **Resources** folder of the host database. If [width](# "Width of picture") andHome.mdor [height](# "Height of picture") equal 0 then the picture is not rendered.

### Example 1  

Place the ‘logo4D.png’ picture located in the ‘Pictures’ folder of the ‘Resources’ folder:  
![](..Home.md..Home.mdpictureHome.md195107Home.mdpict195107.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_image (svgRef;"#PicturesHome.mdlogo4D.png")
```

### Example 2  

Place the ‘4dlogo.gif’ picture that can be accessed in the ’pictures’ directory of the ‘4d.com’ site:  
![](..Home.md..Home.mdpictureHome.md195108Home.mdpict195108.en.png)

```4d
 svgRef:=SVG_New   
 objectRef:=SVG_New_image (svgRef;"www.4d.comHome.mdpicturesHome.md4dlogo.gif";20;20;39;53)
```

### Example 3  

Here are a few examples for accessing pictures using relative URLs:

```4d
 [SVG_New_image](SVG_New_image.md) ($Dom_svg;".Home.mdimagesHome.mdpicture.png";10;10)  
  //  base is the "Resources" folder  
  //  XML code will be xlink:href="..Home.mdimagesHome.mdpicture.png"
```

```4d
 [SVG_New_image](SVG_New_image.md) ($Dom_svg;"..Home.mdpicture.png";70;180)  
  //  base is the database's folder  
  //  XML code will be xlink:href="..Home.md..Home.mdpicture.png"
```

```4d
 [SVG_New_image](SVG_New_image.md) ($Dom_svg;"Home.mdsample picturesHome.mdpicture.png";110;90;100;100)  
  //  base is the "SVG" folder in the "Resources" folder  
  //  XML code will be xlink:href="sample%20picturesHome.mdpicture.gif"
```

## See also

[SVG_New_embedded_image](SVG_New_embedded_image.md)  
[SVG_Open_picture](SVG_Open_picture.md)
