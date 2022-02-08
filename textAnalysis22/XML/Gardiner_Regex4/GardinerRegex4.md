# Joey Gardiner REGEX 4

First step as usual, I searched for any `& < >` throughout the document, there were none. 

Next I looked for any new lines three or higher with this `\n{3,}`. There was one instance of this and I used `\n\n` to replace it. Then I wrapped everything in a `<sp>` tag using `.+` to grab everything and then replaced it with `<sp>\0</sp>`. 

Next step I added a stage direction tag around every stage direction by using this `\[(.+?)\]` as the find and this `<sd>\1</sd>` as the replace. Then I added a speaker tag to every speaker throughout the document. To do this I used `(<sp>)(.+?:)` to find them all, and `\1<speaker>\2</speaker>` to replace them all. There were several instances where there were tangled tags, I fixed these by hand.

I added a root element by having **Dot matches all** turned on and searching `.+` then replacing with `<xml>\0</xml>`.

Lastly by hand I edited the source information at the top. I removed the `<sp>` elements and wrapped it all in a `<source>` tag and then I added a `<title>` tag to the title of Mulan at the very top.
