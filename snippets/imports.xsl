<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl"
  >
  <xsl:output indent="yes" />
  <xsl:template match="xsl:stylesheet">
    <node>
      <xsl:variable name="nodeset">
        <variables-global>
          <xsl:apply-templates select="xsl:variable" mode="copy"/>
          <xsl:apply-templates select="xsl:import" mode="variable"/>
        </variables-global>
        <outputs>
          <xsl:apply-templates select="xsl:output" mode="copy"/>
          <xsl:apply-templates select="xsl:import" mode="output"/>
        </outputs>
        <keys>
          <xsl:apply-templates select="xsl:key" mode="copy"/>
          <xsl:apply-templates select="xsl:import" mode="key"/>
        </keys>
        <template-hierarchy>
          <xsl:apply-templates select="xsl:template" mode="copy"/>
          <xsl:apply-templates select="xsl:import" mode="template"/>
        </template-hierarchy>
      </xsl:variable>
      <xsl:variable name="nodes" select="exsl:node-set($nodeset)"/>
      <full-xsl>
        <xsl:apply-templates select="node()[name()!='xsl:import']" mode="full-copy"/>
        <xsl:apply-templates select="xsl:import" mode="full-copy"/>
      </full-xsl>
      <stats
      variables-global="{count($nodes//xsl:variable)}"
      outputs="{count($nodes/outputs//xsl:output)}"
      keys="{count($nodes/keys//xsl:key)}"
      for-each="{count($nodes/template-hierarchy//xsl:for-each)}"
      choose="{count($nodes/template-hierarchy//xsl:choose)}"
      if="{count($nodes/template-hierarchy//xsl:if)}"
      double-slashes="{count($nodes/node()[name()!='outputs'][name()!='full-xsl']//@*[contains(.,'//')])}"
      />
      <xsl:apply-templates select="$nodes" mode="copy"/>
    </node>
  </xsl:template>

  <xsl:template match="xsl:import" mode="variable">
    <import h="{@href}">
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:variable" mode="copy" />
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:import" mode="variable"/>
    </import>
  </xsl:template>
  <xsl:template match="xsl:import" mode="output">
    <import h="{@href}">
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:output" mode="copy" />
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:import" mode="output"/>
    </import>
  </xsl:template>
  <xsl:template match="xsl:import" mode="key">
    <import h="{@href}">
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:key" mode="copy" />
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:import" mode="key"/>
    </import>
  </xsl:template>
  <xsl:template match="xsl:import" mode="template">
    <import href="{@href}">
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:template" mode="copy" />
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:import" mode="template"/>
    </import>
  </xsl:template>

  <xsl:template match="@*|node()" mode="copy">
     <xsl:copy>
        <xsl:apply-templates select="@*|node()" mode="copy"/>
     </xsl:copy>
  </xsl:template>

  <xsl:template match="xsl:template|xsl:for-each|xsl:choose|xsl:if|xsl:param" mode="copy">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*|xsl:apply-templates|xsl:for-each|xsl:choose|xsl:if|xsl:param" mode="copy"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|node()" mode="full-copy">
     <xsl:copy>
        <xsl:apply-templates select="@*|node()" mode="full-copy"/>
     </xsl:copy>
  </xsl:template>

  <xsl:template match="xsl:import" mode="full-copy">
    <import h="{@href}">
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/xsl:import" mode="full-copy"/>
      <xsl:apply-templates select="document(@href)/xsl:stylesheet/node()[name()!='xsl:import']" mode="full-copy" />
    </import>
  </xsl:template>
 </xsl:stylesheet>
