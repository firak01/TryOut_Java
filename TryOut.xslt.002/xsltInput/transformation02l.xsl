<?xml version="1.0" encoding="UTF-8"?>
<!-- Remove unwanted attributes or/and nodes -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
   
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
   
  
   <!-- Text entfernen -->
 <xsl:template match="text()"> </xsl:template>
</xsl:stylesheet>