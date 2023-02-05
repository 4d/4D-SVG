<!-- Long Integer := SVG_Get_options-->
# SVG_Get_options

> SVG_Get_options -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Function result |     | Longint |     | ↩️ |     | Options |     |

## Description

The SVG_Get_options command returns a longint representing a 32-bit array where each bit can represent an option of the component. You can use the operators on the 4D bits to check the state of an option (??), and to enable (?+) or disable (?-) one of them.

The following options are currently available:

|     |     |
| --- | --- | --- |
| **Bit** | **Option** | **Default** |
| 1   | Assign an ID automatically when creating an element | 0 (disabled) |
| 2   | Automatically close any objects thatcan be | 0 (disabled) |
| 3   | Create objects with a background | 1 (enabled) |
| 4   | Absolute coordinates for paths | 1 (enabled) |
| 5   | Create more readable code | 0 (disabled) |
| 6   | Beep when an error occurs | 1 (enabled) |
| 7   | Do not display 4D errors | 0 (disabled) |
| 8   | Transparent pictures | 1 (enabled) |
| 9   | Use trigonometic origin | 0 (disabled) |
| 10  | Automatic Arial Substitution | 1 (enabled) |
| 11  | Set shape-rendering='crispEdges' as default for a new canvas | 0 (disabled) |
| 12  | Check parameters | 1 (enabled) |
| 13  | Keep extra spaces | 0 (disabled) |
| 14  | Centered rotation | 0 (disabled) |

* _Assign an ID automatically when creating an element_  
    If this option is enabled, when the component creates a new element, it systematically adds and fills in an 'id' attribute for the object created, if this is not already specified.

* _Automatically close objects_  
    If this option is enabled, the objects created with the [SVG_New_arc](SVG_New_arc.md "SVG_New_arc") and [SVG_New_polyline_by_arrays](SVG_New_arc](SVG_New_arc.md "SVG_New_arc") and [SVG_New_polyline_by_arrays.md)  commands will be automatically closed.

* _Create objects with a background_  
    If this option is enabled, closed objects will be created with a background color; otherwise, the background will be transparent.

* _Absolute coordinates for paths_  
    When drawing paths with the [SVG_PATH_MOVE_TO](SVG_PATH_MOVE_TO.md "SVG_PATH_MOVE_TO"), [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md "SVG_PATH_LINE_TO"), [SVG_PATH_CURVE](SVG_PATH_CURVE.md "SVG_PATH_CURVE") and [SVG_PATH_ARC](SVG_PATH_MOVE_TO](SVG_PATH_MOVE_TO.md "SVG_PATH_MOVE_TO"), [SVG_PATH_LINE_TO](SVG_PATH_LINE_TO.md "SVG_PATH_LINE_TO"), [SVG_PATH_CURVE](SVG_PATH_CURVE.md "SVG_PATH_CURVE") and [SVG_PATH_ARC.md)  commands, the coordinates passed will be interpreted as absolute if this option is enabled; otherwise they will be considered as relative.

* _Create more readable code_  
    This option can be used to create indented and well-spaced code which is nevertheless unwieldy; its activation is particularly useful during the debugging phase.

* _Beep when an error occurs_  
    When an error occurs and no host database error-handling method has been installed with the [SVG_Set_error_handler](SVG_Set_error_handler.md)  command, a beep is emitted if this option is enabled.

* _Do not display 4D errors_  
    This option which is enabled by default blocks the display of 4D errors by installing an error-handling method peculiar to the component. You may prefer not to use this internal management and to let 4D display these messages. This can be useful during debugging for example.

* _Transparent pictures_  
    By default, SVG pictures created with the [SVG_New](SVG_New.md)  command are transparent. By disabling this option, the pictures will be on a white background.

* _Use trigonometric origin_  
    By default, SVG places the origin at the top of the scale of degrees (midnight). This option lets you pass coordinates according to the usual trigonometric reference points (3h or 15mn). Conversion is performed on the fly.

* _Automatic Arial Substitution_  
    By default, 4D SVG replaces 'Arial' font with 'Arial Unicode MS', 'Arial' to improve compatibility with non-Roman characters (e.g. Japanese). In certain cases, you may want to disable this functioning. This option means you do not have to replace Arial fonts.

* _Set shape-rendering='crispEdges' as default for a new canvas_  
    The crispEdges attribute (see [SVG_SET_SHAPE_RENDERING](Home.md4Dv19R8Home.md4DHome.md13Home.mdSVG-SET-SHAPE-RENDERING.301-888659.en.html "SVG_SET_SHAPE_RENDERING")) can be forced by default using this option.

* _Checks parameters_  
    By default, 4D SVG checks the validity of parameters passed to commands. Once the development step is finished, you may want to disable this option to speed up code execution.

* _Keep extra spaces_ (New in v14)  
    Allows multiple adjacent spaces to be displayed in text objects.

* _Centered rotation_ (New in v14)  
    If this option is enabled, the [SVG_SET_TRANSFORM_ROTATE](SVG_SET_TRANSFORM_ROTATE.md)  command attempts to perform a centered rotation when the 3rd and 4th parameter are not passed. The center of rotation is calculated based on the x, y, width and height attributes of the object. If the object referenced does not have these attributes, the rotation is performed around the point (0,0).

### Example  

See the [SVG_SET_OPTIONS](SVG_SET_OPTIONS.md)  command.

## See also

[SVG_SET_OPTIONS](SVG_SET_OPTIONS.md)
