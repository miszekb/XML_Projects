<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="node()"/>

<xsl:template match="/">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head><title>TRANSFORM</title></head>
  <body>
  <h1>WYGENEROWANY RAPORT</h1>
  <!--Nagłówki-->
  <h4>Auta posortowane według daty ogłoszenia (od najwcześniejszego)</h4>
  <table border="1">
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

    <xsl:for-each select="//Auta_posortowane/samochód">
      <tr>
        <td><xsl:value-of select="LP_auta"/></td>
        <td><xsl:value-of select="Marka_nazwa"/></td>
        <td><xsl:value-of select="Model"/></td>
        <td><xsl:value-of select="Rocznik"/></td>
        <td><xsl:value-of select="Typ"/></td>
        <td><xsl:value-of select="Przebieg"/></td>
        <td><xsl:value-of select="Rodzaj_silnika"/></td>
        <td><xsl:value-of select="Pojemność"/></td>
        <td><xsl:value-of select="Cena"/>zł</td>
        <td><xsl:value-of select="Data_ogłoszenia"/></td>
      </tr>
    </xsl:for-each>
  </table>
    <h4>Marki posortowane według ilości aut</h4>
    <table>
       <tr>
        <th>Lp.</th>
        <th>Marka</th>
        <th>Rok założenia</th>
        <th>Suma cen aut</th>
      </tr>
           <xsl:for-each select="//Marki_posortowane/marka">
            <tr>
              <td><xsl:value-of select="Lp_marki"/></td>
              <td><xsl:value-of select="Koncern" /></td>
              <td><xsl:value-of select="Rok_założenia" /></td>
              <td><xsl:value-of select="Liczba_aut_marki"/></td>
              <td><xsl:value-of select="Suma_cen_aut"/> zł</td>
            </tr>
           </xsl:for-each>
    </table border="1">
          <h3>Podsumowanie</h3>
          Liczba wszystkich samochodów: <b><xsl:value-of select="//Liczba_wszystkich_aut" /></b>
          <br></br>
          Suma cen wszystkich samochodów: <b><xsl:value-of select="//Suma_cen_wszystkich_aut"/> zł</b>
          <br></br>
          <br></br>
          Ilość aut danego typu: 
          <table border="1">
          <tr><th>Rodzaj silnika</th><th>Ilość</th></tr>
          <tr><td>SUV</td><td><xsl:value-of select="//Liczba_aut_danego_typu/SUV"/></td></tr>
            <tr><td>Sedan</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Sedan"/></td></tr>
            <tr><td>Coupe</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Coupe"/></td></tr>
            <tr><td>Minivan</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Minivan"/></td></tr>
            <tr><td>Auta małe</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Auta_małe"/></td></tr>
            <tr><td>Kombi</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Kombi"/></td></tr>
            <tr><td>Kompakt</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Kompakt"/></td></tr>
            <tr><td>Tir</td><td><xsl:value-of select="//Liczba_aut_danego_typu/Tir"/></td></tr>
          </table>
          <br></br>


          Ilość aut z danym rodzajem silnika:
          <table border="1">
          <tr><th>Rodzaj silnika</th><th>Ilość</th></tr>
          <tr><td>Diesel</td><td><xsl:value-of select="//Liczba_aut_rodzaj_silnika/Diesel"/></td></tr>
          <tr><td>Benzyna</td><td><xsl:value-of select="//Liczba_aut_rodzaj_silnika/Benzyna"/></td></tr>
          <tr><td>Elektryczny</td><td><xsl:value-of select="//Liczba_aut_rodzaj_silnika/Elektryczny"/></td></tr>
          </table>
          <br></br>
          Najstarsze i najmłodsze auto:
          <p>Najstarsze: <b><xsl:value-of select="//Najstarsze_auto" /></b></p>
          <p>Najmłodsze: <b><xsl:value-of select="//Najmłodsze_auto" /></b></p>
      <p>Data wygenerowania raportu: <b> <xsl:value-of select="//Data_wygenerowania_raportu"/></b></p>
  </body>
  </html>
  </xsl:template>
 </xsl:stylesheet>

