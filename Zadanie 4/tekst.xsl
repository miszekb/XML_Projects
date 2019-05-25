<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="text"/>
    <!--<xsl:result-document href="tekst.txt" method=text />-->
    <xsl:template match="/">

    
    <xsl:for-each select="//Auta_posortowane/samochód">

        <xsl:value-of select="LP_auta"/>
        <xsl:value-of select="Marka_nazwa"/>
        <xsl:value-of select="Model"/>
        <xsl:value-of select="Rocznik"/>
        <xsl:value-of select="Typ"/>
        <xsl:value-of select="Przebieg"/>
        <xsl:value-of select="Rodzaj_silnika"/>
        <xsl:value-of select="Pojemność"/>
        <xsl:value-of select="Cena"/>zł
        <xsl:value-of select="Data_ogłoszenia"/>

    </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>