# SVG_SET_VIEWPORT_FILL

>**SVG_SET_VIEWPORT_FILL** ( *svgObject* {; *color* {; *opacity*}} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG element |
| color | String | &#8594; | Fill color |
| opacity | Longint | &#8594; | Percentage of opacity |



#### Description 

The SVG\_SET\_VIEWPORT\_FILL command can be used to set the background color of an SVG document having the *svgObject* reference.

If this attribute already exists, its value is replaced by the value passed as parameter. If *svgObject* is an SVG element that does not accept this attribute, an error is generated.

The optional *color* parameter indicates the color to be used for the picture background. If this parameter is omitted or contains an empty string, white will be used. For more information about colors, please refer to the *SVG Colors* section.

The optional *opacity* parameter can be used to specify the value of the percentage of opacity to be applied to this fill. If this parameter is omitted or if no opacity has been specified for the document, the value 100% is used.

#### See also 

*SVG Colors*  