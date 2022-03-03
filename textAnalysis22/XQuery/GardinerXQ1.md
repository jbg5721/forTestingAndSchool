# Joey Gardiner XQuery 1

## 1
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//titleStmt/title
```
This is what I used to find all 42 titles in the collection.
## 2
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//titleStmt/title/text()
```
This is what I used to get just the blank text. 
## 3
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//TEI
```
To get the TEI root all you need to do is this, however the assignment wants it to be isolated, I'm not sure how to do that.
## 4
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//TEI//speaker[text()= "Falstaff"]
```
I used this to find every Falstaff. There are 473 of them.
## 5
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//titleStmt/title[speaker[text()="Falstaff"]]
```
I tried  this but I wasn't getting any results. There were a few other iterations I went through but also got no results.
## 6
```

```
## 7
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//TEI//speaker[text() ="Falstaff"]/following-sibling::ab
```
This returns all of Falstaffs lines. There are 1737 of them. However I found an issue there there are 36 lines that use the element `<l>` instead of `<ab>`. I don't know how to search for both at the same time.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
collection('/db/apps/shakespeare/data/')//TEI//speaker[text() ="Falstaff"]/count(following-sibling::ab)
```
This counts all of Falstaffs lines, it gives the number 1737.
## 8
Well I certainly used a long Xpath expression for this exercise.
I tried to use FLWOR with question 1 and got the same results.
```
xquery version "3.1";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $shake := collection('/db/apps/shakespeare/data/')/*
let $shakeTitle := $shake //titleStmt/title
return $shakeTitle
```
