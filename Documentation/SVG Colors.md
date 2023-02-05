# v19R8Home.md4DHome.md19-R8Home.md4D%20SVG%20Componen

[Colors and Gradients](Colors%20and%20Gradients.md)

SVG Colors

### ![](..Home.md..Home.mdimageHome.mdarticle16x16Home.mdak_200.png) SVG Colors  

#### Definition of colors  

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

The list of keywords, as well as their RGB equivalents, can be found in the [4D SVG Constants](4D%20SVG%20Constants.md) theme: [SVG Colors (Names)](SVG%20Colors%20(Names).md) and [SVG Colors (RGB)](SVG%20Colors%20(RGB).md). You can also view this list and insert the color values directly via the 4D SVG Color palette. For more information, please refer to [Development tools](Development%20tools.md).

##### None  

Pass the "**none**" keyword in the backgroundColor or foregroundColor parameters in order to not have a fill or stroke at all. The "none" keyword can be used with most SVG commands.

#### Opacity  

It is possible to specify the opacity in the color expressions of the component commands by using the syntax "color:opacity" where opacity is a number included between 0 (no color) and 100 (color completely opaque. So "red:50" will be interpreted as a red at 50% opacity.

#### Gradients  

Gradients are progressive transitions of color along a vector. These gradients are set with the [SVG_Define_linear_gradient](SVG_Define_linear_gradient.md "SVG_Define_linear_gradient") and [SVG_Define_radial_gradient](SVG_Define_linear_gradient](SVG_Define_linear_gradient.md "SVG_Define_linear_gradient") and [SVG_Define_radial_gradient.md)  commands. Once set, the gradients are used by reference using the "url(#GradientName)" syntax.

Similarly, it is possible to set a custom color associated with an opacity using the [SVG_Define_solidColor](SVG_Define_solidColor.md)  command.

## See also

[Development tools](Development%20tools.md)  
[SVG_Define_linear_gradient](SVG_Define_linear_gradient.md)  
[SVG_Define_radial_gradient](SVG_Define_radial_gradient.md)  
[SVG_Define_solidColor](SVG_Define_solidColor.md)  
[SVG_SET_OPACITY](SVG_SET_OPACITY.m> t.md)
d)
