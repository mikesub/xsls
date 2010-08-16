<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="item"><xsl:value-of select="@value"/></xsl:template>
  <xsl:template match="item[@vikings]"/>
</xsl:stylesheet>
<!--
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="item[@vikings]"/>
  <xsl:template match="item"><xsl:value-of select="@value"/></xsl:template>
</xsl:stylesheet>
-->
<!--
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="data/item"><xsl:value-of select="@value"/></xsl:template>
  <xsl:template match="data/item[@vikings]"/>
</xsl:stylesheet>
-->
<!--
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="data/item[@vikings]"/>
  <xsl:template match="data/item"><xsl:value-of select="@value"/></xsl:template>
</xsl:stylesheet>
-->
