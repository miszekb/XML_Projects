<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <document>
      <Auta_posortowane>
        <xsl:for-each select="//samochód">
          <xsl:sort select="data_umieszczenia_ogłoszenia"/>
          <samochód>
            <LP_auta>
              <xsl:value-of select="position()"/>
            </LP_auta>
            <Marka_nazwa>
              <xsl:value-of select="//koncern[../@markaID = current()/marka_auta/@markaID]"/>
            </Marka_nazwa>
            <Model>
              <xsl:value-of select="model"/>
            </Model>
            <Rocznik>
              <xsl:value-of select="rocznik"/>
            </Rocznik>
            <Typ>
              <xsl:value-of select="typ"/>
            </Typ>
            <Przebieg>
              <xsl:value-of select="przebieg"/>
            </Przebieg>
            <Rodzaj_silnika>
              <xsl:value-of select="rodzaj_silnika"/>
            </Rodzaj_silnika>
            <Pojemność>
              <xsl:value-of select="pojemność_silnika"/>
            </Pojemność>
            <Cena>
              <xsl:value-of select="cena"/>
            </Cena>
            <Data_ogłoszenia>
              <xsl:value-of select="data_umieszczenia_ogłoszenia"/>
            </Data_ogłoszenia>
          </samochód>

        </xsl:for-each>
      </Auta_posortowane>

      <Liczba_wszystkich_aut>
        <xsl:value-of select="count(//samochód)"/>
      </Liczba_wszystkich_aut>
      <Suma_cen_wszystkich_aut>
        <xsl:value-of select="sum(//cena) "/>
      </Suma_cen_wszystkich_aut>
      <Liczba_volkswagenów>
        <xsl:value-of select="count(//marka_auta[@markaID = 'M1'])"/>
      </Liczba_volkswagenów>

      <Liczba_aut_danego_typu>
        <SUV>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'SUV'])"/>
        </SUV>
        <Sedan>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Sedan'])"/>
        </Sedan>
        <Coupe>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Coupe'])"/>
        </Coupe>
        <Minivan>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Minivan'])"/>
        </Minivan>
        <Auta_małe>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Auta małe'])"/>
        </Auta_małe>
        <Kombi>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Auta małe'])"/>
        </Kombi>
        <Kompakt>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Auta małe'])"/>
        </Kompakt>
        <Tir>
          <xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Auta małe'])"/>
        </Tir>
      </Liczba_aut_danego_typu>

      <Liczba_aut_rodzaj_silnika>
        <Diesel>
          <xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Diesel'])"/>
        </Diesel>
        <Benzyna>
          <xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Benzyna'])"/>
        </Benzyna>
        <Elektryczny>
          <xsl:value-of select="count(//rodzaj_silnika[../rodzaj_silnika = 'Elektryczny'])"/>
        </Elektryczny>
      </Liczba_aut_rodzaj_silnika>

      <Najstarsze_auto>
        <xsl:variable name="OldestCar">
          <xsl:for-each select="dokument/baza/samochód">
            <xsl:sort data-type="number" order="ascending" select="rocznik"/>
            <xsl:if test="position() = 1">
              <xsl:value-of select="."/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="$OldestCar"/>
      </Najstarsze_auto>

      <Najmłodsze_auto>
        <xsl:variable name="NewestCar">
          <xsl:for-each select="dokument/baza/samochód">
            <xsl:sort data-type="number" order="descending" select="rocznik"/>
            <xsl:if test="position() = 1">
              <xsl:value-of select="."/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="$NewestCar"/>
      </Najmłodsze_auto>

      <Data_wygenerowania_raportu>
        <xsl:value-of select="current-date()"/>
      </Data_wygenerowania_raportu>

      <Marki_posortowane>
        <xsl:for-each select="//marka">
          <xsl:sort select="count(//marka_auta[@markaID = current()/@markaID])" order="descending" data-type="number"/>
          <marka>
            <Lp_marki>
              <xsl:value-of select="position()"/>
            </Lp_marki>
            <Koncern>
              <xsl:value-of select="koncern"/>
            </Koncern>
            <Rok_założenia>
              <xsl:value-of select="rok_założenia"/>
            </Rok_założenia>
            <Liczba_aut_marki>
              <xsl:value-of select="count(//marka_auta[@markaID = current()/@markaID])"/>
            </Liczba_aut_marki>
            <Suma_cen_aut>
              <xsl:value-of select="sum(//cena[../marka_auta/@markaID = current()/@markaID])"/>
            </Suma_cen_aut>
          </marka>
        </xsl:for-each>
      </Marki_posortowane>
    </document>
  </xsl:template>
</xsl:stylesheet>
