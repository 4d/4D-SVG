# SVG_PATH_MOVE_TO

>**SVG_PATH_MOVE_TO** ( *parentSVGObject* ; *x* ; *y* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#x1F852; | Reference of path |
| x | Longint | &#x1F852; | Coordinate on X axis |
| y | Longint | &#x1F852; | Coordinate on Y axis |



#### Description 

The SVG\_PATH\_MOVE\_TO command begins a new subpath at the point of the given coordinates (*x*, *y*) in the path referenced by *parentSVGObject*. If *parentSVGObject* is not a path reference (‘path’ element), an error is generated.

The effect produced is as if the “pen” were lifted and moved to a new location. The current point becomes the new starting point which will be taken into account by the *SVG\_PATH\_CLOSE* command.

#### Example 

See the examples for the *SVG\_New\_path* command.

#### See also 

[SVG\_New\_path](SVG%5FNew%5Fpath.md)  