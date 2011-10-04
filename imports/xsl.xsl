<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="two.xsl"/>
    <xsl:import href="one.xsl"/>

    <xsl:template name="tpl">self</xsl:template>

    <xsl:template match="/">
        <xsl:call-template name="tpl"/>
    </xsl:template>

</xsl:stylesheet>
