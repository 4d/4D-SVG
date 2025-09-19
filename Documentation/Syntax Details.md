# 🧩 Syntax details  

## SVG_Ref

Most of the 4D SVG component commands manipulate SVG structures via SVG_Ref type references.

An SVG_Ref is a 32-character string type expression. It uniquely identifies a SVG structure loaded in memory. This can be an SVG document loaded via the [SVG_Copy](Methods/SVG_Copy.md), [SVG_New](Methods/SVG_New.md), [SVG_Open_picture](Methods/SVG_Open_picture.md) or [SVG_Open_file](Methods/SVG_Open_file.md) commands, or any SVG structure handled by programming (object, filter, path, etc.).

An SVG_Ref is an XML reference. All SVG_Ref references can be used as elementRef parameters for the 4D XML DOM commands.

Once you no longer need it, remember to call the [SVG_CLEAR](Methods/SVG_CLEAR.md) command with the SVG_Ref reference in order to free up memory.

## Optional parameters

Unless otherwise mentioned, optional number arguments are ignored if their value is equal to -1 and text arguments are ignored if an empty string is passed.

## Coordinates

Unless otherwise mentioned, the position (x, y) and size (width, height, radius) parameters are expected in the current user coordinate system.
