# Joey Gardiner Regex Exercise 1

Found every `&` and replaced with the xml code for it `&amp;`. 

Looked for possible `< >`, there were  none found in the document.

Put every line in a `<movie>` element using `^.+` in the find window and `<movie>\0</movie>`

Then placed a `<xml>` start and end tag to encapsulate the entire document.

Using `(<movie>)(.+?)\t` as the find and using `\1<title>\2</title>` as the replace, an element was added to each title throughout the document. Using the same process, an element was added to the year, country and runtime. In order to get the desired results however, the find and replace needs to be edited slightly as such:

Find `(</title>)(.+?)\t` and replace with `\1<year>\2</year>` to add year tag.
Find `(</year>)(.+?)\t` and replace with `\1<country>\2</country>` to add country tag.
It differs slightly when trying to add the runtime tags. I used find as `(</country>)(.+?)(</movie)` and replace with `\1<runtime>\2</runtime>\3` to add runtime tag.

