<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8"/>

  <xsl:template match="/">
    <!--
      для каждого региона в плоском списке определить:
      есть ли рядом в списке его родитель любого уровня.

      россия - false (у него нет вообще родителей)
      таганрог - true (россия является для него родителем)
      киев - false (для нет родителей в плоском списке, хоть в дереве выше него стоит украина)

    -->
  </xsl:template>

</xsl:stylesheet>
