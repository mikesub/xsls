<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="resumes">
    <list>
       <xsl:apply-templates select="resume[1] | resume[preceding-sibling::resume[1]/@uid != ./@uid]"/>
    </list>
</xsl:template>

<xsl:template match="resume">
    <item id="{@rid}" user="{@uid}">
        <xsl:if test="following-sibling::resume[1]/@uid = current()/@uid">
            <more>
                <xsl:apply-templates select="following-sibling::resume[1]" mode="subitem"/>
            </more>
        </xsl:if>
    </item>
</xsl:template>

<xsl:template match="resume" mode="subitem">
    <subitem id="{@rid}"/>
    <xsl:apply-templates select="following-sibling::resume[1][@uid = current()/@uid]" mode="subitem"/>
</xsl:template>

</xsl:stylesheet>