# Joey Gardiner Regex exercise2, Sonnets into XML

I started off by searching for `& < >` but there was none in the document.
Next up I put a `<line>` tag on every line. To do this I used `^.+` in the find window and `<line>\0</line>` in the replace window.

Next I took out the roman numerals. To do this I used `<line> (\D[CVLIX]+)</line>` to find them all as well as the line tag around them. Then I used `<sonnet number="\1">` to replace everything except the roman numeral. Except the roman numeral was placed in an attribute.

This leaves the `<sonnet>` tag with no end tag. so to fix this I used `<sonnet` in the find window and then I replaced it with this `</sonnet>\0`. This leaves one small problem however. There is no end tag on the last sonnet, so I put it in by hand. There is also an extra end tag at the top of the document so I deleted it by hand.
Then I inserted a `<xml>` start and end tag to the document.