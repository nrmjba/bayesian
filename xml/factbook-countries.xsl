<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
	<countries>
		<xsl:for-each select="/factbook/region[@id!='wrl' and @id!='ant' and @id!='oc']/country">
			<country>

				<!--GDP>
					<xsl:value-of select="/factbook/category/field[@id='f2001']/rank[@country='$id']/@number"/>
				</GDP-->
				<xsl:call-template name="country">
					<xsl:with-param name="country_id" select="@id"/>
				</xsl:call-template>
			</country>

		</xsl:for-each>
		</countries>
	</xsl:template>

	<xsl:template name="country" >
		<xsl:param name="country_id"/>
		<name>
			<xsl:value-of select="@name"/>
		</name>
		<id>
			<xsl:value-of select="@id"/>
		</id>
		<history>
		<xsl:value-of select="/factbook/region/country[@id=$country_id]/field[@ref='f2028']"/>
		</history>
		<stuff>
		<xsl:value-of select="/factbook/region/country[@id=$country_id]/field[@ref='f2032']"/>
		</stuff>
		<area>
			<value><xsl:value-of select="/factbook/category/field[@id='f2147']/rank[@country=$country_id]/@number"/></value>
			<comparison><xsl:value-of select="/factbook/region/country[@id=$country_id]/field[@ref='f2023']"/></comparison>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2147']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</area>
		<gdp>
			<value><xsl:value-of select="/factbook/category/field[@id='f2001']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2001']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2001']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</gdp>
		<gdp-per-capita>
			<value><xsl:value-of select="/factbook/category/field[@id='f2004']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2004']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2004']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</gdp-per-capita>
		<gini>
			<value><xsl:value-of select="/factbook/category/field[@id='f2172']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2172']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2172']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</gini>
		<population>
			<value><xsl:value-of select="/factbook/category/field[@id='f2119']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2119']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2119']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</population>
		<population-growth-rate>
			<value><xsl:value-of select="/factbook/category/field[@id='f2002']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2002']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2002']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</population-growth-rate>
		<death-rate>
			<value><xsl:value-of select="/factbook/category/field[@id='f2066']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2066']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2066']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</death-rate>
		<health-expenditure>
			<value><xsl:value-of select="/factbook/category/field[@id='f2225']/rank[@country=$country_id]/@number"/></value>
			<dateText><xsl:value-of select="/factbook/category/field[@id='f2225']/rank[@country=$country_id]/@dateText"/></dateText>
			<rank><xsl:number value="count(/factbook/category/field[@id='f2225']/rank[@country=$country_id]/preceding-sibling::*)" format="1" /></rank>
		</health-expenditure>		
		
	</xsl:template>
</xsl:stylesheet>
