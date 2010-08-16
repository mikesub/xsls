<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="data">
    <xsl:text>apply: </xsl:text><xsl:apply-templates/>
    <xsl:text>.: </xsl:text><xsl:value-of select="."/>
    <xsl:text>current(): </xsl:text><xsl:value-of select="current()"/>
    <xsl:text>self::node(): </xsl:text><xsl:value-of select="self::node()"/>
    <xsl:text>text(): </xsl:text><xsl:value-of select="text()"/>
    <xsl:text>../a: </xsl:text><xsl:value-of select="../data"/>
  </xsl:template>

</xsl:stylesheet>
