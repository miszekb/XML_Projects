<?xml version="1.0"?>

<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns="http://www.w3.org/2000/svg"
		>
  
  <xsl:output
      method="xml"
      indent="yes"
      standalone="no"
      doctype-public="-//W3C//DTD SVG 1.1//EN"
      doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
      media-type="image/svg" />
  

  <xsl:strip-space elements="list"/>
  
  <xsl:variable name="svg_width" select="1000"/>
  <xsl:variable name="svg_height" select="1000"/>
  <xsl:variable name="padding" select="5"/>

  <xsl:variable name ="y_steps">
    <xsl:for-each select="//Liczba_aut_danego_typu/*">
      <xsl:sort select="." data-type="number" order="descending"/>
      <xsl:if test="position() = 1">
	<xsl:value-of select="($svg_height - $padding) div 16"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name ="y_stepsEngine">
    <xsl:for-each select="//Liczba_aut_rodzaj_silnika/*">
      <xsl:sort select="." data-type="number" order="descending"/>
      <xsl:if test="position() = 1">
	<xsl:value-of select="($svg_height - $padding) div 48"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="x_width"
		select="($svg_width - 4*$padding) div (4*count(//Liczba_aut_danego_typu/*))"/>

  <xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg"
	 width="{$svg_width}" height="{$svg_height}" >
      y_steps = <xsl:value-of select="$y_steps"/>
      <rect x="1" 
	    y="1" 
	    width="1000" 
	    height="1000" 
	    fill="#e3eaa7"/>
      <xsl:apply-templates/>
    <text x="450" y="160" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 28px;">Ilość aut danego typu</text>
    <text x="450" y="500" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 28px;">Ilość aut z danym silnikiem</text>
    
    <text x="10" y="850" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;">Ilość wszystkich aut:</text>       
    <text x="10" y="875" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;">Najstarsze auto:</text>
    <text x="10" y="900" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;">Najmłodsze auto:</text>
    <text x="10" y="950" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;">Suma cen wszystkich aut:</text>
    <text x="10" y="975" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;">Ilość volkswagenów:</text>

    <text x="200" y="850" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;"><xsl:value-of select="//Liczba_wszystkich_aut"/></text>       
    <text x="200" y="875" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;"><xsl:value-of select="//Najstarsze_auto"/></text>
    <text x="200" y="900" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;"><xsl:value-of select="//Najmłodsze_auto"/></text>
    <text x="200" y="950" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;"><xsl:value-of select="//Suma_cen_wszystkich_aut"/> zł</text>
    <text x="200" y="975" fill="black" style="font-family:Calibri; font-weight: bold; font-size: 16px;"><xsl:value-of select="//Liczba_volkswagenów"/></text>

    </svg>
  </xsl:template>
  

  
  <xsl:template match="//Liczba_aut_danego_typu/*">
    <rect x="{$padding + $x_width * (position() - 1) }"
	  y="{($svg_height - $padding) - $y_steps * . - 600}" 
	  width="{$x_width}" 
	  height="{(. * $y_steps)}"
	  fill="#86af49" />  
    <rect x="0"
	  y="400" 
	  width="600" 
	  height="5"
	  fill="black"/>
  </xsl:template>

  <xsl:template match="//Liczba_aut_rodzaj_silnika/*">
    <rect x="{$padding + $x_width * (position() - 1) }"
	  y="{($svg_height - $padding) - $y_stepsEngine * . - 250}" 
	  width="{$x_width}" 
	  height="{(. * $y_stepsEngine)}"
	  fill="#86af49" />  
    <rect x="0"
	  y="750" 
	  width="600" 
	  height="5"
	  fill="black"/>
  </xsl:template>
  
</xsl:stylesheet>
