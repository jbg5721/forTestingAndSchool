# Joey Gardiner XQuery 6

```
xquery version "3.1";
declare variable $blues := collection('/db/blues');
<html>
    <head>
        <title>Blues Collection</title>
    </head>
    <body>
    <h1>Blues Song Information</h1>
   <table>
        <tr><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    let $info := $blues[descendant::artist = $c]//songInfo ! normalize-space() => distinct-values() => sort()
        
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td><td>{$info}</td>
               
        </tr> 
   }
   </table>
</body>
    
</html>
```
To start off I am using similar code to the XQuery 5 assignment. This time I am using a world variable and I am trying to get each Artists song information to a line in one table section. 
So instead of there being a magnatude of each artists being listed, there is just one of each artist and all of their song info next to their name.
I wanted to try to get the info results to come out in a list so it was nicer to look at. This is what I tried:
```
xquery version "3.1";
declare variable $blues := collection('/db/blues');
<html>
    <head>
        <title>Blues Collection</title>
    </head>
    <body>
    <h1>Blues Song Information</h1>
   <table>
        <tr><th>Number</th><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    
        
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td>
          <td><ul>{let $info := $blues[descendant::artist = $c]//songInfo ! normalize-space() => distinct-values() => sort()
          for $i at $p in $info
              return
              <li>{$p}: {$i}</li>
          }
          </ul></td>
               
        </tr> 
   }
   </table>
</body>
    
</html>
```
Doing this works but this is escencially the same thing as Dr. B's example code so I am going to try to find a different way to go about this.
```
xquery version "3.1";
declare variable $blues := collection('/db/blues');
<html>
    <head>
        <title>Blues Collection</title>
    </head>
    <body>
    <h1>Blues Song Information</h1>
   <table>
        <tr><th>Number</th><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    
        
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td>
          <td><ol>{let $info := $blues[descendant::artist = $c]//songInfo ! normalize-space() => distinct-values() => sort()
          
              return
              <li> {$info}</li>
          }
          </ol></td>
               
        </tr> 
   }
   </table>
</body>
    
</html>
```
So I changed my `<ul>` into a `<ol>` and I removed the second for loop. When I tried this out, it mushed all the info together again.
So I added the for loop back but I simplified it to look like this `for $i in $info`
This got me the table cleaned up and easier to read.
```
xquery version "3.1";
declare variable $blues := collection('/db/blues');
<html>
    <head>
        <title>Blues Collection</title>
    </head>
    <body>
    <h1>Blues Song Information</h1>
   <table>
        <tr><th>Number</th><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    
        
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td>
          <td><ol>{let $info := $blues[descendant::artist = $c]//songInfo ! normalize-space() => distinct-values() => sort()
          for $i in $info
              return
              <li> {$i}</li>
          }
          </ol></td>
               
        </tr> 
   }
   </table>
</body>
    
</html>
```
This is what it currently looks like. I personally don't care much for the  numbering of the info results so I tried to see if it would work as an `<ul>`.
It does work just fine but the numbers allow it to be read much easier so it will be left as an `<ol>`.
I was curious if the let function inside of the `<ol>` brackets even needed to be there specifically and it does not.
```
xquery version "3.1";
declare variable $blues := collection('/db/blues');
<html>
    <head>
        <title>Blues Collection</title>
    </head>
    <body>
    <h1>Blues Song Information</h1>
   <table>
        <tr><th>Number</th><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    let $info := $blues[descendant::artist = $c]//songInfo ! normalize-space() => distinct-values() => sort()
        
    return 
       <tr>
          <td>{$pos}</td><td>{$c}</td>
          <td><ol>{for $i in $info
              return
              <li> {$i}</li>
          }
          </ol></td>
               
        </tr> 
   }
   </table>
</body>
    
</html>
```
So I moved it back under the first for loop. I also tested to see if the second for loop had to be in the brackets and it does. The code will not run otherwise.
## Final Code
```
xquery version "3.1";
declare variable $blues := collection('/db/blues');
<html>
    <head>
        <title>Blues Collection</title>
    </head>
    <body>
    <h1>Blues Song Information</h1>
   <table>
        <tr><th>Artist</th><th>Song Info</th><th></th></tr>
    {
    let $artist := $blues//artist ! normalize-space() => distinct-values() => sort()
        for $c at $pos in $artist
    let $info := $blues[descendant::artist = $c]//songInfo ! normalize-space() => distinct-values() => sort()
        
    return 
       <tr>
          <td></td><td>{$c}</td>
          <td><ol>{for $i in $info
              return
              <li> {$i}</li>
          }
          </ol></td>
               
        </tr> 
   }
   </table>
</body>
    
</html>
```
I removed the numbering on the left hand side in the end.