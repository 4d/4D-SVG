# 🧩 Development tools

The 4D SVG component provides a set of tools intended to facilitate the entry of code and to preview the SVG graphics:

* the syntax palette
* the color palette
* the SVG viewer.

## Syntax Palette  

The syntax palette lists the 4D SVG component commands grouped by themes:

![](https://doc.4d.com/4Dv19/picture/193231/pict193231.en.png)

This palette can be used to insert the component commands into the Method editor by simple drag and drop. The command is then pasted in the method with its parameters. The optional parameters are prefixed by an underline.

To display the syntax palette, you can either:

* execute the SVGTool_Display_syntax method, or
* click on the **SVG** button and choose the **SVG Component syntax** command in the 4D Pop component palette if you are using it (see below).

## Color Palette  

The color palette displays the name and a sample of each color specified in the SVG standard, as well as a slider that can be used to vary the rate of opacity:

![](https://doc.4d.com/4Dv19/picture/193232/pict193232.en.png)

You can use this palette to insert an SVG color reference by drag and drop into the 4D Method editor. The color is inserted as a string that includes the rate of opacity, if any (for example "lavender:30" for the color lavendar with an opacity of 30%). For more information about color references, please refer to the [SVG Colors](SVG%20Colors.md) section.  
You can also drag and drop a color into the 4D Form editor. This creates a square of color in the form of a static SVG picture.

To display the color palette, just execute the SVGTool_Display_colors method.

## SVG Viewer  

4D SVG provides an SVG viewer that is particularly useful during the development phase:  
![](https://doc.4d.com/4Dv19/picture/193233/pict193233.en.png)  
The viewer window has two pages which can be accessed via the **Picture** and **Source** buttons or the **View** menu:

* **Picture**: This page provides a display area into which you can drag and drop or open an SVG picture file (via the **File** menu). You can also display a valid SVG reference using the [SVGTool_SHOW_IN_VIEWER](Methods/SVGTool_SHOW_IN_VIEWER.md) command.
* **Source**: This page lets you view the XML code associated with the picture. You can select and copy the code, but you cannot modify it.  
    When the window is in the foreground, you can modify several display optins and save the picture file on disk using the **View** menu:

![](https://doc.4d.com/4Dv19/picture/193234/pict193234.en.png)

**Note:** The "Picture" page has a standard context menu.

To display the viewer window, you can either:

* execute the SVGTool_Display_viewer method. In this case, the window appears empty.
* call the [SVGTool_SHOW_IN_VIEWER](Methods/SVGTool_SHOW_IN_VIEWER.md) method by passing a valid SVG reference in order to preview the picture reference (see the description of the command)
* click on the **SVG** button and choose the **SVG viewer** command in the 4D Pop component palette if you are using it (see below).

## Integration to 4D Pop  

4D Pop is a set of components dedicated to developer productivity and grouped into a tool bar that can be integrated into the 4D development environment.

When you use 4D Pop and 4D SVG at the same time, a new button is added to the 4D Pop tool bar:  
![](https://doc.4d.com/4Dv19/picture/193235/pict193235.en.png)

This button gives direct access to the development assistance tools of 4D SVG:  
![](https://doc.4d.com/4Dv19/picture/193236/pict193236.en.png)

**Note:** 4DPop is included in the additional tools on the 4D full installer