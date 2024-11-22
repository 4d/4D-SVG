<!-- SVG_SET_DOCUMENT_VARIABLE ( Param_1 )
 -> Param_1 (Pointer)-->
# SVG_SET_DOCUMENT_VARIABLE

> SVG_SET_DOCUMENT_VARIABLE ( pointer )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| pointer |     | Pointer |     | ➡️ |     | Pointer to variable to set |     |

## Description

The **SVG_SET_DOCUMENT_VARIABLE** method sets a pointer to the variable of the host database that is updated after each call to [SVG_SAVE_AS_PICTURE](SVG_SAVE_AS_PICTURE.md) or [SVG_SAVE_AS_TEXT](SVG_SAVE_AS_TEXT.md). You must call this method only once per session (in an initialization method, for instance).

In the [pointer](## "Pointer to variable to set") parameter, you pass a pointer to the variable whose value you want to follow (usually the **Document** system variable).

You can pass a Nil pointer in the [pointer](## "Pointer to variable to set") parameter to remove the link.

## See also

[SVG_SAVE_AS_PICTURE](SVG_SAVE_AS_PICTURE.md)  
[SVG_SAVE_AS_TEXT](SVG_SAVE_AS_TEXT.md)
