<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <!-- <xsl:variable name="Faction" select="distinct-values(faction/@ref)"/> --> 
    <xsl:template match="/">
        <html>
            <head>
                <title>The Oblivion Crisis</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <style type="text/css"> </style>
            </head>
            <body>
                <h1>The Oblivion Crisis</h1>
                <xsl:apply-templates select="descendant::para"/>
                    
            </body>
        </html>
    </xsl:template>
    <xsl:template match="para">
        <p id="skyrim-{count(preceding::para)+1}"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="event">
        <span class="event"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="item">
        <span class="item"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="char">
        <span class="char"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="soCalled">
        <span class="soCalled"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="place">
        <span class="place"><xsl:apply-templates/></span>
    </xsl:template>
    

    <xsl:template match="faction">
  
        <xsl:apply-templates select="//faction[@id=current()/@ref]"/>
        
         <span class="{@ref}"> <!-- jbg: if this @ref is changed to a @align, the other random span element that shows up next to the faction span elements in the html will become an @align. I can't really tell if I've gotten far and at this point I just want to figure out how to complete this puzzle.-->
             <xsl:apply-templates/>
         </span>
        
        
    </xsl:template>
    
    
    
    <!--
        This comment section is dedicated to the pieces that didn't quite fit
        <xsl:for-each select="faction/@ref">
                <xsl:value-of select="current()"/>
                <
            </xsl:for-each> 
            
            
    span class="{@ref}"> </span>
    
       
        <xsl:for-each select="faction/@ref">                    
            <span>
                <xsl:value-of select="faction/@id"/>
                <xsl:apply-templates />
            </span>
        </xsl:for-each>
        
        
        
    -->
    
</xsl:stylesheet>