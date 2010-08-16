<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/" priority="232">
    <xsl:value-of select="count(//bar[1])"/>
  </xsl:template>

  <xsl:template match="/" priority="23">
    <xsl:value-of select="count(descendant::bar[1])"/>
  </xsl:template>

</xsl:stylesheet>
