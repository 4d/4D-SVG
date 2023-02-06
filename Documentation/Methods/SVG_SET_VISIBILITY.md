<!-- SVG_SET_VISIBILITY ( objectID ; Visible )
 -> objectID (Text)
 -> Visible (Boolean)-->
# SVG_SET_VISIBILITY

> SVG_SET_VISIBILITY ( svgObject {; hide} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| hide |     | Boolean |     | ➡️ |     | True = Show, False = Hide |     |

## Description

The SVG_SET_VISIBILITY command hides or shows an SVG object having the objectRef reference. If objectRef is not the reference of an object that can be hidden, an error is generated.

If the optional [hide](# "True = Show, False = Hide") parameter is set to True or omitted, the object will be shown. If it is False, the object will be hidden.

### Example  


```4d
 $svg :=SVG_New   
 $object:=SVG_New_rect ($svg;10;10;200;200;0;0;"black";" white";2)  
 SVG_SET_VISIBILITY ($object;False) 
```

The object is described but will not be rendered.
 
