<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:datetime="http://www.exslt.org/datetime"
	extension-element-prefixes="datetime">

<xsl:import href="datetime.year.xsl"/>

<xsl:template match="/">
   <xsl:value-of select="datetime:year()"/>
</xsl:template>

</xsl:stylesheet>