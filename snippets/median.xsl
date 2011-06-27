<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:variable name="pos" select="round(count(node) div 2)"/>
        <xsl:for-each select="node">
            <xsl:sort select="@value" data-type="number" />
            <xsl:if test="position() = $pos">
                <xsl:value-of select="@value"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
  
</xsl:stylesheet>
