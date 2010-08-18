<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="node()"></xsl:template>
  <xsl:template match="xsl:*"></xsl:template>
  <xsl:template match="node"></xsl:template>
  <xsl:template match="node/node"></xsl:template>
  <xsl:template match="node/node" priority="3000"></xsl:template>
  <xsl:template match="*"></xsl:template>
  <xsl:template match="*[foo]"></xsl:template>

</xsl:stylesheet>
