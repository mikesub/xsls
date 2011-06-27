<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:key name="tree" match="tree//area" use="@name" />
    <xsl:template match="/">
        <xsl:for-each select="flat/area">
            <xsl:value-of select="@name"/>:<xsl:value-of select="boolean(../area/@name = key('tree',@name)/ancestor::area/@name)"/>
            <xsl:if test="position()!=last()"> | </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
