# SVG_Add_object

>**SVG_Add_object** ( *targetSVGObject* ; *sourceSVGObject* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| targetSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| sourceSVGObject | SVG_Ref | &#8594; | Reference of object to be added |
| Function result | SVG_Ref | &#8592; | Reference of SVG object |



#### Description 

The SVG\_Add\_object command is used to place an SVG object designated by *sourceSVGObject* in the SVG container designated by *targetSVGObject* and return its reference. The SVG container can be the root of the document or any other reference to an SVG object that is able to contain this type of element.
