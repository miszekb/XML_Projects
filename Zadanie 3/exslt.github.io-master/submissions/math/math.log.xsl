<?xml version="1.0" encoding="utf-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:func="http://exslt.org/functions" 
xmlns:math="http://exslt.org/math" version="1.0" 
math:doc="http://www.exslt.org/math"
extension-element-prefixes="math">
	
<import href="math.log.msxslt.xsl"/> 
<func:script language="exslt:javascript" implements-prefix="math" src="math.log.js"/>
</stylesheet>