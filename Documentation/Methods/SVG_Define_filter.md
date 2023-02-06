<!-- objectID := SVG_Define_filter ( svgObject ; ID ; x ; y ; width ; height ; filterUnits ; Param_8 )
 -> svgObject (Text)
 -> ID (Text)
 -> x (Real)
 -> y (Real)
 -> width (Real)
 -> height (Real)
 -> filterUnits (Text)
 -> Param_8 (Text)
 <- objectID (Text)-->
# SVG_Define_filter

> SVG_Define_filter ( parentSVGObject ; id {; frameX ; frameY {; frameWidth ; frameHeight {; frameUnit ; filterUnit}}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Name of symbol |     |
| frameX |     | Longint |     | ➡️ |     | Coordinate on X axis |     |
| frameY |     | Longint |     | ➡️ |     | Coordinate on Y axis |     |
| frameWidth |     | Longint |     | ➡️ |     | Width of target rectangle |     |
| frameHeight |     | Longint |     | ➡️ |     | Height of target rectangle |     |
| frameUnit |     | String |     | ➡️ |     | Coordinate system of frame |     |
| filterUnit |     | String |     | ➡️ |     | Filter system of values |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of filter |     |

## Description

The SVG_Define_filter command sets a new filter in the SVG container designated by [parentSVGObject](# "Reference of parent element") and returns its reference. If [parentSVGObject](# "Reference of parent element") is not an SVG document, an error is generated.

A filter is a succession of graphic operations that will be applied to the target element. The filter element is never rendered directly; it will be applied to an object using the [SVG_SET_FILTER](SVG_SET_FILTER.md)  command.

The [id](# "Name of symbol") parameter specifies the name of the marker. The name will be used to associate a filter with an object. If an element with the same name exists, it will be replaced.

The optional [frameX](# "Coordinate on X axis"), [frameY](# "Coordinate on Y axis"), [frameWidth](# "Width of target rectangle") and [frameHeight](# "Height of target rectangle") parameters set a rectangular region in the document to which this filter will be applied.

The optional [frameUnit](# "Coordinate system of frame") parameter sets the coordinate system for the 4 previous parameters. Expected values: "userSpaceOnUse" or "objectBoundingBox" (default value).

The optional [filterUnit](# "Filter system of values") parameter sets the coordinate system for the lenths and the filter definition properties. Expected values: "userSpaceOnUse" (default value) or "objectBoundingBox".

### Example  

In this example, we want to perform the following operations:

* create a rectangle with 50% blue background  

* create a 4% blur filter and apply it to this rectangle
* save the result in an SVG file on disk.

```4d
 $Dom_SVG:=SVG_New   
   
  // creation of a rectangle with 50% blue background  
 $Dom_rect:=SVG_New_rect ($Dom_SVG;50;50;50;50;0;0;"blue:50";"blue:50")  
   
  // creation of 4% blur filter  
 $Dom_filter:=SVG_Define_filter ($Dom_SVG;"blur")  
 SVG_Filter_Blur ($Dom_filter;4)  
 SVG_Filter_Offset ($Dom_filter;4)  
   
  // application of this filter to the rectangle  
 SVG_SET_FILTER ($Dom_rect;"blur")  
   
  // saving result in an SVG file  
 SVG_SAVE_AS_TEXT ($Dom_SVG;System folder([Desktop](System-Folder.302-6103182.en.html "Desktop"))+"test.svg")  
   
 SVG_CLEAR ($Dom_SVG)
```

Result:

![](https://doc.4d.com/4Dv19/picture/1044185/pict1044185.fr.png)

## See also

[SVG_Filter_Blend](SVG_Filter_Blend.md)  
[SVG_Filter_Blur](SVG_Filter_Blur.md)  
[SVG_Filter_Offset](SVG_Filter_Offset.md)  
[SVG_SET_FILTER](SVG_SET_FILTER.md)
