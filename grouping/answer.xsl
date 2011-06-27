<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:key name="types" match="number" use="@type" />
    <xsl:template match="/">
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
  

</xsl:stylesheet>
