# SVG_Get_options

>**SVG_Get_options**  -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| Function result | Longint | &#8592; | Options |



#### Description 

The SVG\_Get\_options command returns a longint representing a 32-bit array where each bit can represent an option of the component. You can use the operators on the 4D bits to check the state of an option (??), and to enable (?+) or disable (?-) one of them.

The following options are currently available:

| **Bit** | **Option**                                                   | **Default**  |
| ------- | ------------------------------------------------------------ | ------------ |
| 1       | Assign an ID automatically when creating an element          | 0 (disabled) |
| 2       | Automatically close any objects thatcan be                   | 0 (disabled) |
| 3       | Create objects with a background                             | 1 (enabled)  |
| 4       | Absolute coordinates for paths                               | 1 (enabled)  |
| 5       | Create more readable code                                    | 0 (disabled) |
| 6       | Beep when an error occurs                                    | 1 (enabled)  |
| 7       | Do not display 4D errors                                     | 0 (disabled) |
| 8       | Transparent pictures                                         | 1 (enabled)  |
| 9       | Use trigonometic origin                                      | 0 (disabled) |
| 10      | Automatic Arial Substitution                                 | 1 (enabled)  |
| 11      | Set shape-rendering='crispEdges' as default for a new canvas | 0 (disabled) |
| 12      | Check parameters                                             | 1 (enabled)  |
| 13      | Keep extra spaces                                            | 0 (disabled) |
| 14      | Centered rotation                                            | 0 (disabled) |

* *Assign an ID automatically when creating an element*  
If this option is enabled, when the component creates a new element, it systematically adds and fills in an 'id' attribute for the object created, if this is not already specified.
* *Automatically close objects*  
If this option is enabled, the objects created with the *SVG\_New\_arc* and *SVG\_New\_polyline\_by\_arrays* commands will be automatically closed.
* *Create objects with a background*  
If this option is enabled, closed objects will be created with a background color; otherwise, the background will be transparent.
* *Absolute coordinates for paths*  
When drawing paths with the *SVG\_PATH\_MOVE\_TO*, *SVG\_PATH\_LINE\_TO*, *SVG\_PATH\_CURVE* and *SVG\_PATH\_ARC* commands, the coordinates passed will be interpreted as absolute if this option is enabled; otherwise they will be considered as relative.
* *Create more readable code*  
This option can be used to create indented and well-spaced code which is nevertheless unwieldy; its activation is particularly useful during the debugging phase.
* *Beep when an error occurs*  
When an error occurs and no host database error-handling method has been installed with the *SVG\_Set\_error\_handler* command, a beep is emitted if this option is enabled.
* *Do not display 4D errors*  
This option which is enabled by default blocks the display of 4D errors by installing an error-handling method peculiar to the component. You may prefer not to use this internal management and to let 4D display these messages. This can be useful during debugging for example.
* *Transparent pictures*  
By default, SVG pictures created with the *SVG\_New* command are transparent. By disabling this option, the pictures will be on a white background.
* *Use trigonometric origin*  
By default, SVG places the origin at the top of the scale of degrees (midnight). This option lets you pass coordinates according to the usual trigonometric reference points (3h or 15mn). Conversion is performed on the fly.
* *Automatic Arial Substitution*  
By default, 4D SVG replaces 'Arial' font with 'Arial Unicode MS', 'Arial' to improve compatibility with non-Roman characters (e.g. Japanese). In certain cases, you may want to disable this functioning. This option means you do not have to replace Arial fonts.
* *Set shape-rendering='crispEdges' as default for a new canvas*  
The crispEdges attribute (see *SVG\_SET\_SHAPE\_RENDERING*) can be forced by default using this option.
* *Checks parameters*  
By default, 4D SVG checks the validity of parameters passed to commands. Once the development step is finished, you may want to disable this option to speed up code execution.
* *Keep extra spaces* (New in v14)  
Allows multiple adjacent spaces to be displayed in text objects.
* *Centered rotation* (New in v14)  
If this option is enabled, the *SVG\_SET\_TRANSFORM\_ROTATE* command attempts to perform a centered rotation when the 3rd and 4th parameter are not passed. The center of rotation is calculated based on the x, y, width and height attributes of the object. If the object referenced does not have these attributes, the rotation is performed around the point (0,0).

#### Example 

See the *SVG\_SET\_OPTIONS* command.

#### See also 

[SVG\_SET\_OPTIONS](SVG%5FSET%5FOPTIONS.md)  