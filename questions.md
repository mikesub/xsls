* apply templates vs. for-each
* call-template
* element
* варианты узнать, что данные узлы на самом деле один и тот же узел?
* приоритеты и алгоритм выбора шаблона который отработает
  1. imports
  2. priorities
  * node 0
  * namespace:* -0.25
  * node() or * -0.5
  * otherwise 0.5

* Built-in Template Rules
```xslt
  <xsl:template match="*|/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="*|/" mode="m">
    <xsl:apply-templates mode="m"/>
  </xsl:template>

  <xsl:template match="text()|@*">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="processing-instruction()|comment()"/>
```

> The built-in template rule for namespace nodes is also to do nothing. There is no pattern that can match a namespace node; so, the built-in template rule is the only template rule that is applied for namespace nodes.

> The built-in template rules are treated as if they were imported implicitly before the stylesheet and so have lower import precedence than all other template rules. Thus, the author can override a built-in template rule by including an explicit template rule.
