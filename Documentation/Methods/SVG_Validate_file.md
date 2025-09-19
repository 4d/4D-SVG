# SVG_Validate_file

>**SVG_Validate_file** ( *path* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| path | String | &#x1F852; | Pathname of SVG document to validate |
| Function result | Boolean | &#x1F850; | True if the document corresponds to the DTD |



#### Description 

The SVG\_Validate\_file command attempts to validate the document specified in *path* on disk with the DTD (1.0). The command returns True if the document is well formed and False otherwise.
