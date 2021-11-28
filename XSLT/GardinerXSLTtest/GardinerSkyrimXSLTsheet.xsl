<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
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
    
    <xsl:template match="faction[@ref='MythicDawn']">
        <span class="{@ref}">
            
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="faction[@ref='blades']">
        <span class="blades"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="faction[@ref='daedra']">
        <span class="daedra"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="faction[@ref='empire']">
        <span class="empire"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="faction[@ref='DarkBrotherhood']">
        <span class="DarkBotherbood"><xsl:apply-templates/></span>
    </xsl:template>
    
    
    
</xsl:stylesheet>