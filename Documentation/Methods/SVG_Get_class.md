<!-- class := SVG_Get_class ( svgObject ; classesNamesArray )
 -> svgObject (Text)
 -> classesNamesArray (Pointer) - {array text} will be populated with all class names
 <- class (Text) - class attribute-->
# SVG_Get_class

> SVG_Get_class ( svgObject {; classNames} ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| classNames |     | Pointer |     | ➡️ |     | Pointer to array of class names |     |
| Function result |     | Text |     | ↩️ |     | Class name(s) |     |

## Description

The **SVG_Get_class** command returns the class name(s) for an SVG image whose reference is passed in the [svgObject](## "SVG object reference") parameter. Class name(s) are returned as a string, with each name separated by a space.

In the optional [classNames](## "Pointer to array of class names") parameter, you can pass a pointer to an array, whose elements will be filled with the class name(s).

### Example  

```4d
  //  define 2 styles  
 SVG_Define_style ($Dom_SVG;".colored {fill: yellow; fill-opacity: 0.6; stroke: red; stroke-width: 8; stroke-opacity: 0.6}")  
 SVG_Define_style ($Dom_SVG;".blue {fill: blue}")  
   
  //  create a group and set a default style  
 $Dom_g:=SVG_New_group ($Dom_SVG)  
 SVG_SET_CLASS ($Dom_g;"colored blue")  
   
 ARRAY TEXT($tTxt_Classes;0)  
 $Txt_buffer:=SVG_Get_class($Dom_g;->$tTxt_classes)  
   
  //  $Txt_buffer = "colored blue"  
  //  $tTxt_classes{1} = "colored"  
  //  $tTxt_classes{2} = "blue"
```
