<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="one">
        1:
        <xsl:value-of select="item[not(@vikings) and position() = 2]"/>,<xsl:value-of select="item[not(@vikings)][2]"/>
    </xsl:template>

    <xsl:key name="colors" match="two/color" use="@id" />  
    <xsl:template match="two">
        2:
        <xsl:for-each select="item">
            <xsl:value-of select="."/>:<xsl:value-of select="key('colors',@color)"/>
            <xsl:if test="position()!=last()"> | </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:key name="tree" match="three/tree//area" use="@name" />  
    <xsl:template match="three">
        3:
        <xsl:for-each select="flat/area">
            <xsl:value-of select="@name"/>:<xsl:value-of select="boolean(../area/@name = key('tree',@name)/ancestor::area/@name)"/>
            <xsl:if test="position()!=last()"> | </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:key name="types" match="four/number" use="@type" />
    <xsl:template match="four">
        4:
        forehead: <xsl:apply-templates select="number[not(@type = preceding-sibling::number/@type)]"/>
        muench: <xsl:apply-templates select="number[generate-id() = generate-id(key('types',@type)[1]) = 1]"/>
        count: <xsl:apply-templates select="number[count(.|key('types',@type)[1])=1]"/>
    </xsl:template>
  
    <xsl:template match="number">
        <xsl:element name="{@type}">
            <xsl:attribute name="numbers">
                <xsl:for-each select="../number[@type=current()/@type]">
                    <xsl:sort select="." data-type="number"/>
                    <xsl:value-of select="."/>
                    <xsl:if test="position()!=last()">,</xsl:if>
                </xsl:for-each>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
  
  <xsl:variable name="cells" select="4"/>
  <xsl:variable name="rows" select="3"/>
  <xsl:template name="empty">xx</xsl:template>
  <xsl:template match="five">
        5:
    <table type="horizontal">
        <xsl:apply-templates select="item[position() mod $rows = 1]" mode="horizontal"/>
    </table>
    <table type="vertical">
        <xsl:variable name="cells-in-vertical" select="ceiling(count(item) div $rows)"/>
        <xsl:apply-templates select="item[position() &lt;= $rows]" mode="vertical">
            <xsl:with-param name="cells-in-vertical" select="$cells-in-vertical"/>
        </xsl:apply-templates>
    </table>
  </xsl:template>
  
  <xsl:template match="item" mode="horizontal">
    <row>
      <xsl:for-each select=".|following-sibling::item[position() &lt; $rows]">
        <cell><xsl:value-of select="."/></cell>
        <xsl:if test="position() = last() and position() &lt; $rows">
          <xsl:call-template name="complete-row">
            <xsl:with-param name="count" select="position()"/>
          </xsl:call-template>        
        </xsl:if>
      </xsl:for-each>
    </row>
  </xsl:template>
  
  <xsl:template name="complete-row">
    <xsl:param name="count"/>
    <cell>
      <xsl:call-template name="empty"/>
    </cell>
    <xsl:if test="($count + 1) &lt; $rows">
      <xsl:call-template name="complete-row">
        <xsl:with-param name="count" select="$count + 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="item" mode="vertical">
    <xsl:param name="cells-in-vertical"/>
    <row>
      <xsl:for-each select=".|following-sibling::item[position() mod $rows = 0]">
        <cell><xsl:value-of select="."/></cell>
        <xsl:if test="position() = last() and position() &lt; $cells-in-vertical">
          <cell>
            <xsl:call-template name="empty"/>
          </cell>
        </xsl:if>
      </xsl:for-each>
    </row>
  </xsl:template>  
    
  
</xsl:stylesheet>