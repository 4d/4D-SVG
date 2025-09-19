# SVG_Define_clip_path

>**SVG_Define_clip_path** ( *parentSVGObject* ; *clipPathID* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| parentSVGObject | SVG_Ref | &#8594; | Reference of parent element |
| clipPathID | Text | &#8594; | Name of clip path |
| Function result | SVG_Ref | &#8592; | Reference of clip path |



#### Description 

The SVG\_Define\_clip\_path command specifies a new clip path in the SVG container designated by *parentSVGObject* and returns its reference. If *parentSVGObject* is not (or does not belong to) an SVG document, an error is generated.

The *clipPathID* parameter designates the name of the clip path. This name will be used to associate a clip path with an object. If an element with the same name already exists in the document, an error is generated. 

**See Also:** *http://www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath*

#### Example 

Refer to the example of the *SVG\_SET\_CLIP\_PATH* command.

#### See also 

[SVG\_SET\_CLIP\_PATH](SVG%5FSET%5FCLIP%5FPATH.md)  