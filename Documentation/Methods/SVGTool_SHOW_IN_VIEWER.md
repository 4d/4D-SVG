<!-- SVGTool_SHOW_IN_VIEWER ( Param_1 ; Param_2 )
 -> Param_1 (Text)
 -> Param_2 (Text)-->
# SVGTool_SHOW_IN_VIEWER

> SVGTool_SHOW_IN_VIEWER ( svgObject {; sources} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of picture to be displayed |     |
| sources |     | String |     | ➡️ |     | Opens viewer directly on the source page |     |

## Description

The SVGTool_SHOW_IN_VIEWER command displays the SVG picture specified by [svgObject](# "Reference of picture to be displayed") in an SVG Viewer window. This tool is provided with the SVG component:

![](https://doc.4d.com/4Dv19/picture/196657/pict196657.en.png)

If you pass the optional [sources](# "Opens viewer directly on the source page") parameter (added in v14), the viewer is opened directly on the source page.

For more information about the SVG Viewer, please refer to the [Development tools](Development%20tools.md "Development tools") section.

By default, the viewer is opened on the `Picture` page.    
If the value "source" is passed as the second parameter, the viewer is opened on the `Source` page.

## See also

[Development tools](../Development%20tools.md)
