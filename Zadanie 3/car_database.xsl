<?xml version="1.0" encoding="UTF-8"?>
 <xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" encoding="utf-8"/>

<xsl:template match="/">
        
        <Ilość_wszystkich_samochodów><xsl:value-of select="count(//samochód)" /></Ilość_wszystkich_samochodów>
        <Suma_cen_wszystkich_samochodów><xsl:value-of select="sum(//cena)" /></Suma_cen_wszystkich_samochodów>
        <Ilość_volkswagenów><xsl:value-of select="count(//marka_auta[@markaID='M1'])"/></Ilość_volkswagenów>

        <Ilość_aut_danego_typu>
          <SUV><xsl:value-of select="count(//dokument/baza/samochód[./typ = 'SUV'])"/></SUV>
          <Sedan><xsl:value-of select="count(//dokument/baza/samochód[./typ = 'Sedan'])"/></Sedan>
          <Coupe><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Coupe'])"/></Coupe>
          <Minivan><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Minivan'])"/></Minivan>
          <Auta_małe><xsl:value-of select="count(//dokument/baza/samochód[./typ  = 'Auta małe'])"/></Auta_małe>
         
        </Ilość_aut_danego_typu>
</xsl:template>
 </xsl:stylesheet>













