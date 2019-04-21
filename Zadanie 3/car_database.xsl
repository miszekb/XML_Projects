<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head><title>TRANSFORM</title></head>
<body>
<!--Nagłówki-->
<table border="1" align="center">
      <tr>
        <th>Lp.</th>
        <th>Marka</th>
        <th>Model</th>
        <th>Rocznik</th>
        <th>Typ</th>
        <th>Przebieg</th>
        <th>Rodzaj silnika</th>
        <th>Pojemność silnika</th>
        <th>Cena</th>
        <th>Data ogłoszenia</th>
      </tr>
        <xsl:apply-templates/>
        <br></br>
        Ilość wszystkich samochodów: <b><xsl:value-of select="count(//samochód)" /></b>
        <br></br>
        Suma cen wszystkich samochodów: <b><xsl:value-of select="sum(//cena)"/> zł</b>
        <br></br>
        Ilość volkswagenów: <b><xsl:value-of select="count(//marka_auta[@markaID='M1'])"/></b>
        <br></br>
        Ilość volkswagenów: <b><xsl:value-of select="count(//marka_auta[@markaID='M1'])"/></b>
        <br></br>


        Ilość aut z danym rodzajem silnika:
        <table border="1">
        <tr><th>Rodzaj</th><th>Ilość</th></tr>
        <tr><td>Diesel</td><td><xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Diesel'])"/></td></tr>
        <tr><td>Benzyna</td><td><xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Benzyna'])"/></td></tr>
        <tr><td>Elektryczny</td><td><xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Elektryczny'])"/></td></tr>
        </table>

        Najstarsze i najmłodsze auto:
        <xsl:variable name="OldestCar">
        <xsl:for-each select="dokument/baza/samochód">
          <xsl:sort data-type="number" order="ascending" select="rocznik"/>
          <xsl:if test="position()=1">
            <xsl:value-of select="." />
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <p><xsl:value-of select="$OldestCar" /></p>
      <xsl:variable name="NewestCar">
        <xsl:for-each select="dokument/baza/samochód">
          <xsl:sort data-type="number" order="descending" select="rocznik"/>
          <xsl:if test="position()=1">
            <xsl:value-of select="." />
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
     <p><xsl:value-of select="$NewestCar" /></p>
      
</table>
</body>
</html>
</xsl:template>


 <xsl:template match="baza">
  <xsl:for-each select="samochód">
      <xsl:sort select="data_umieszczenia_ogłoszenia"/>
      <tr>
    <td><xsl:value-of select="position()"/></td>
    <td><xsl:value-of select="//koncern[../@markaID = current()/marka_auta/@markaID]" /></td>
    <td><xsl:value-of select="model" /></td>
    <td><xsl:value-of select="rocznik" /></td>
    <td><xsl:value-of select="typ" /></td>
    <td><xsl:value-of select="przebieg" /></td>
    <td><xsl:value-of select="rodzaj_silnika" /></td>
    <td><xsl:value-of select="pojemność_silnika" /></td>
    <td><xsl:value-of select="cena" /></td>
    <td><xsl:value-of select="data_umieszczenia_ogłoszenia" /></td>
  </tr>
 </xsl:for-each>

 </xsl:template>


 <xsl:template match="marki">
 <br></br>
 <table border="1" align="center">
<tr>
        <th>Lp.</th>
        <th>Koncern</th>
        <th>Rok założenia</th>
        <th>Ilość aut tej marki</th>
      </tr>
 <xsl:for-each select="marka">
 <xsl:sort select="count(//marka_auta[@markaID=current()/@markaID])" 
  order="descending" 
  data-type="number"/>
 <tr>
    <td><xsl:value-of select="position()"/></td>
    <td><xsl:value-of  select="koncern" /></td>
    <td><xsl:value-of  select="rok_założenia" /></td>
    <td><xsl:value-of select="count(//marka_auta[@markaID=current()/@markaID])"/></td>
 </tr>
 </xsl:for-each>
  </table>
<br>></br>
 </xsl:template>


 </xsl:stylesheet>













