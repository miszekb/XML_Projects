<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="node()"/>

<xsl:template match="/">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head><title>TRANSFORM</title></head>
  <body>
  <h1>WYGENEROWANY DOKUMENT</h1>
  <!--Nagłówki-->
  <h4>Baza aut</h4>
  <table border="1">
    <tr>
      <th>Model</th>
      <th>Rocznik</th>
      <th>Typ</th>
      <th>Przebieg</th>
      <th>Rodzaj silnika</th>
      <th>Pojemność silnika</th>
      <th>Cena</th>
      <th>Data ogłoszenia</th>
    </tr>
    <xsl:for-each select="//samochód">
        <tr>
            <td><xsl:value-of select="model"/></td>
            <td><xsl:value-of select="rocznik"/></td>
            <td><xsl:value-of select="typ"/></td>
            <td><xsl:value-of select="przebieg"/></td>
            <td><xsl:value-of select="rodzaj_silnika"/></td>
            <td><xsl:value-of select="pojemność_silnika"/></td>
            <td><xsl:value-of select="cena"/>zł</td>
            <td><xsl:value-of select="data_umieszczenia_ogłoszenia"/></td>
        </tr>
        </xsl:for-each>
    </table>
      <h4>Baza marek</h4>
      <table border="1">
          <tr>
              <th>Model</th>
              <th>Rocznik</th>
          </tr>
          <xsl:for-each select="//marka">
              <tr>
                  <td><xsl:value-of select="koncern"/></td>
                  <td><xsl:value-of select="rok_założenia"/></td>
              </tr>
          </xsl:for-each>
      </table>
  </body>
  </html>
  </xsl:template>
 </xsl:stylesheet>
