<!-- SVG_SET_DIMENSIONS ( objectID ; width ; height ; unit )
 -> objectID (Text)
 -> width (Real)
 -> height (Real)
 -> unit (Text)-->
# SVG_SET_DIMENSIONS

> SVG_SET_DIMENSIONS ( svgObject ; width {; height {; unit}} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| width |     | Longint |     | ➡️ |     | Dimension on the X axis |     |
| height |     | Longint |     | ➡️ |     | Dimension on the Y axis |     |
| unit |     | String |     | ➡️ |     | Unit of measurement |     |

## Description

The SVG_SET_DIMENSIONS command can be used to set the dimensions for the SVG object having the [svgObject](## "Reference of SVG element") reference. If these attributes already exist, their values are replaced by those passed as parameters.

If the [unit](## "Unit of measurement") parameter is passed, it will be used. The expected values are: px, pt, pc, cm, mm, in, em, ex or %. An incorrect [unit](## "Unit of measurement") value generates an error. If the parameter is omitted, the values of the [width](## "Dimension on the X axis") and [height](## "Dimension on the Y axis") parameters are expected in the user coordinate system.

### Example  

```4d
 $svg :=SVG_New  //  Create a new document 

 $object:=SVG_New_rect ($svg;10;10;200;200;0;0;"black";"white";2)  
 SVG_SET_DIMENSIONS ($object;-1;400) //   New height
```
