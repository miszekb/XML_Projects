<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head><title>TRANSFORM</title></head>
<body>
<h1 align="center">WYGENEROWANY RAPORT</h1>
<!--Nagłówki-->
<h4>Auta posortowane według daty ogłoszenia (od najwcześniejszego)</h4>
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
        <h3 align="left">Podsumowanie</h3>
        Ilość wszystkich samochodów: <b><xsl:value-of select="count(//samochód)" /></b>
        <br></br>
        Suma cen wszystkich samochodów: <b><xsl:value-of select="sum(//cena)"/> zł</b>
        <br></br>
        Ilość volkswagenów: <b><xsl:value-of select="count(//marka_auta[@markaID='M1'])"/></b>
        <br></br>
        Ilość aut danego typu: 
         <table border="1">
         <tr><th>Rodzaj silnika</th><th>Ilość</th></tr>
        <tr><td>SUV</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ = 'SUV'])"/></td></tr>
        <tr><td>Sedan</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Sedan'])"/></td></tr>
        <tr><td>Coupe</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Coupe'])"/></td></tr>
        <tr><td>Minivan</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Minivan'])"/></td></tr>
        <tr><td>Auta małe</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Auta małe'])"/></td></tr>
        <tr><td>Kombi</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Kombi'])"/></td></tr>
        <tr><td>Kompakt</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Kompakt'])"/></td></tr>
        <tr><td>Tir</td><td><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Tir'])"/></td></tr>
        </table>
        <br></br>


        Ilość aut z danym rodzajem silnika:
        <table border="1">
        <tr><th>Rodzaj silnika</th><th>Ilość</th></tr>
        <tr><td>Diesel</td><td><xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Diesel'])"/></td></tr>
        <tr><td>Benzyna</td><td><xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Benzyna'])"/></td></tr>
        <tr><td>Elektryczny</td><td><xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Elektryczny'])"/></td></tr>
        </table>
        <br></br>
        Najstarsze i najmłodsze auto:
        <xsl:variable name="OldestCar">
        <xsl:for-each select="dokument/baza/samochód">
          <xsl:sort data-type="number" order="ascending" select="rocznik"/>
          <xsl:if test="position()=1">
            <xsl:value-of select="." />
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <p>Najstarsze: <b><xsl:value-of select="$OldestCar" /></b></p>
      <xsl:variable name="NewestCar">
        <xsl:for-each select="dokument/baza/samochód">
          <xsl:sort data-type="number" order="descending" select="rocznik"/>
          <xsl:if test="position()=1">
            <xsl:value-of select="." />
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
     <p>Najmłodsze: <b><xsl:value-of select="$NewestCar" /></b></p>
     <p>Data wygenerowania raportu: <b></b></p>
</table>
</body>
</html>
</xsl:template>

<!-- wyświetlanie wszystkich aut z bazy -->
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
    <td><xsl:value-of select="cena" /> zł</td>
    <td><xsl:value-of select="data_umieszczenia_ogłoszenia" /></td>
  </tr>
 </xsl:for-each>
 </xsl:template>

<!-- schowanie niepotrzebnych danych -->
<xsl:template match="autorzy/*" priority="0" />
<xsl:template match="zmiany/*" priority="0" />


 <xsl:template match="marki">
 <table border="1" align="center">
<tr>
        <th>Lp.</th>
        <th>Koncern</th>
        <th>Rok założenia</th>
        <th>Ilość aut tej marki</th>
        <th>Łączna cena aut tej marki</th>
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
    <td><xsl:value-of select="sum(//cena[../marka_auta/@markaID=current()/@markaID])"/> zł</td>
 </tr>
 </xsl:for-each>
  </table>
<br></br>
 </xsl:template>
 </xsl:stylesheet>













