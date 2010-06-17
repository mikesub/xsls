<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8"/>
  
    <xsl:template match="zero"><xsl:apply-templates select="item"/></xsl:template>
    <xsl:template match="item"><xsl:value-of select="@value"/></xsl:template>
    <xsl:template match="item[@vikings]"/>
  
  <xsl:template match="one">
    1:
    <!-- вывести:
      2й item, если у него нет @vikings; (egg)
      2й item из тех, что без @vikings. (sausage)
      -->
  </xsl:template>
  
  <xsl:template match="two">
    2: 
    <!-- сделать список соответствий item'ов и цветов (spam:red...) -->
  </xsl:template>
  
  <xsl:template match="three">
    3:
    <!-- 
      для каждого региона в плоском списке определить:
      есть ли рядом в списке его родитель любого уровня.
      
      россия - false (у него нет вообще родителей)
      таганрог - true (россия является для него родителем)
      киев - false (для нет родителей в плоском списке, хоть в дереве выше него стоит украина)
      
    -->
  </xsl:template>
  
  <xsl:template match="four">
    4:
      <!--
        <foo numbers="8,23,42"/><bar numbers="4,15,16"/>
        (значения отсортированы)
        @type (foo/bar) динамический и заранее неизвестен.
      -->    
  </xsl:template>
  
  <xsl:template match="five">
    5:
      <!-- 
      cделать две таблицы:
      одну с горизонтальным расположением по три в ряд.
      вторую с вертикальным в четыре ряда.
      предусмотреть возможность легко менять кол-во ячеек в ряду и содержание пустой ячейки.
      
       1  2  3
       4  5  6
       7  8  9
      10 11 -
      
      1 5 9 
      2 6 10
      3 7 11
      4 8 -
      -->
  </xsl:template>
  
</xsl:stylesheet>