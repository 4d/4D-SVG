# 🧩 SVG Colors  

## Definition of colors  

SVG recognizes all the alternative syntaxes for the colors defined in the CSS2 standard. The commands of the 4D SVG component support all these syntaxes.

A color can be expressed in one of the following forms:

* RGB format  

    |     |     |
    | --- | --- |
    | **Format** | **Example** |
    | #rgb | #f00 |
    | #rrggbb | #ff0000 |
    | rgb(r,g,b) | rgb(255,0,0) |
    |     | rgb(100%, 0%, 0%) |

* "Color" keyword format  
    SVG accepts an extensive list of color name keywords, for example "red".

The list of keywords, as well as their RGB equivalents, can be found in: [SVG Colors (Names)](svg-colors-names.md) and [SVG Colors (RGB)](svg-colors-rgb.md). You can also view this list and insert the color values directly via the 4D SVG Color palette. For more information, please refer to [Development tools](development-tools.md).

### None  

Pass the "**none**" keyword in the backgroundColor or foregroundColor parameters in order to not have a fill or stroke at all. The "none" keyword can be used with most SVG commands.

### Opacity  

It is possible to specify the opacity in the color expressions of the component commands by using the syntax "color:opacity" where opacity is a number included between 0 (no color) and 100 (color completely opaque. So "red:50" will be interpreted as a red at 50% opacity.

### Gradients  

Gradients are progressive transitions of color along a vector. These gradients are set with the [SVG_Define_linear_gradient](Methods/SVG_Define_linear_gradient.md) and [SVG_Define_radial_gradient](Methods/SVG_Define_radial_gradient.md) commands. Once set, the gradients are used by reference using the "url(#GradientName)" syntax.

Similarly, it is possible to set a custom color associated with an opacity using the [SVG_Define_solidColor](Methods/SVG_Define_solidColor.md)  command.

## Commands

- [SVG_Color_from_index](Methods/SVG_Color_from_index.md)
- [SVG_Color_grey](Methods/SVG_Color_grey.md)
- [SVG_Color_RGB_from_CMYK](Methods/SVG_Color_RGB_from_CMYK.md)
- [SVG_Color_RGB_from_HLS](Methods/SVG_Color_RGB_from_HLS.md)
- [SVG_Color_RGB_from_long](Methods/SVG_Color_RGB_from_long.md)
- [SVG_FADE_TO_GREY_SCALE](Methods/SVG_FADE_TO_GREY_SCALE.md)
- [SVG_Filter_ColorMatrix](Methods/SVG_Filter_ColorMatrix.md)
- [SVG_GET_COLORS_ARRAY](Methods/SVG_GET_COLORS_ARRAY.md)
- [SVG_GET_DEFAULT_BRUSHES](Methods/SVG_GET_DEFAULT_BRUSHES.md)
- [SVG_Get_named_color_value](Methods/SVG_Get_named_color_value.md)
- [SVG_SET_BRIGHTNESS](Methods/SVG_SET_BRIGHTNESS.md)
- [SVG_SET_DEFAULT_BRUSHES](Methods/SVG_SET_DEFAULT_BRUSHES.md)
- [SVG_SET_HUE](Methods/SVG_SET_HUE.md)
- [SVG_SET_SATURATION](Methods/SVG_SET_SATURATION.md)
- [Development tools](Methods/development-tools.md)
- [SVG_Define_linear_gradient](Methods/SVG_Define_linear_gradient.md)
- [SVG_Define_radial_gradient](Methods/SVG_Define_radial_gradient.md)
- [SVG_Define_solidColor](Methods/SVG_Define_solidColor.md)
- [SVG_SET_OPACITY](Methods/SVG_SET_OPACITY.md)
- [SVG_SET_STROKE_BRUSH](Methods/SVG_SET_STROKE_BRUSH.md)

## Constants

- [SVG Colors (Names)](svg-colors-names.md)
- [SVG Colors (RGB)](svg-colors-rgb.md)
