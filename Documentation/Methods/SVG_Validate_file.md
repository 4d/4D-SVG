<!-- isSVG := SVG_Validate_file ( pathname )
 -> pathname (Text)
 <- isSVG (Boolean) - true if the file is a svg-->
# SVG_Validate_file

> SVG_Validate_file ( path ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| path |     | String |     | ➡️ |     | Pathname of SVG document to validate |     |
| Function result |     | Boolean |     | ↩️ |     | True if the document corresponds to the DTD |     |

## Description

The SVG_Validate_file command attempts to validate the document specified in [path](## "Pathname of SVG document to validate") on disk with the DTD (1.0). The command returns True if the document is well formed and False otherwise.
