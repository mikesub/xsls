# Вёрстка против XSLT

## Никакой логики
```mustache
<vacancy>
  <header>{{ vacancy.name }}</header>
	<paragraph>{{ vacancy.desc }}</paragraph>
</vacancy>
```
string.Template, CTemplate, Mustache, etc...

## Добавляем логику
```django
{% if vacancy.length %}
<vacancies>
	{% for vacancy in vacancies %}
	<vacancy>
		<header>{{ vacancy.name }}</header>
		<paragraph>{{ vacancy.desc }}</paragraph>
	</vacancy>
{% endfor %}
</vacancies>
{%endif%}
```
velocity, freemarker, genshi, smarty, django templates, jinja2, mako, shmako, ERB/eruby, template toolkit, JSP, PHP

## Добавляем логику аннотационно потому что у нас XML
```xml
<vacancies tpl:if="vacancy.length">
	<vacancy tpl:for="vacancy in vacancies">
		<header>${vacancy.name}</header>
		<paragraph>${vacancy.desc}</paragraph>
	</vacancy>
</vacancies>
```
Genshi, TAL...

## За логикой идут остальные
```xml
<vacancy tpl:for="idx, vacancy in enumerate(reversed(employer.vacancies))">
	<header>${vacancy.name}</header>
	<position>${len(employer.vacancies) - idx}</position>
	<description></description>
</vacancy>

<% rows = [[v for v in range(0,10)] for row in range(0,10)] %>
<table>
% for row in rows:
	${makerow(row)}
% endfor
</table>
<%def name="makerow(row)">
	<tr>
	% for name in row:
		<td>${name}</td>
	% endfor
	</tr>
</%def>
```
## А теперь нечто совершенно иное
```xml
<xsl:template match="vacancy">
	<xsl:copy>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>
<xsl:template match="vacancy/name">
	<header>
		<xsl:apply-templates/>
	</header>
</xsl:template>
<xsl:template match="vacancy/desc">
	<paragraph>
		<xsl:apply-templates/>
	</paragraph>
</x:template>
```
## XML Path Language (XPath)
```xml
<xsl:template match="group/item" mode="layout">
	<xsl:apply-templates select="current()[@foo!=preceding-sibling::item/@foo]"/>
	<xsl:apply-templates select="/data/item[@id = current()/@id]">
	<xsl:apply-templates select="ancestor::group[1]/description">
</xsl:template>
```

## Повторное использование кода
```xml
<xsl:template match="list">
	<xsl:element name="{@list-type}">
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>
<xsl:template match="list/item">
	<li>
		<xsl:apply-templates/>
	</li>
</xsl:template>

<xsl:template match="text()">
	<paragraph><xsl:copy select="."/></paragraph>
</xsl:template>
```
## Рекурсия из коробки
```xml
<wrap><wrap><wrap> text </wrap></wrap></wrap>
```
```xml
<xsl:template match="wrap">
	<xsl:text>!&#160;</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>&#160;!</xsl:text>
</xsl:template>
```
`! ! ! text ! ! !`
## Реальная жизнь
* неуправляемый xml:
```xml
<xsl:apply-templates match="*"/>
```
* недопонимание декларативности: push vs. pull

## Я достану всё, что захочу
```xml
<xsl:template match="/">
	<h1><xsl:value-of select="employer/title"/></h1>
	<xsl:for-each select="employer/vacancies">
		<xsl:choose>...</xsl:choose>
	</xsl:for-each>
	<xsl:if test="employer/@type = $badged">
		<xsl:call-template name="badge"/>
	</xsl:if>
</xsl:template>
```
## Ваши шаблоны - они как мои методы и функции
```xml
<xsl:template name="getParentNameIfHasChildren">
	<xsl:with-param name="node">
	<xsl:if test="$node/node()">
		<xsl:value-of select="name($node/parent::node())"/>
	</xsl:if>
</xsl:template>
```
## Можно все сделать через apply-templates. Зачем что-то еще?
```xml
<xsl:template match="*" mode="header">
	<xsl:apply-templates select="." mode="header-firstpart"/>
	<xsl:value-of select="/doc/data/title"/>
</xsl:template>
```
## Какой же это шаблонизатор, если тут нету random() и uppercase()?
```xml
<func:function name="hh:isToday">
	<xsl:param name="serverDateToCheck"/>
	<xsl:variable name="userGMT" select="key('cookies', 'GMT') or 3"/>
	<xsl:variable name="serverGMT" select="substring($serverDateToCheck, 25, 2)"/>
	<xsl:variable name="userDateEXSLT" select="date:add(hh:toEXSTLDate(key('state', 'current_time')),concat(hh:text-sign($userGMT - $serverGMT),'P0DT', math:abs($userGMT - $serverGMT),'H'))"/>
	<xsl:variable name="userVisitEXSLT" select="date:add($userDateEXSLT,date:difference(hh:toEXSTLDate(key('state', 'current_time')),hh:toEXSTLDate($serverDateToCheck)))"/>
	<func:result select="substring($userDateEXSLT, 9, 2) = substring($userVisitEXSLT, 9, 2) and substring($userDateEXSLT, 6, 2) = substring($userVisitEXSLT, 6, 2) and substring($userDateEXSLT, 0, 5) = substring($userVisitEXSLT, 0, 5)"/>
</func:function>
```
