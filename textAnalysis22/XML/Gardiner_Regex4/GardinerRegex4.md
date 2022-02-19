# Joey Gardiner REGEX 4
# Version 2

So I start out with the same strategy, searched for the one instance of more then 2 new lines with `\n{3,}` and replaced with this `\n\n` to just have two new lines after a text block.

I rerolled on creating a `<sp>` tag on each line and instead went for each text block. Using this `^(.+?)(\n\n)`, Ok I'll be honest, I didn't make this it came from the REGEX test. I wasn't quite sure how to fix the problem but seeing the expression I understand the method and the idea. You are searching for everything between two new lines. When Dot matches all is turned on, it will grab everything you want it too in one "find result" so to say. I was playing around with the inclusion of the `^` in this expression and it doesn't seem like it is necessary with this text document. So for the sake of it I used `(.+?)(\n\n)` with Dot matches all turned on, and got the same results and replaced it with this `<sp>\1</sp>\2`. Now all the text blocks are captured instead of each single line.

My original expression for the stage directions still worked just fine, I just needed to have Dot Matches All turned on. So the find expression was this `\[(.+?)\]` and the replace was this `<sd>\1</sd>`.

My expression for the speaker still works as well but Dot matches all needs to be turned **off**. SO the find expression is this `(<sp>)(.+?:)` and the replace expression is `\1<speaker>\2</speaker>`.

I entered the root element `<xml>` in by hand this time. I also edited the metadata at the top by hand. I removed the `<sp>` elements and wrapped it all in a `<source>` tag and then I added a `<title>` tag to the title of Mulan at the very top.
When loading up the file again there was a few instances of a standalone song que having tangled tags. Each of them had speaker tags that weren't needed so I deleted them.


# Version 1
First step as usual, I searched for any `& < >` throughout the document, there were none. 

Next I looked for any new lines three or higher with this `\n{3,}`. There was one instance of this and I used `\n\n` to replace it. Then I wrapped everything in a `<sp>` tag using `.+` to grab everything and then replaced it with `<sp>\0</sp>`. 

Next step I added a stage direction tag around every stage direction by using this `\[(.+?)\]` as the find and this `<sd>\1</sd>` as the replace. Then I added a speaker tag to every speaker throughout the document. To do this I used `(<sp>)(.+?:)` to find them all, and `\1<speaker>\2</speaker>` to replace them all. There were several instances where there were tangled tags, I fixed these by hand.

I added a root element by having **Dot matches all** turned on and searching `.+` then replacing with `<xml>\0</xml>`.

Lastly by hand I edited the source information at the top. I removed the `<sp>` elements and wrapped it all in a `<source>` tag and then I added a `<title>` tag to the title of Mulan at the very top.


