<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

   <xsl:template match="*[@jsx or *[local-name()='attribute' and @name='jsx']]">
        <xsl:variable name="id" select="generate-id()"/>
        <xsl:copy>
            <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="node()" />
        </xsl:copy>
        <script type="text/javascript">HH=HH||{};HH.comps=HH.comps||[];HH.comps.push('<xsl:value-of select="$id"/>');</script>
    </xsl:template>

    <xsl:template match="*[local-name()='attribute' and @name='jsx']">
        <xsl:copy>
            <xsl:attribute name="name">onclick</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@jsx">
        <xsl:attribute name="onclick"><xsl:value-of select="."/></xsl:attribute>
    </xsl:template>

</xsl:stylesheet>