# SVG_Define_shadow

>**SVG_Define_shadow** ( *parentSVGObject* ; *id* {; *deviation* {; *offsetX* {; *offsetY*}}} ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| id | String | &#8594; | Name of filter |
| deviation | Longint | &#8594; | Value of shadow dispersion |
| offsetX | Longint | &#8594; | Offset on X axis |
| offsetY | Longint | &#8594; | Offset on Y axis |
| Function result | SVG_Ref | &#8592; | Reference of filter |



#### Description 

The SVG\_Define\_shadow command sets a new shadow filter in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not an SVG document, an error is generated.

This filter will be applied to objects for which a shadow is desired using the *SVG\_SET\_FILTER* command.

The *id* parameter specifies the name of the filter. This name will be used to associate a filter with an object. If an element with the same name exists, it will be replaced.

The optional *deviation* parameter sets the intensity of the shadow dispersion. Default value: 4.

The optional *offsetX* and *offsetY* parameters specify, respectively, the horizontal and vertical offset of the shadow with respect to the object. Default value: 4.

#### Example 

Declaration of a filter that can be used to make a shadow beneath an object:  
![](../images/pict195976.en.png)

```4d
 $svg:=SVG_New
 
 $text:=SVG_New_text($svg;"SVG";52;76-45;"Verdana";45)
 SVG_SET_FONT_COLOR($text;"red")
  //Set filter
 SVG_Define_shadow($svg;"myShadow")
  //and apply it to text
 SVG_SET_FILTER($text;"myShadow")
```

#### See also 

[SVG\_SET\_FILTER](SVG%5FSET%5FFILTER.md)  