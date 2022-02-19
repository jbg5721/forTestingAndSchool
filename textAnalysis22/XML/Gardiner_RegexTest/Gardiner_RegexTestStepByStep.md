# Joey Gardiner Regex Test

## 01
To start off I was instructed to paste this `^(.+?)(\n\n)` in the find window and this `<sp>\1</sp>\2` in the replace window. 
### A
With Dot matches all turned off, the search only finds a line of text that is followed by two new lines. With Dot matches all turned on however, the search finds blocks of text that are followed by  two new lines. The best option will be to have Dot matches all turned on so you can capture each individual block. 
### B
In the replace there are both `\1` and `\2`. In the replace window they express what is being kept from the original expression and where it is going. These also refer to something in the find expression. The `\1` refers to what is in the first set of parathensis, this set is grabbing any character with one or more following. It is followed by a question mark however so the expression only captures what is on the line, unless you have Dot matches all turned on. The `\2` is for the second set of parathensis, it is capturing two newlines. 
These are needed because you need to keep some of the original text to go between the tags.
### C
I completed the expression with Dot matches all turned on to wrap each text block in `<sp>` tags.
## 02
Next stage was to find all the stage directions. Searching through the document I could see that they were surrounded by `()`. So to search for this I used `\((.+\))` with Dot matches all turned off. If it was turned on, it grabs everything between the first `(` to the last `)`. I replaced it with this `<sd>\1</sd>`. This removes the parathensis around the stage directions and replaces it with the `<sd>` tag.
## 3
To find every speaker, I looked and noted that they each ended with a `:` so I used that and the `>` of the start tag to develop this expression: `>(.+?):`. I used the parathensis to determin where the start and end tag would go. I searched with Dot matches all turned off because if it was on it would search from the first `>` to the next `:` and then repeat this throughout. To then replace this expression I used this: `><speaker>\1</speaker>`. I needed to keep the `>` on the start tag so I put it in there. The part in parathensis is put inside the `<speaker>` tags and the `:` is removed.
## 4
Next I manually added in a root element. I just chose something simple such as `<xml>`. I saved the document as an xml file and reopened it. There was one formatting error that came up in this line of code: 
```
<sp><speaker><sd>MUSIC ... PUNCTUATES THE FOLLOWING</speaker></sd></sp>
```
It's clear that there is an overlapping tag, so I fixed this by hand. I removed the speaker tag as there is no speaker here, just stage directions. So now the line looks like this:
```
<sp><sd>MUSIC ... PUNCTUATES THE FOLLOWING</sd></sp>
```
The file is now well formed.
## 5
If I am understanding the bonus correctly, I am searching for standalone `<sd>` text that is also wrapped in an unnecessary `<sp>` tag. So I first searched with this to find out how many there are, `<sp><sd>`, I found 26 results. So I developed this find expression to grab the same 26 lines, `<sp>(<sd>.+?</sd>)</sp>`. I tested with and without Dot matches all, it did not matter if it was on or off. I kept it off. Since I had captured everything I wanted in the parathensis all I had to put in the replace window was `\1`. This got rid of the unwanted `<sp>` tags and that makes this step complete!
