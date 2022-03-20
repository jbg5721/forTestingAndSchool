# Joey Gardiner XQuery 4

## Experimentation

```
xquery version "3.1";
<html>
    <head>
        <title>Disney Songs</title>
    </head>
<body>
    <h1>Movie Titles with Their Composers and Lyricist.</h1>
   <table>
        <tr><th>No.</th><th>Movie Title</th><th>Composers</th><th>Lyricist</th></tr>
    {
    let $disneySongs := collection('/db/disneySongs/')
    let $movieT := $disneySongs//metadata/origin/title
    let $composers := $disneySongs//composer => distinct-values() => sort()
        for $c at $pos in $composers 
    let $lyricist := $disneySongs//lyricist => distinct-values() => sort()
        for $l at $pos in $lyricist
    return 
       <tr>
          <td>{$pos}</td><td>{$movieT}</td><td>{$c}</td><td>{$l}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
I wanted to try and make a table for every composer and lyricist alongside the respective movie title. This proved to create many errors in the results. Such as the numbering restarting and names where being repeated. 

```
xquery version "3.1";
<html>
    <head>
        <title>Disney Songs</title>
    </head>
<body>
    <h1>Song Titles with Their Composers and Lyricist.</h1>
   <table>
        <tr><th>No.</th><th>Movie Title</th><th>Composers</th><th>Lyricist</th></tr>
    {
    let $disneySongs := collection('/db/disneySongs/')
    let $movieT := $disneySongs//metadata/origin/title
    let $composers := $disneySongs//composer => distinct-values() => sort()
        for $c at $pos in $composers 
    let $lyricist := $disneySongs//lyricist => distinct-values() => sort()
        
    return 
       <tr>
          <td>{$pos}</td><td>{$movieT}</td><td>{$c}</td><td>{$lyricist}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
While documenting, I thought of something to fix the renumbering. Removing the for loop for lyricist actually fixed it, but now every lyricist is listed in each table.
```
xquery version "3.1";
<html>
    <head>
        <title>Disney Songs</title>
    </head>
<body>
    <h1>Movie Titles with Their Composers and Lyricist.</h1>
   <table>
        <tr><th>No.</th><th>Movie Title</th><th>Composers</th><th>Lyricist</th></tr>
    {
    let $disneySongs := collection('/db/disneySongs/')
    let $movieT := $disneySongs//metadata/origin/title
    let $composers := $disneySongs//composer => distinct-values() => sort()
        for $c at $pos in $composers 
    let $lyricist := $disneySongs//lyricist => distinct-values() => sort()
        for $l at $c in $lyricist
    return 
       <tr>
          <td>{$pos}</td><td>{$movieT}</td><td>{$c}</td><td>{$l}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
I tried adding back the for loop but instead of calling to pos, it calls to the c attribute instead. This just made the results look all funky and removed the composers with a list of numbers.
I then tried to make the c attribute `$composers` instead but that gave me every time a composers name is used. The number list on the side didn't seem to have a rhyme to it. 
I decided to try to get the movie titles to show up. This might help with my problem with the composers and lyricists. I realized that I had typed the wrong element in, I was using `//origin/title` instead of `//origin/movie`. This got the movie titles to show up.
My idea for adding lyricist in the table was not working how I wanted it to so I changed my aim. To add the song title, the movie it is in and the composer.
```
xquery version "3.1";
<html>
    <head>
        <title>Disney Songs</title>
    </head>
<body>
    <h1>grrr.</h1>
   <table>
        <tr><th>No.</th><th>Song Title</th><th>Movie Title</th><th>Composers</th></tr>
    {
    let $disneySongs := collection('/db/disneySongs/')
    let $song := $disneySongs//metadata/title => distinct-values() => sort()
        for $s at $pos in $song
    let $movieT := $disneySongs//origin/movie => distinct-values() => sort()
    let $composers := $disneySongs//composer => distinct-values() => sort()
        
    return 
       <tr>
          <td>{$pos}</td><td>{$s}</td><td>{$movieT}</td><td>{$composers}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
``` 
This actually works, but it gives very full text boxes. 
```
xquery version "3.1";
<html>
    <head>
        <title>Disney Songs</title>
    </head>
<body>
    <h1>grrr.</h1>
   <table>
        <tr><th>Movie Title</th><th>Song Title</th><th>Composers</th></tr>
    {
    let $disneySongs := collection('/db/disneySongs/')
        for $s in $disneySongs
        let $mt := $s//origin/movie => distinct-values() => sort()
        let $st := $s//title => distinct-values()
        let $comp := $s//composers 
        
    return 
       <tr>
          <td>{$mt}</td><td>{$st}</td><td>{$comp}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
I kind of hit reset and tried again, I felt like I was over complicating things and I would say I was. With this I get movie titles and the songs right next to them. Nothing comes up for composers however. The movie titles are not sorted either despite the sort function being in there. Removing the sort function doesn't change anything.
## Final Code
```
xquery version "3.1";
<html>
    <head>
        <title>Disney Songs</title>
    </head>
<body>
    <h1>Disney Movies with Their Songs and Composers</h1>
   <table>
        <tr><th>Movie Title</th><th>Song Title</th><th>Composers</th></tr>
    {
    let $disneySongs := collection('/db/disneySongs/')
        for $s in $disneySongs
        let $mt := $s//origin/movie => distinct-values()
        let $st := $s//title => distinct-values()
        let $comp := $s//author/composer => distinct-values()
        
    return 
       <tr>
          <td>{$mt}</td><td>{$st}</td><td>{$comp}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
This code gives me the movies, the songs in the movies and the composer that wrote the song. Some songs had more then 1 composer.