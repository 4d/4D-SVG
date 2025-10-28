# SVG_SET_VISIBILITY

>**SVG_SET_VISIBILITY** ( *svgObject* {; *hide*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| hide | Boolean | &#8594; | True = Show, False = Hide |



#### Description 

The SVG\_SET\_VISIBILITY command hides or shows an SVG object having the *objectRef* reference. If *objectRef* is not the reference of an object that can be hidden, an error is generated.

If the optional *hide* parameter is set to True or omitted, the object will be shown. If it is False, the object will be hidden.

#### Example 

```4d
 $svg :=SVG_New
 $object:=SVG_New_rect($svg;10;10;200;200;0;0;"black";" white";2)
 SVG_SET_VISIBILITY($object;False) //The object is described but will not be rendered.
```
