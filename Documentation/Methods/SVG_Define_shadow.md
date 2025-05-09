<!-- filterReference := SVG_Define_shadow ( svgObject ; ID ; stdDeviation ; dx ; dy )
 -> svgObject (Text)
 -> ID (Text)
 -> stdDeviation (Long Integer)
 -> dx (Long Integer)
 -> dy (Long Integer)
 <- filterReference (Text)-->
# SVG_Define_shadow

> SVG_Define_shadow ( parentSVGObject ; id {; deviation {; offsetX {; offsetY}}} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| parentSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| id  |     | String |     | ➡️ |     | Name of filter |     |
| deviation |     | Longint |     | ➡️ |     | Value of shadow dispersion |     |
| offsetX |     | Longint |     | ➡️ |     | Offset on X axis |     |
| offsetY |     | Longint |     | ➡️ |     | Offset on Y axis |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of filter |     |

## Description

The SVG_Define_shadow command sets a new shadow filter in the SVG container designated by [parentSVGObject](## "Reference of parent element") and returns its reference. If [parentSVGObject](## "Reference of parent element") is not an SVG document, an error is generated.

This filter will be applied to objects for which a shadow is desired using the [SVG_SET_FILTER](SVG_SET_FILTER.md)  command.

The [id](## "Name of filter") parameter specifies the name of the filter. This name will be used to associate a filter with an object. If an element with the same name exists, it will be replaced.

The optional [deviation](## "Value of shadow dispersion") parameter sets the intensity of the shadow dispersion. Default value: 4.

The optional [offsetX](## "Offset on X axis") and [offsetY](## "Offset on Y axis") parameters specify, respectively, the horizontal and vertical offset of the shadow with respect to the object. Default value: 4.

### Example  

Declaration of a filter that can be used to make a shadow beneath an object:  
![](https://doc.4d.com/4Dv19/picture/195976/pict195976.en.png)

```4d
 $svg:=SVG_New   
   
 $text:=SVG_New_text ($svg;"SVG";52;76-45;"Verdana";45)  
 SVG_SET_FONT_COLOR ($text;"red")  
```

Set filter  

```4d
 SVG_Define_shadow ($svg;"myShadow")  
```

and apply it to text  

```4d
 SVG_SET_FILTER ($text;"myShadow")
```

## See also

[SVG_SET_FILTER](SVG_SET_FILTER.md)
