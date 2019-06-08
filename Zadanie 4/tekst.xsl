<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="text"/>
    <!--<xsl:result-document href="tekst.txt" method=text />-->
    <xsl:template match="/">
    <xsl:text>Auta posortowane</xsl:text>
    <xsl:text>&#xA;&#x9;</xsl:text>
    
    <xsl:for-each select="//Auta_posortowane/samochód">
        <xsl:value-of select="LP_auta"/>
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="5 - string-length(LP_auta)"/>
            </xsl:call-template>
        <xsl:value-of select="Marka_nazwa"/>
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="12 - string-length(Marka_nazwa)"/>
            </xsl:call-template>
        <xsl:value-of select="Model"/>
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="20 - string-length(Model)"/>
            </xsl:call-template>
        <xsl:value-of select="Rocznik"/>
         <xsl:text>&#x20;&#x20;</xsl:text>
        <xsl:value-of select="Typ"/>
         <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="10 - string-length(Typ)"/>
            </xsl:call-template>
        <xsl:value-of select="Przebieg"/>
         <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="10 - string-length(Przebieg)"/>
            </xsl:call-template>
        <xsl:value-of select="Rodzaj_silnika"/>
         <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="15 - string-length(Rodzaj_silnika)"/>
            </xsl:call-template>
        <xsl:value-of select="Pojemność"/>
        <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="8 - string-length(Pojemność)"/>
            </xsl:call-template>
        <xsl:value-of select="Cena"/> zł
        </xsl:for-each>
        <xsl:text>===============================================================================================&#xA;</xsl:text>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>Ilość wszystkich aut: </xsl:text><xsl:value-of select="//Liczba_wszystkich_aut" />
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>Suma cen wszystkich aut: </xsl:text><xsl:value-of select="//Suma_cen_wszystkich_aut"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>Najstarsze auto: </xsl:text><xsl:value-of select="//Liczba_wszystkich_aut" />
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>Najmłodsze auto: </xsl:text><xsl:value-of select="//Liczba_wszystkich_aut" />
        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:text>Data wygenerowania raportu: </xsl:text><xsl:value-of select="//Liczba_wszystkich_aut" />
        <xsl:text>&#xA;&#xA;</xsl:text>

        <xsl:text>Ilość aut danego typu &#xA;</xsl:text>
            <xsl:text>Typ auta       Ilość</xsl:text>
            <xsl:text>&#xA;SUV              </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/SUV"/>
            <xsl:text>&#xA;Sedan            </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Sedan"/>
            <xsl:text>&#xA;Coupe            </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Coupe"/>
            <xsl:text>&#xA;Minivan          </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Minivan"/>
            <xsl:text>&#xA;Auta małe        </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Auta_małe"/>
            <xsl:text>&#xA;Kombi            </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Kombi"/>
            <xsl:text>&#xA;Kompakt          </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Kompakt"/>
            <xsl:text>&#xA;Tir              </xsl:text><xsl:value-of select="//Liczba_aut_danego_typu/Tir"/>

        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:text>Ilość aut z danym rodzajem silnika&#xA;</xsl:text>
            <xsl:text>Rodzaj silnika     Ilość</xsl:text>
            <xsl:text>&#xA;Diesel             </xsl:text><xsl:value-of select="//Liczba_aut_rodzaj_silnika/Diesel"/>
            <xsl:text>&#xA;Benzyna            </xsl:text><xsl:value-of select="//Liczba_aut_rodzaj_silnika/Benzyna"/>
            <xsl:text>&#xA;Elektryczny        </xsl:text><xsl:value-of select="//Liczba_aut_rodzaj_silnika/Elektryczny"/>

        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:text>Posortowane marki aut&#xA;</xsl:text>
        <xsl:text>Lp.  Nazwa          Ilość aut   Suma cen&#xA;</xsl:text>
        <xsl:for-each select="//Marki_posortowane/marka">
            <xsl:value-of select="Lp_marki"/>
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="5 - string-length(Lp_marki)"/>
            </xsl:call-template>
            <xsl:value-of select="Koncern"/>
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="15 - string-length(Koncern)"/>
            </xsl:call-template>
            <xsl:value-of select="Liczba_aut_marki"/>
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="12 - string-length(Liczba_aut_marki)"/>
            </xsl:call-template>
            <xsl:value-of select="Suma_cen_aut"/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="odstep">
    <xsl:param name="length"/>
    <xsl:param name="string" select="' '"/>
    <xsl:value-of select="$string"/>
        <xsl:if test="$length > 1">
            <xsl:call-template name="odstep">
                <xsl:with-param name="length" select="$length - 1"/>
                <xsl:with-param name="string" select="$string"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>