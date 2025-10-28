# SVG_Define_style

>**SVG_Define_style** ( *parentSVGObject* ; *style* {; *type* {; *media*}} )  -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| style | Text | &#8594; | Definition of style OR Pathname of file to use |
| type | Text | &#8594; | Type of content |
| media | Text | &#8594; | Media descriptor |
| Function result | SVG_Ref | &#8592; | Reference of style |



#### Description 

The SVG\_Define\_style command is used to set a new style sheet in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not (or does not belong to) an SVG document, an error is generated.

The *style* parameter is used to embed style sheets directly within SVG content: 

* If the *style* parameter contains a valid pathname to a CSS file, the style definition is done using a mechanism referencing external style sheets. The path, if it begins with the # character or by the string "file:", expresses a relative path whose root is the "Resources" folder of the database.
* The *style* parameter can also be a URL of the "http://… " type; in this case, the style sheet will be referenced as an external resource.
* In addition, the *style* parameter can be a URL relative to the "Resources/SVG/" subfolder of the database. This is particularly useful in client/server mode, when files are stored in the "Resources" folder. Relatives URLs can begin with:  
   * "**/**", to indicate the "\~/Resources/SVG/" path  
   * "**./**", to indicate the "\~/Resources/" path  
   * "**../**", to indicate the database folder.  
For examples of relative URLs, refer to the *SVG\_New\_image* command.

The optional *type* parameter specifies the language of the style sheet for the contents of the element. The default value is "text/css". 

The optional *media* parameter specifies the intended destination media for the style information. If you omit this parameter, the default value used is "all". If the value is not included in the list of media types recognized by CSS2, an error is generated.

**See Also:** *http://www.w3.org/TR/SVG/styling.html#StyleElement*

#### Example 1 

Setting an embedded style and overlay of one of the elements:  
![](../images/pict359168.en.png)

```4d
  //Definition of style
 $Txt_style:=".colored {fill: yellow; fill-opacity: 0.6; stroke: red;stroke-width:8; stroke-opacity: 0.6}"
 SVG_Define_style($Dom_SVG;$Txt_style)
 
  //Creating a group and assigning a default style
 $Dom_g:=SVG_New_group($Dom_SVG)
 SVG_SET_CLASS($Dom_g;"colored")
 
  //Drawing a rectangle
 $Dom_rect:=SVG_New_rect($Dom_g;25;30;320;240;10;10;"";"")
 
  //Drawing a circle and style overlay with a custom outline color
 $Dom_circle:=SVG_New_circle($Dom_g;300;250;100;"";"")
 SVG_SET_STROKE_BRUSH($Dom_circle;"blue")
```

#### Example 2 

Referencing the "mystyle.css" file placed in the "dev" folder of the "Resources" folder:  
![](../images/pict359175.en.png)

```4d
  //Definition of style
 SVG_Define_style($Dom_svg;"#dev/monstyle.css")
 
  //Creating a group and assigning a default style
 $Dom_g:=SVG_New_group($Dom_SVG)
 SVG_SET_CLASS($Dom_g;"colored")
 
  //Drawing a rectangle
 $Dom_rect:=SVG_New_rect($Dom_g;25;30;320;240;10;10;"";"")
```

mystyle.css file:  

```RAW
.colored {fill: red; fill-opacity: 0.6; stroke: blue; stroke-width:8; stroke-opacity: 0.6}
```
