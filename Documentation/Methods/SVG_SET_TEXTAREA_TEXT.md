<!-- SVG_SET_TEXTAREA_TEXT ( svgObject ; text )
 -> svgObject (Text)
 -> text (Text) - String to write-->
# SVG_SET_TEXTAREA_TEXT

> SVG_SET_TEXTAREA_TEXT ( svgObject ; theText )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of text element |     |
| theText |     | Text |     | ➡️ |     | Text to set |     |

## Description

The SVG_SET_TEXTAREA_TEXT command can be used to setHome.mdreplace the textual content of the text object designated by [svgObject](# "Reference of text element"). If [svgObject](# "Reference of text element") is not a "textArea" object, an error is generated.

The line return characters are automatically replaced by "&lt;tbreakHome.md&gt;" elements.

## See also

[SVG_APPEND_TEXT_TO_TEXTAREA](SVG_APPEND_TEXT_TO_TEXTAREA.md)  
[SVG_New_textArea](SVG_New_textArea.md)
