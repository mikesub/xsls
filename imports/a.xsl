<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="ab.xsl"/>

    <xsl:template match="foo">
        a <xsl:apply-templates select="." mode="foo"/>
    </xsl:template>



</xsl:stylesheet>
