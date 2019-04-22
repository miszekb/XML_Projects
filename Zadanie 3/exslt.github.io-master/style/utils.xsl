<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:vcf="http://www.ietf.org/internet-drafts/draft-dawson-vcard-xml-dtd-03.txt"
                exclude-result-prefixes="html exslt rdf dc xs vcf">

<xsl:preserve-space elements="xslt" />
<xsl:strip-space elements="*" />

<xsl:param name="today" />
<xsl:variable name="modules" select="document('../modules.xml')/exslt:modules/exslt:module" />

<xsl:template name="new-page">
   <xsl:param name="dir" />
   <xsl:param name="href" />
   <xsl:param name="title" />
   <xsl:param name="menu" />
	<xsl:param name="content" />
   <xsl:param name="last-modified" />
   <xsl:document href="{$href}" 
                 doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                 doctype-system="/schema/xhtml1-strict.dtd"
                 encoding="ISO-8859-1" >
      <html>
         <head>
            <title><xsl:value-of select="$title" /></title>
            <link rel="stylesheet" href="base.css"/>
         </head>
         <body>
            <h1 id="#title"><xsl:copy-of select="$title" /></h1>
            <table>
               <tr>
                  <td id="menu">
                     <xsl:copy-of select="$menu" />
                  </td>
                  <td id="content">
                     <xsl:copy-of select="$content" />
                  </td>
               </tr>
            </table>
            <div id="colophon">
               <xsl:variable name="url" select="concat('http://www.exslt.org/', $dir, $href)" />
               <p>
                  <a href="{$url}"><xsl:value-of select="$url" /></a>
                  <xsl:if test="$last-modified">
                     <xsl:text> last modified </xsl:text>
                     <xsl:value-of select="$last-modified" />
                  </xsl:if>
               </p>
            </div>
         </body>
      </html>
   </xsl:document>
</xsl:template>

<xsl:template name="menu">
   <xsl:param name="module" />
   <xsl:param name="extension" />
   <xsl:param name="type" select="'developer'" />
   <xsl:variable name="dir">
      <xsl:if test="$module or $type = 'submissions'">../</xsl:if>
      <xsl:if test="$extension">../../</xsl:if>
   </xsl:variable>
   <xsl:if test="$type != 'common' and $type != 'submissions'">
      <p class="level1">
         <xsl:variable name="alternate">
            <xsl:choose>
               <xsl:when test="$type = 'home'">exslt.html</xsl:when>
               <xsl:when test="$type = 'user'">
                  <xsl:choose>
                     <xsl:when test="$extension"><xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.html</xsl:when>
                     <xsl:when test="$module"><xsl:value-of select="$module" />.html</xsl:when>
                  </xsl:choose>
               </xsl:when>
               <xsl:otherwise>index.html</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <a href="{$alternate}">
            <xsl:choose>
               <xsl:when test="$type = 'home' or $type = 'user'">Implementer Page</xsl:when>
               <xsl:otherwise>User Page</xsl:otherwise>
            </xsl:choose>
         </a>
      </p>
   </xsl:if>
   <p class="level1"><a href="{$dir}howto.html">How To</a></p>
   <p class="level1"><a href="{$dir}download.html">Downloads</a></p>
   <p class="level1">Modules</p>
   <xsl:for-each select="$modules">
      <xsl:sort select="@prefix" />
      <xsl:variable name="modl" select="@prefix" />
      <xsl:variable name="module-XML" select="document(concat($modl, '/', $modl, '.xml'), .)/exslt:module" />
      <xsl:variable name="extensions" select="$module-XML/exslt:functions/exslt:function | $module-XML/exslt:elements/exslt:element" />
      <!--
      <xsl:variable name="user-content">
         <xsl:choose>
            <xsl:when test="@core = 'yes'">true</xsl:when>
            <xsl:when test="$type != 'user' and $type != 'home'">true</xsl:when>
            <xsl:otherwise>
               <xsl:for-each select="$extensions">
                  <xsl:variable name="ext-XML" select="document(concat(local-name(..), '/', @name, '/', $modl, '.', @name, '.xml'), .)/*" />
                  <xsl:if test="$ext-XML/exslt:implementations/*">true</xsl:if>
               </xsl:for-each>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="string($user-content)">
      -->
         <p class="level2">
            <xsl:variable name="module-URL">
               <xsl:choose>
                  <xsl:when test="$type = 'user' or $type = 'home' or $type = 'common'">index</xsl:when>
                  <xsl:otherwise><xsl:value-of select="@prefix" /></xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <a href="{$dir}{$modl}/{$module-URL}.html">
               <xsl:value-of select="$module-XML/exslt:name" />
            </a>
         </p>
         <xsl:if test="$module = $modl">
            <xsl:variable name="mod-dir">
               <xsl:if test="$extension">../../</xsl:if>
            </xsl:variable>
            <xsl:for-each select="$extensions">
               <xsl:sort select="boolean(self::exslt:element)" />
               <xsl:sort select="@name" />
               <xsl:variable name="etype" select="local-name(..)" />
               <!--
               <xsl:if test="$type != 'user' or @core = 'yes' or $extension-XML/exslt:implementations/*">
               -->
                  <p class="level3">
                     <xsl:variable name="extension-URL">
                        <xsl:choose>
                           <xsl:when test="$type = 'user'">index</xsl:when>
                           <xsl:otherwise><xsl:value-of select="concat($module, '.', @name)" /></xsl:otherwise>
                        </xsl:choose>
                     </xsl:variable>
                     <a href="{$mod-dir}{$etype}/{@name}/{$extension-URL}.html">
                        <xsl:value-of select="$module" />:<xsl:value-of select="@name" />
                        <xsl:if test="self::exslt:function">()</xsl:if>
                     </a>
                     <!-- <xsl:text />(<a href="{$mod-dir}{$etype}/{@name}/{$module}.{@name}.html">dev</a>)<xsl:text /> -->
                  </p>
                  <xsl:if test="$extension = @name">
                     <xsl:variable name="extension-XML" select="document(concat($etype, '/', @name, '/', $module, '.', @name, '.xml'), .)/*" />
                     <xsl:choose>
                        <xsl:when test="$type = 'use-case'">
                           <xsl:for-each select="$extension-XML/exslt:use-cases/exslt:use-case">
                              <xsl:variable name="number">
                                 <xsl:number />
                              </xsl:variable>
                              <p class="level4">
                                 <a href="{$mod-dir}{$etype}/{$extension}/{$module}.{$extension}.use-case.{$number}.html">
                                    <xsl:text>Use Case </xsl:text>
                                    <xsl:value-of select="$number" />
                                 </a>
                              </p>
                           </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="$type = 'implementation'">
                           <xsl:for-each select="$extension-XML/exslt:implementations/exslt:implementation">
                              <p class="level4">
                                 <a href="{$mod-dir}{$etype}/{$extension}/{@src}.html">
                                    <xsl:apply-templates select="." mode="language" />                           
                                 </a>
                              </p>
                           </xsl:for-each>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:if>
               <!-- </xsl:if> -->
            </xsl:for-each>
         </xsl:if>
      <!-- </xsl:if> -->
   </xsl:for-each>
   <p class="level1"><a href="{$dir}submissions/">Submissions</a></p>
   <p class="level1"><a href="{$dir}list">Mailing List</a></p>
   <p class="level1"><a href="{$dir}contact.html">Contact</a></p>
</xsl:template>

<xsl:template match="exslt:implementation" mode="language">
   <xsl:choose>
      <xsl:when test="@language = 'exslt:exslt'">EXSLT Function</xsl:when>
      <xsl:when test="@language = 'exslt:xslt'">XSLT Template</xsl:when>
      <xsl:otherwise>
         <xsl:variable name="lang" select="substring-after(@language, ':')" />
         <xsl:value-of select="translate(substring($lang, 1, 1), $lc, $uc)" />
         <xsl:value-of select="substring($lang, 2)" />
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="rdf:Description">
   <h2>Change History</h2>
   <xsl:choose>
      <xsl:when test="../@version = 1">
         <p>
            <b>Submitted: </b>
            <xsl:apply-templates select="exslt:revision[1]/rdf:Description/dc:date" /><br />
            <b>Creator: </b>
            <xsl:apply-templates select="exslt:revision[1]/rdf:Description/dc:creator" mode="with-url" />
         </p>
         <xsl:apply-templates select="exslt:revision[1]/rdf:Description/dc:description" />
         <xsl:if test="exslt:revision[2]">
            <table>
               <tr>
                  <th class="rowhead">Version</th>
                  <th>Modified</th>
                  <th>By</th>
                  <th>Details</th>
               </tr>
               <xsl:for-each select="exslt:revision[position() != 1]/rdf:Description">
                  <xsl:sort select="dc:date" />
                  <tr>
                     <td class="rowhead"><xsl:value-of select="exslt:version" /></td>
                     <td style="width: 5em;"><xsl:apply-templates select="dc:date" /></td>
                     <td><xsl:apply-templates select="dc:creator" /></td>
                     <td style="text-align: left;"><xsl:apply-templates select="dc:description" /></td>
                  </tr>
               </xsl:for-each>
            </table>
         </xsl:if>
      </xsl:when>
      <xsl:otherwise>
         <p>
            <b>Previous Version: </b>
            <xsl:variable name="href">
               <xsl:choose>
                  <xsl:when test="parent::exslt:module">
                     <xsl:value-of select="concat(../@prefix, '.', ../@version - 1, '.html')" />
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="concat(../@module, '.', ../exslt:name, '.', ../@version - 1, '.html')" />
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <a href="{$href}"><xsl:value-of select="$href" /></a>
         </p>
         <table>
            <tr>
               <th class="rowhead">Version</th>
               <th>Modified</th>
               <th>By</th>
               <th>Details</th>
            </tr>
            <xsl:for-each select="exslt:revision/rdf:Description">
               <xsl:sort select="dc:date" />
               <tr>
                  <td class="rowhead"><xsl:value-of select="exslt:version" /></td>
                  <td style="width: 5em;"><xsl:apply-templates select="dc:date" /></td>
                  <td><xsl:apply-templates select="dc:creator" /></td>
                  <td style="text-align: left;"><xsl:apply-templates select="dc:description" /></td>
               </tr>
            </xsl:for-each>
         </table>
      </xsl:otherwise>
   </xsl:choose>
   <xsl:if test="dc:rights">
      <h2>Copyright</h2>
      <xsl:choose>
         <xsl:when test="dc:rights = 'public domain'">
            <p class="copyright">This material is in the public domain.</p>
         </xsl:when>
         <xsl:otherwise>
            <pre class="copyright">
               <xsl:copy-of select="dc:rights/node()" />
            </pre>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:if>
</xsl:template>

<xsl:template match="dc:creator" mode="with-url">
   <xsl:apply-templates select="." />
   <xsl:variable name="url" select="@url | vcf:url" />
   <xsl:if test="$url">
      <xsl:text />(<a href="{$url}"><xsl:value-of select="$url" /></a>)<xsl:text />
   </xsl:if>
</xsl:template>

<xsl:template match="dc:creator[vcf:email]">
   <a href="mailto:{vcf:email}"><xsl:value-of select="normalize-space(vcf:fn)" /></a>
</xsl:template>

<xsl:template match="dc:creator[@email and not(@no-spam = 'yes')]">
   <a href="mailto:{@email}"><xsl:value-of select="normalize-space()" /></a>
</xsl:template>

<xsl:template match="dc:date">
   <xsl:value-of select="." />
</xsl:template>

<xsl:template match="dc:description[text()]">
   <p><xsl:copy-of select="." /></p>
</xsl:template>

<xsl:template match="dc:description">
   <xsl:copy-of select="." />
</xsl:template>

<xsl:template match="exslt:definition" mode="element-syntax">
   <xsl:text />&lt;<xsl:value-of select="../@module" />:<xsl:value-of select="../exslt:name" />
   <xsl:for-each select="xs:attributeGroup">
      <xsl:text>&#xA;   </xsl:text>
      <var><xsl:value-of select="@ref" /></var>
   </xsl:for-each>
   <xsl:for-each select="xs:attribute">
      <xsl:text>&#xA;   </xsl:text>
      <xsl:choose>
         <xsl:when test="@use = 'required'">
            <b><xsl:value-of select="@name" /></b>
         </xsl:when>
         <xsl:otherwise><xsl:value-of select="@name" /></xsl:otherwise>
      </xsl:choose>
      <xsl:text> = </xsl:text>
      <xsl:variable name="avt" select="xs:annotation/xs:appinfo/exslt:avt" />
      <xsl:if test="$avt">{ </xsl:if>
      <xsl:choose>
         <xsl:when test="@type">
            <var><xsl:value-of select="substring-after(@type, ':')" /></var>
         </xsl:when>
         <xsl:when test="xs:simpleType/xs:union">
            <xsl:apply-templates select="xs:simpleType/xs:union" />
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select=".//xs:enumeration" />
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="$avt"> }</xsl:if>
   </xsl:for-each>
   <xsl:choose>
      <xsl:when test="xs:sequence | xs:choice">
         <xsl:text>&gt;&#xA;   &lt;-- Content: </xsl:text>
         <xsl:apply-templates select="xs:sequence | xs:choice" />
         <xsl:text> --&gt;&#xA;&lt;/</xsl:text>
         <xsl:value-of select="../@module" />:<xsl:value-of select="../exslt:name" />&gt;<xsl:text />
      </xsl:when>
      <xsl:otherwise>
         <xsl:text> /&gt;</xsl:text>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="xs:enumeration">
   <xsl:text />"<xsl:value-of select="@value" />"<xsl:text />
   <xsl:if test="position() != last()"> | </xsl:if>
</xsl:template>

<xsl:template match="xs:union">
   <xsl:variable name="values" select=".//xs:enumeration" />
   <xsl:apply-templates select="$values" />
   <xsl:if test="$values and @memberTypes"> | </xsl:if>
   <xsl:apply-templates select="@memberTypes" />
</xsl:template>

<xsl:template match="@memberTypes" name="memberTypes">
   <xsl:param name="types" select="." />
   <xsl:choose>
      <xsl:when test="contains($types, ' ')">
         <var><xsl:value-of select="substring-after(substring-before($types, ' '), ':')" /></var>
         <xsl:text> | </xsl:text>
         <xsl:call-template name="memberTypes">
            <xsl:with-param name="types" select="substring-after($types, ' ')" />
         </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
         <var><xsl:value-of select="substring-after($types, ':')" /></var>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="xs:sequence | xs:choice">
   <xsl:param name="indent" select="'&#xA;                '" />
   <xsl:if test="*[2]">
      <xsl:if test="preceding-sibling::*"><xsl:value-of select="$indent" /></xsl:if>
      <xsl:text>(</xsl:text>
   </xsl:if>
   <xsl:for-each select="*">
      <xsl:apply-templates select=".">
         <xsl:with-param name="indent" select="concat($indent, ' ')" />
      </xsl:apply-templates>
      <xsl:if test="position() != last()">
         <xsl:choose>
            <xsl:when test="self::xs:sequence">, </xsl:when>
            <xsl:otherwise> | </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:for-each>
   <xsl:if test="*[2]">)</xsl:if>
   <xsl:apply-templates select="." mode="occurrence" />
</xsl:template>

<xsl:template match="xs:element">
   <a href="../../../{substring-before(@ref, ':')}/elements/{substring-after(@ref, ':')}/index.html">
      <xsl:if test="starts-with(@ref, 'xsl:')">
         <xsl:attribute name="href">
            <xsl:text>http://www.w3.org/TR/xslt#element-</xsl:text>
            <xsl:value-of select="substring(@ref, 5)" />
         </xsl:attribute>
      </xsl:if>
      <xsl:value-of select="@ref" />
   </a>
   <xsl:apply-templates select="." mode="occurrence" />
</xsl:template>

<xsl:template match="xs:group">
   <var><xsl:value-of select="substring-after(@ref, ':')" /></var>
   <xsl:apply-templates select="." mode="occurrence" />
</xsl:template>

<xsl:template match="*" mode="occurrence">
   <xsl:choose>
      <xsl:when test="@minOccurs = 0 and (not(@maxOccurs) or @maxOccurs = 1)">?</xsl:when>
      <xsl:when test="@minOccurs = 0 and @maxOccurs = 'unbounded'">*</xsl:when>
      <xsl:when test="(not(@minOccurs) or @minOccurs = 1) and @maxOccurs = 'unbounded'">+</xsl:when>
      <xsl:when test="@minOccurs != 1 and @maxOccurs != 1">
         <xsl:text />{<xsl:value-of select="@minOccurs" />,<xsl:text />
         <xsl:if test="@maxOccurs != 'unbounded'">
            <xsl:text> </xsl:text>
            <xsl:value-of select="@maxOccurs" />
         </xsl:if>
         <xsl:text>}</xsl:text>
      </xsl:when>
   </xsl:choose>   
</xsl:template>

<xsl:template match="exslt:definition" mode="function-syntax">
   <var><xsl:value-of select="exslt:return/@type" /></var>
   <xsl:text> </xsl:text>
   <b><xsl:value-of select="../@module" />:<xsl:value-of select="../exslt:name" /></b>
   <xsl:text>(</xsl:text>
   <xsl:for-each select="exslt:arg">
      <var><xsl:value-of select="@type" /></var>
      <xsl:if test="@optional = 'yes'">?</xsl:if>
      <xsl:if test="position() != last()">, </xsl:if>
   </xsl:for-each>
   <xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="exslt:definition" mode="template-syntax">
   <xsl:text>&lt;xsl:call-template name="</xsl:text>
   <b><xsl:value-of select="../@module" />:<xsl:value-of select="../exslt:name" /></b>
   <xsl:choose>
      <xsl:when test="exslt:arg">
         <xsl:text>">&#xA;</xsl:text>
         <xsl:for-each select="exslt:arg">
            <xsl:text>   &lt;xsl:with-param name="</xsl:text>
            <xsl:value-of select="@name" />
            <xsl:text>" select="</xsl:text>
            <var><xsl:value-of select="@type" /></var>
            <xsl:text>" /></xsl:text>
            <xsl:if test="@optional = 'yes'">?</xsl:if>
            <xsl:text>&#xA;</xsl:text>
         </xsl:for-each>
         <xsl:text>&lt;/xsl:call-template></xsl:text>
      </xsl:when>
      <xsl:otherwise>" /></xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="exslt:module" mode="update-bat">
   <xsl:variable name="module" select="@prefix" />
   <xsl:call-template name="copy">
      <xsl:with-param name="from" select="'..\style\base.css'" />
      <xsl:with-param name="to" select="'.'" />
   </xsl:call-template>
   <xsl:call-template name="transform">
      <xsl:with-param name="input" select="concat($module, '.xml')" />
      <xsl:with-param name="stylesheet" select="'../style/module.xsl'" />
   </xsl:call-template>
   <xsl:for-each select="exslt:functions/exslt:function">
      <xsl:variable name="function" select="@name" />
      <xsl:call-template name="cd">
         <xsl:with-param name="to" select="'functions'" />
      </xsl:call-template>
      <xsl:call-template name="cd">
         <xsl:with-param name="to" select="$function" />
      </xsl:call-template>
      <xsl:apply-templates select="document(concat('functions/', $function, '/', $module, '.', $function, '.xml'), .)"
                           mode="update-bat" />
      <xsl:call-template name="cd" />
      <xsl:call-template name="cd" />
   </xsl:for-each>
   <xsl:for-each select="exslt:elements/exslt:element">
      <xsl:variable name="element" select="@name" />
      <xsl:call-template name="cd">
         <xsl:with-param name="to" select="'elements'" />
      </xsl:call-template>
      <xsl:call-template name="cd">
         <xsl:with-param name="to" select="$element" />
      </xsl:call-template>
      <xsl:apply-templates select="document(concat('elements/', $element, '/', $module, '.', $element, '.xml'), .)"
                           mode="update-bat" />
      <xsl:call-template name="cd" />
      <xsl:call-template name="cd" />
   </xsl:for-each>
   <xsl:call-template name="zip">
      <xsl:with-param name="output" select="concat($module, '.zip')" />
      <xsl:with-param name="file" select="concat($module, '.package.txt')" />
   </xsl:call-template>
</xsl:template>

<xsl:template match="exslt:element | exslt:function" mode="update-bat">
   <xsl:variable name="ext" select="concat(@module, '.', exslt:name)" />
   <xsl:call-template name="copy">
      <xsl:with-param name="from" select="'..\..\..\style\base.css'" />
      <xsl:with-param name="to" select="'.'" />
   </xsl:call-template>
   <xsl:call-template name="transform">
      <xsl:with-param name="input" select="concat($ext, '.xml')" />
      <xsl:with-param name="stylesheet" select="concat('../../../style/', local-name(), '.xsl')" />
   </xsl:call-template>
   <xsl:call-template name="zip">
      <xsl:with-param name="output" select="concat($ext, '.zip')" />
      <xsl:with-param name="file" select="concat($ext, '.package.txt')" />
   </xsl:call-template>
   <xsl:call-template name="zip">
      <xsl:with-param name="output" select="concat($ext, '.use-cases.zip')" />
      <xsl:with-param name="file" select="concat($ext, '.use-cases.txt')" />
   </xsl:call-template>
</xsl:template>

<xsl:variable name="options" select="document('options.xml')/options" />

<xsl:template name="cd">
   <xsl:param name="to" select="'..'" />
   <xsl:apply-templates select="$options/cd/node()">
      <xsl:with-param name="to" select="$to" />
   </xsl:apply-templates>
   <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template name="copy">
   <xsl:param name="from" />
   <xsl:param name="to" />
   <xsl:apply-templates select="$options/copy/node()">
      <xsl:with-param name="from" select="$from" />
      <xsl:with-param name="to" select="$to" />
   </xsl:apply-templates>
   <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template match="from">
   <xsl:param name="from" />
   <xsl:value-of select="$from" />
</xsl:template>

<xsl:template match="to">
   <xsl:param name="to" />
   <xsl:value-of select="$to" />
</xsl:template>

<xsl:template name="transform">
   <xsl:param name="input" />
   <xsl:param name="stylesheet" />
   <xsl:apply-templates select="$options/xslt/node()">
      <xsl:with-param name="input" select="$input" />
      <xsl:with-param name="stylesheet" select="$stylesheet" />
   </xsl:apply-templates>
   <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template match="input">
   <xsl:param name="input" />
   <xsl:value-of select="$input" />
</xsl:template>

<xsl:template match="stylesheet">
   <xsl:param name="stylesheet" />
   <xsl:value-of select="$stylesheet" />
</xsl:template>

<xsl:template name="zip">
   <xsl:param name="output" />
   <xsl:param name="file" />
   <xsl:apply-templates select="$options/zip/node()">
      <xsl:with-param name="output" select="$output" />
      <xsl:with-param name="file" select="$file" />
   </xsl:apply-templates>
   <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template match="file">
   <xsl:param name="file" />
   <xsl:value-of select="$file" />
</xsl:template>

<xsl:template match="output">
   <xsl:param name="output" />
   <xsl:value-of select="$output" />
</xsl:template>


<xsl:variable name="lc" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uc" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

<xsl:template match="*" mode="serialise">
   <xsl:variable name="depth" select="count(ancestor::*[not(self::xsl:stylesheet)])" />
   <xsl:variable name="indent">
      <xsl:call-template name="indent">
         <xsl:with-param name="indent" select="$depth" />
      </xsl:call-template>
   </xsl:variable>
   <xsl:value-of select="$indent" />
   <xsl:text />&lt;<xsl:value-of select="name()" />
   <xsl:for-each select="@*">
      <xsl:choose>
         <xsl:when test="position() = 1"><xsl:text> </xsl:text></xsl:when>
         <xsl:otherwise>
            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="$indent" />
            <xsl:call-template name="padding">
               <xsl:with-param name="pad-length" select="string-length(name(..)) + 2" />
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="name()" />="<xsl:text />
      <xsl:apply-templates select="." mode="escape-xml" />
      <xsl:text>"</xsl:text>
   </xsl:for-each>
   <xsl:for-each select="namespace::*[local-name() != 'xml']">
      <xsl:if test="not(../../namespace::*[local-name() = local-name(current()) and . = current()])">
         <xsl:choose>
            <xsl:when test="../@* or position() != 1">
               <xsl:text>&#xA;</xsl:text>
               <xsl:value-of select="$indent" />
               <xsl:call-template name="padding">
                  <xsl:with-param name="pad-length" select="string-length(name(..)) + 2" />
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
         </xsl:choose>
         <xsl:text>xmlns</xsl:text>
         <xsl:if test="local-name()">:<xsl:value-of select="local-name()" /></xsl:if>
         <xsl:text>="</xsl:text>
         <xsl:value-of select="." />
         <xsl:text>"</xsl:text>
      </xsl:if>
   </xsl:for-each>
   <xsl:choose>
      <xsl:when test="node()">
         <xsl:text>&gt;</xsl:text>
         <xsl:if test="node()[not(self::text())]">
            <xsl:text>&#xA;</xsl:text>
         </xsl:if>
         <xsl:apply-templates mode="serialise" />
         <xsl:if test="node()[not(self::text())]">
            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="$indent" />
         </xsl:if>
         <xsl:text />&lt;/<xsl:value-of select="name()" />&gt;<xsl:text />
      </xsl:when>
      <xsl:otherwise> /&gt;</xsl:otherwise>
   </xsl:choose>
   <xsl:if test="following-sibling::node()">
      <xsl:text>&#xA;</xsl:text>
   </xsl:if>
</xsl:template>

<xsl:template match="comment()" mode="serialise">
   <xsl:text>&lt;!-- </xsl:text>
   <xsl:value-of select="." />
   <xsl:text> --&gt;</xsl:text>
   <xsl:if test="following-sibling::node()">
      <xsl:text>&#xA;</xsl:text>
   </xsl:if>
</xsl:template>

<xsl:template match="processing-instruction()" mode="serialise">
   <xsl:text>&lt;?</xsl:text>
   <xsl:value-of select="name()" />
   <xsl:text> </xsl:text>
   <xsl:value-of select="." />
   <xsl:text> ?&gt;</xsl:text>
   <xsl:if test="following-sibling::node()">
      <xsl:text>&#xA;</xsl:text>
   </xsl:if>
</xsl:template>

<xsl:template match="text()" mode="serialise">
   <xsl:apply-templates select="." mode="escape-xml"/>
</xsl:template>

<xsl:variable name="replacements" xmlns="" xml:space="preserve">
	<replace in="text"><from>&lt;</from><to><span class="entity">&amp;lt;</span></to></replace>
<!-- <replace><from>&gt;</from><to><span class="entity">&amp;gt;</span></to></replace> -->
	<replace in="text"><from>&amp;</from><to><span class="entity">&amp;amp;</span></to></replace>
  	<replace><from>&quot;</from><to><span class="entity">&amp;quot;</span></to></replace>
<!-- <replace><from>&apos;</from><to><span class="entity">&amp;apos;</span></to></replace> -->
   <replace in="text"><from>&#160;</from><to><span class="entity">&amp;#160;</span></to></replace>
<!-- <replace in="text"><from>&#xA;</from><to><span class="entity">&amp;#xA;</span></to></to></replace> -->
   <replace in="text"><from>&#x9;</from><to><span class="entity">&amp;#x9;</span></to></replace>
</xsl:variable>

<xsl:template match="text()|@*" mode="escape-xml" name="escape-xml">
	<xsl:param name="string" select="." />
   <xsl:param name="attr" select="not(self::node())" />
   <xsl:variable name="sub" select="$replacements/replace[$attr or @in = 'text'][contains($string, from)][1]" />
   <xsl:choose>
   	<xsl:when test="$sub">
         <xsl:variable name="before" select="substring-before($string, $sub/from)" />
         <xsl:variable name="after" select="substring-after($string, $sub/from)" />
         <xsl:if test="$before">
            <xsl:call-template name="escape-xml">
            	<xsl:with-param name="string" select="$before" />
               <xsl:with-param name="attr" select="$attr" />
            </xsl:call-template>
         </xsl:if>
         <xsl:copy-of select="$sub/to" />
         <xsl:if test="$after">
            <xsl:call-template name="escape-xml">
               <xsl:with-param name="string" select="$after" />
               <xsl:with-param name="attr" select="$attr" />
            </xsl:call-template>
         </xsl:if>
      </xsl:when>
   	<xsl:otherwise><xsl:value-of select="$string" /></xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template name="indent">
   <xsl:param name="indent" select="0" />
   <xsl:if test="$indent">
      <xsl:call-template name="padding">
         <xsl:with-param name="pad-length" select="3 * $indent" />
      </xsl:call-template>
   </xsl:if>
</xsl:template>

<xsl:template name="padding">
   <xsl:param name="pad-chars" select="' '" />
   <xsl:param name="pad-length" select="1" />
   <xsl:variable name="lpad-chars" select="string-length($pad-chars)" />
   <xsl:choose>
      <xsl:when test="$lpad-chars >= $pad-length">
         <xsl:value-of select="substring($pad-chars, 1, $pad-length)" />
      </xsl:when>
      <xsl:otherwise>
         <xsl:variable name="double-pad" 
                       select="concat($pad-chars, $pad-chars)" />
         <xsl:variable name="lremaining" select="$pad-length - $lpad-chars" />
         <xsl:value-of select="$pad-chars" />
         <xsl:if test="$lremaining > 1">
            <xsl:call-template name="padding">
               <xsl:with-param name="pad-chars" select="$double-pad" />
               <xsl:with-param name="pad-length" 
                               select="floor($lremaining div 2)" />
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="padding">
            <xsl:with-param name="pad-chars" select="$double-pad" />
            <xsl:with-param name="pad-length" 
                            select="ceiling($lremaining div 2)" />
         </xsl:call-template>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="html:*">
   <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*|node()" />
   </xsl:element>
</xsl:template>

<xsl:template match="html:*/@*">
   <xsl:copy-of select="." />
</xsl:template>

<xsl:template match="para">
   <p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="function | literal | returnvalue | parameter">
   <code><xsl:apply-templates /></code>
</xsl:template>

<xsl:template match="ulink">
   <a href="{@URL}"><xsl:apply-templates /></a>
</xsl:template>

</xsl:stylesheet>