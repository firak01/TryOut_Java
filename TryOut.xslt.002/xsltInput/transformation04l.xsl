<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
  <xsl:template match="/">
  <root>
  	<xsl:apply-templates select="@*|node()">    
    </xsl:apply-templates>
  </root>
  </xsl:template>
  <xsl:template match="@*|node()">
  <xsl:element name="{concat(local-name(), 'LEERZZZ')}">
    <!--
    for-each select="@*|node()">
    
		<xsl:element name="{concat(local-name(), 'LEERZZZ')}">
		 
			<xsl:attribute name="style"><xsl-copy-of select="{@style}"/></xsl:attribute>
			<xsl:attribute name="styleClass"><xsl-copy-of select="{@styleClass}"/></xsl:attribute>
			<xsl:attribute name="id"><xsl-copy-of select="{@id}"/></xsl:attribute>
				
    	</xsl:element>
    	-->	
    	<!-- <xsl:element name="{concat(local-name(), 'LEERZZZ')}"> --> 
    	<br>test</br>
    	<!-- 
    	<xsl:apply-templates select="@*|node()">
    
    	</xsl:apply-templates>
    	   	 -->
    </xsl:element>
    
  </xsl:template>
  
  <!-- Nodes mit LEERZZZ ignorieren 
  <xsl:choose>
  	<xsl:when test="a ='LEERZZZ'")>
  		<xsl:text>LEERZZZ</xsl:text>
  	</xsl:when>
  	<xsl:otherwise>
  		<xsl:text>NICHTLEERZZZ</xsl:text>
  	</xsl:otherwise>
  </xsl:choose>
  
  -->
  
</xsl:stylesheet>

