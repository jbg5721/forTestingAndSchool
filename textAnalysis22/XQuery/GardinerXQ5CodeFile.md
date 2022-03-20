# Joey Gardiner XQuery 5 Code File

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