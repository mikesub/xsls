<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:value-of select="item[not(@vikings) and position() = 2]"/>,<xsl:value-of select="item[not(@vikings)][2]"/>
    </xsl:template>

</xsl:stylesheet>
