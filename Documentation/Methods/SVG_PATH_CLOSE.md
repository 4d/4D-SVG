# SVG_PATH_CLOSE

>**SVG_PATH_CLOSE** ( *parentSVGObject* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of path |



#### Description 

The SVG\_PATH\_CLOSE command closes the current subpath referenced by *parentSVGObject* by drawing a straight line from the current point to the initial point. If *parentSVGObject* is not a path reference (‘path’ element), an error is generated.

#### Example 

See the examples for the *SVG\_New\_path* command.

#### See also 

[SVG\_New\_path](SVG%5FNew%5Fpath.md)  