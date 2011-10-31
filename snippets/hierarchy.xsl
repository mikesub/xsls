<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />
  <xsl:template match="xsl:stylesheet">
      <i>
          <xsl:apply-templates select="xsl:import"/>
      </i>
  </xsl:template>

  <xsl:template match="xsl:import">
    <i u="{@href}">
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:import"/>
    </i>
  </xsl:template>

 </xsl:stylesheet>
