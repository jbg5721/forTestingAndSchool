# Joey Gardiner

First I looked for `& < >`. Only `&` was the only one in the document so I replaced them all with `&amp;`

Next step was to look for multiple lines in a row. There was only one example of this and I found this by typing in `\n{3}` and then replacing it with `\n\n`. 

To grab each line I used `.+` then I used `<p>\0</p>` to encase everything with a p tag. I then went to wrap the Chapter titles in a `<heading>` tag instead of a `<p>` tag. I used `<p>(CHAPTER [IVXCL]+)</p>` to find all 27 chapter titles and replaced using  `<heading>\1</heading>`. 

I wrapped every *complete chapter* by searching with `<heading>` and then replacing with `</chapter><chapter>\0`. I then had to remove the extra closing tag at the top and add a closing tag at the very bottom.

I then went and replaced Dracula's p tags with title tags. To do this I could of just done it by hand but I used this instead:  `<p>(D R A C U L A)</p>` and then replaced it with `<title>\1</title>`. 

I added quotation tags around each quote throughout the document to do this I used `"(.+)"` and then I replaced with `<q>\1</q>`. This gave me no errors in the xml so I did not have to correct anything.

I attempted to tag the times but I knew I wasn't able to grab everything with my search. There are 27 times mentioned throughout the text and I was only able to grab 16 of them, I also wasn't able to grab the AM or PM. My find was `\d[0-9]?:[0-9]+` and my replace was `<time>\0</time>`.

To grab the dates I wrote this probably over complicated find: `\d[\w|\d|\s]*?\s[M|J|A|S|O|N]\w\w\w?\w?\w?\w?\w?\w?` but with it I was able to grab 187 dates throughout the document. I wasn't able to find if I missed anything but I also did not comb through the whole document. To replace I used this `<date>\0</date>`.