<?xml version="1.0" encoding="UTF-8"?>
<!-- Remove unwanted attributes or/and nodes -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
   <!-- Damit man die beiden Dateien miteinander vergleichen kann, die Leerzeichen doch drin lassen -->
   <!-- <xsl:strip-space elements="*"/> -->
  
    <!-- Copy everything 
    <xsl:template match="@*|node()|text()|comment()|processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|text()|comment()|processing-instruction()"/>
        </xsl:copy>
    </xsl:template>
    -->
    
    <!-- <xsl:template match="/"> -->
    <!-- <xsl:template match="@*|node()|text()|comment()|processing-instruction()"> -->
    <xsl:template match="@*|node()|comment()|processing-instruction()">
    <!-- Hole die Tags mit dem "Class" Attribut -->
    
    	<xsl:copy>
           	<!-- <root> -->
           		<xsl:apply-templates select="node()|@id|@styleClass|@style"/> 
				<!-- <xsl:apply-templates select="node()|@*"/> -->
				<!-- <xsl:apply-templates select="@*"/> -->
			<!-- </root> -->
        </xsl:copy>
    </xsl:template>
 
    <!-- To remove attributes or nodes, simply write a matching template that doesn't do anything. Therefore, it is removed -->
    <!-- <xsl:template match="//d"/>                       Remove all d nodes -->
    <!-- <xsl:template match="//node()/node()/node()/c"/>  Remove all c nodes that have 3 ancestors -->
    <!-- <xsl:template match="@id_1"/>                     Remove all id_1 attributes -->
 	
 	<!--  <xsl:template match="text()"></xsl:template>   Entferne alle texte. Funktioniert, weil nix damit gemacht wird. --> 	
 	
 	<xsl:template match="text()">
 		<!-- Leere Knoten entfernen -->
 		<xsl:value-of select="normalize-space(.)"/>	
 	</xsl:template>
 	
 	
 	
</xsl:stylesheet>