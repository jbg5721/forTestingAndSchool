xquery version "3.1";
declare variable $ySpacer := 10;
declare variable $xSpacer := 30;

<svg width="1000" height="1000">
<g transform="translate(30, 600)">

{
let $ac := doc('/db/assassinsCreed/assassinscreedodyssey.xml')/script
let $sections := $ac/*
for $s at $pos in $sections
let $spks := $s//speaker ! normalize-space() => distinct-values() => count()
let $actions := $s//action => count()
return 
    (: concat($spks, ": ", $actions ):)
<g>
    <line x1="{$pos * $xSpacer}" x2="{$pos * $xSpacer}" y1="0" y2="-{$actions * $ySpacer}" stroke="red" stroke-width="25"/><text x="{$pos * $xSpacer}" y="-{$actions * $ySpacer}" fill="#2d6d86" font-size="16">{$actions}</text>
    </g>
    
}
<polygon points="290,-440 260,-500 670,-500 640,-440" style="fill:#edbe82;" />
<text x="300" y="-450" fill="#000" font-size="50">Assassins Creed</text>
<text x="380" y="40" fill="#626262" font-size="30">Chapters</text>
<text x="10" y="-50" fill="#626262" font-size="30" transform="rotate(270 10,-50)">Actions</text>
</g>
</svg>