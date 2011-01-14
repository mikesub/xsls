<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- 
subitems.xml - список резюме неизвестного размера:
<resumes>
  <resume rid="" uid=""/>
  ...
</resumes>
@rid - id резюме. @uid - id автора резюме.
отсортирован по @uid. у каждого пользователя из списка от 1 до 5 доп.резюме.

сделать список первых резюме пользователей, в котором при наличии дополнительных,
есть элемент additional-resumes в котором находятся остальные резюме:
<resumelist>
  <resume id="" user="">
     <additional-resumes>
       <item id=""/>
     </additional-resumes>
  </resume>
  ...
</resumelist>
-->
</xsl:stylesheet>