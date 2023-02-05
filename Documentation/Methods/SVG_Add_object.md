<!-- Text := SVG_Add_object ( target ; source )
-> target (Text)
-> source (Text)-->
# SVG_Add_object

> SVG_Add_object ( targetSVGObject ; sourceSVGObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| targetSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of parent element |     |
| sourceSVGObject |     | SVG_Ref |     | ➡️ |     | Reference of object to be added |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of SVG object |     |

## Description

The SVG_Add_object command is used to place an SVG object designated by [sourceSVGObject](# "Reference of object to be added") in the SVG container designated by [targetSVGObject](# "Reference of parent element") and return its reference. The SVG container can be the root of the document or any other reference to an SVG object that is able to contain this type of element.
