# Joey Gardiner XQuery 5

## Experimentation

To start I just made sure that it was working with this. It was.
```
xquery version "3.1";
let $blues := collection('/db/blues')
return $blues
```

I went to look through the document while putting stuff in a table using this:
```
xquery version "3.1";
<html>
    <head>
        <title>Blues Songs</title>
    </head>
<body>
    <h1></h1>
   <table>
        <tr><th>No.</th><th>Artist</th><th></th><th></th></tr>
    {
    let $blues := collection('/db/blues')
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
This outputs a html page with a table that has a position and each artists name. 
I wanted to look at the artist and the song information.
```
xquery version "3.1";
<html>
    <head>
        <title>Blues Songs</title>
    </head>
<body>
    <h1></h1>
   <table>
        <tr><th>No.</th><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $blues := collection('/db/blues')
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    let $info := $blues//songInfo ! normalize-space() => distinct-values() => sort()
        for $i at $artist in $info
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td><td>{$i}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
```
This is the code that I used to make this work. Since each artist has a magnitude of song information, the Artist and position number is repeated.
I thought the repeating numbers was kind of pointless so I removed them simply with this code:
## Final Code
```
xquery version "3.1";
<html>
    <head>
        <title>Blues Songs</title>
    </head>
<body>
    <h1></h1>
   <table>
        <tr><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $blues := collection('/db/blues')
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    let $info := $blues//songInfo ! normalize-space() => distinct-values() => sort()
        for $i at $artist in $info
    return 
       <tr>
          <td>{$c}</td><td>{$i}</td>
               
        </tr> 
   }
   </table>
</body>
</html>
``` 
This gets me the artists name and all their song info.