<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:apply-templates select="//node()"/>
  </xsl:template>
  <xsl:template match="node()">
    <xsl:for-each select="//node()[name()!='foo']">
        <xsl:value-of select="current() = preceding::node()[2]"/>
        <xsl:value-of select="count(preceding-sibling::*[name()!='foo'])"/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>