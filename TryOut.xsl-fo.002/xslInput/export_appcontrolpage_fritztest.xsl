<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:date="http://exslt.org/dates-and-times" 
	version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
	<xsl:variable name="now" select="date:date-time()" />
	<xsl:variable name="hauptschrift1">10</xsl:variable>
	<xsl:variable name="hauptschrift2">12</xsl:variable>
	<xsl:variable name="ueberschrift">16</xsl:variable>
	<xsl:variable name="fontFamily">Arial,Helvetica</xsl:variable>
	<xsl:variable name="tableBorderColor">gray</xsl:variable>
	<xsl:variable name="tablePadding">2.0pt</xsl:variable>
	<xsl:variable name="tableBorderWidth">1.0pt</xsl:variable>
	
						
	<xsl:template match="publishDetail">
		

		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

			<fo:layout-master-set>

 			
 				<fo:simple-page-master master-name="Page" page-height="29.7cm" page-width="21.0cm" 
 									   margin-left="2.5cm" margin-right="1.5cm" 
 									   margin-top="0.5cm" margin-bottom="0.5cm">
					<fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"  />
					<fo:region-before region-name="regionBefore" extent="1.5cm" />
					<fo:region-after region-name="regionAfter" extent="1.5cm" />
				</fo:simple-page-master>
			
			</fo:layout-master-set>
		
						
			<fo:page-sequence master-reference="Page" font-family="{$fontFamily}" font-size="{$hauptschrift1}"> 
			
				<fo:static-content flow-name="regionBefore">
					<fo:block text-align="right" font-size="8pt">
						<fo:block>
							<xsl:value-of select="Root/Hochschuldaten/Hochschulname/hochschulname" />
						</fo:block>
						<fo:block>					
							Seite
							<fo:page-number />
							von
							<fo:page-number-citation ref-id="lastPage" />
						</fo:block>
					</fo:block>
        		</fo:static-content>
        		
        		<fo:static-content flow-name="regionAfter">
        			<fo:block/>
        		</fo:static-content>
		
						
		 		<fo:flow flow-name="xsl-region-body"> 
		 		
					<fo:block font-size="{$ueberschrift}" font-weight="bold" line-height="26.0pt">
						Kontrollblattn f&#252;r Ihre Bewerbungsdaten .... lokal per FOP erstellt.
					</fo:block>
					
					<fo:block space-before="0.5cm" >
						Von Fritz veraendert am <xsl:value-of select="date:format-date($now,'EEEE, dd. MMMMMMMMMMM yyyy HH:mm:ss')" /> 
					</fo:block>
										
		 			<fo:block space-before="0.5cm" font-size="{$hauptschrift2}">
		 				<xsl:if test="Root/PersonInformation/nameprefix!=''">
							<xsl:value-of select="Root/PersonInformation/nameprefix" />
							<xsl:text> </xsl:text>
						</xsl:if> 
						<xsl:value-of select="Root/PersonInformation/surname" />,&#160;
						<xsl:value-of select="Root/PersonInformation/firstname" />
					</fo:block>
					
					<fo:block font-size="{$hauptschrift2}" >
						<xsl:value-of select="Root/PersonInformation/birthdate" />
					</fo:block>
		
					<fo:block font-weight="bold">
		  				Bewerbernummer:
		 				<xsl:value-of select="Root/PersonInformation/BewerberNr" />
					</fo:block>
           			
					<fo:table >
						<fo:table-column />
						<fo:table-column />
						
						<fo:table-header font-weight="bold">
							<fo:table-row>
								<fo:table-cell padding-top="25pt" padding-bottom="5pt" number-columns-spanned="2" 
											   font-size="{$ueberschrift}">
									<fo:block>
										Informationen zur Bewerbung
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						
						<fo:table-body font-size="{$hauptschrift2}">
		  					<fo:table-row >
		  						<fo:table-cell border-bottom-style="solid" border-bottom-width="0.7pt">
		  							<fo:block padding-top="25pt" padding-bottom="5.0pt">
		  								Semester f&#252;r die Einschreibung:
		  							</fo:block>
		  						</fo:table-cell>
		  						<fo:table-cell border-bottom-style="solid" border-bottom-width="0.7pt">
		  							<fo:block padding-top="25pt" padding-bottom="5.0pt">
		 								<xsl:value-of select="Root/Antrag/semesterart/defaulttext" />&#160;
										<xsl:value-of select="Root/Antrag/term_year" />
									</fo:block>_z
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
	
					
<!--					 Tabelle Angaben zur Person -->
				 	<fo:table space-before="0.8cm" >
						<fo:table-column />
						<fo:table-column />
						
						<fo:table-header >
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" font-size="{$ueberschrift}">
									<fo:block>
										Angaben zur Person
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}" 
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Nachname:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/surname" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Vorname:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block >
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/firstname" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Geschlecht:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/PersonInformation/k_gender_id=1">m&#228;nnlich</xsl:when>
											<xsl:when test="Root/PersonInformation/k_gender_id=2">weiblich</xsl:when>
											<xsl:otherwise>unbekannt</xsl:otherwise>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Alle Vornamen:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of select="Root/PersonInformation/allfirstnames" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block >
										Akad. Grad:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/acgrad/acgrad" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Akad. Grad Zusatz:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/academicdegreesuffix" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Titel:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of select="Root/PersonInformation/title/title" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Namenszusatz:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/nameprefix" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Namensanhang:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/namesuffix" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Künstlername
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/artistname" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Geburtsdatum:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/birthdate" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Geburtsort:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/birthcity" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Geburtsland:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/geblad/geblad" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Geburtsname:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/birthname" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Staatsangeh&#246;rigkeit:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/staat/staat" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Zweite Staatsangeh&#246;rigkeit:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/zweitenationalitaet/staat" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						
					</fo:table>	
													
				 	
<!--				 	 Tabelle Kontaktdaten -->
				 	<fo:table space-before="0.7cm" >
						<fo:table-column />
						<fo:table-column />
						
						<fo:table-header >
							<fo:table-row>
								<fo:table-cell font-size="{$ueberschrift}" number-columns-spanned="2">
									<fo:block>
                						Kontaktdaten
            						</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
							
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Stra&#223;e:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/address/street" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Postleitzahl:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/address/postcode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Ort:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/address/city" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Zusatz (c/o, Zimmernr.):
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/address/addressaddition" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Land:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/address/staat/staat" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										E-Mail:
									</fo:block>	
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/email/eaddress" /> 
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Rufnummer:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/festnetzphone/eaddress" /> 
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
											Handynummer:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/PersonInformation/mobilphone/eaddress" /> 
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					
					</fo:table>
					
					
<!--				Tabelle Studiengangswunsch -->
					<fo:table space-before="0.7cm" >
						<fo:table-column column-width="2.0cm" />
						<fo:table-column column-width="12.3cm" />
						<fo:table-column column-width="2.7cm" />
						
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell font-size="{$ueberschrift}" number-columns-spanned="3" >
									<fo:block>
										Studiengangswunsch
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
						   					   border-width="{$tableBorderWidth}">
									<fo:block>
										Antrag Nr.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
							   				   border-width="{$tableBorderWidth}">
									<fo:block>
										Abschluss, Studienfach/Studienf&#228;cher
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
							   				   border-width="{$tableBorderWidth}">
									<fo:block>
										Fachsemester
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="Root/Antrag/Antragsfach">	
								<fo:table-row>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
							   					   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of disable-output-escaping="no" select="AntragNr" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
							   					   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of disable-output-escaping="no" select="longtext" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
							   					   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of disable-output-escaping="no" select="FS" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
							
					</fo:table>
												

<!--				Tabelle Hochschulzugangsberechtigung -->
					<fo:table space-before="0.7cm">
						<fo:table-column />
						<fo:table-column />
						
						<fo:table-header >
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" font-size="{$ueberschrift}">
									<fo:block>
										Hochschulreife
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Erworben in:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of select="Root/erworbenim/erworbenim" />
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Art der Hochschulreife:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of select="Root/schulart/schulart" />
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Durchschnittsnote:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
          									<xsl:when test="string-length(Root/durchschnittsnote/grade)>1">
												<xsl:value-of select="concat(substring(Root/durchschnittsnote/grade,1,1),',',substring(Root/durchschnittsnote/grade,3,2))" />
            								</xsl:when>
          									<xsl:otherwise>
            									-
          									</xsl:otherwise>
        								</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
							 				Zeugnisdatum:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/zeugnisdatum/date" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Landkreis:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of select="Root/erworbenim/landkreis/landkreis" />
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
		
					</fo:table>
					
					
		
		
<!--				 Tabelle Studienvergangenheit --> 
					<fo:table space-before="0.7cm" >
						<fo:table-column />
						<fo:table-column />
						
						<fo:table-header >
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" font-size="{$ueberschrift}">
									<fo:block>
										Studienvergangenheit
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>						
						
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
							  					   border-width="{$tableBorderWidth}">
									<fo:block>
	  									Bisherige Semester an deutschen Hochschulen (Hochschulsemester):
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
						   					   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:value-of disable-output-escaping="no" select="Root/bisherigesemester/bisherigesemester" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding-top="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
	  									Studium abgeschlossen
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
						   					   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/Antrag/seconddegree='1'">Ja</xsl:when>
											<xsl:otherwise>Nein</xsl:otherwise>	
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					
					</fo:table>	
					
					
					<!-- Zusatzangaben -->
					<fo:table space-before="0.7cm">
						<fo:table-column />
						<fo:table-column />
						
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" font-size="{$ueberschrift}">
									<fo:block>
										Zusatzangaben:
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
							
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}" number-columns-spanned="2"
											   border-bottom-width="1.5pt">
									<fo:block font-weight="bold">
										Abgeleisteter Dienst
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Dienst abgeleistet:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="string-length(Root/Dienst/servicebegin)>1 and string-length(Root/Dienst/serviceend)>1">
												Ja
											</xsl:when>
											<xsl:otherwise>
												Nein
											</xsl:otherwise>
										</xsl:choose>
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="string-length(Root/Dienst/servicebegin)>1 and string-length(Root/Dienst/serviceend)>1">
								<fo:table-row >
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											Dienstbeginn:
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of select="Root/Dienst/servicebegin" />
										</fo:block>	
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row >
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											Dienstende:
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of select="Root/Dienst/serviceend" />
										</fo:block>	
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}" number-columns-spanned="2"
											   border-bottom-width="1.5pt">
									<fo:block font-weight="bold">
										Antrag auf Nachteilsausgleich Wartezeit
									</fo:block>   
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Antrag gestellt:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/Zusatzantraege/NachteilsausgleichWartezeit/amendmentID!=''">Ja</xsl:when>
											<xsl:otherwise>Nein</xsl:otherwise>
										</xsl:choose>
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}" number-columns-spanned="2"
											   border-bottom-width="1.5pt">
									<fo:block font-weight="bold">
										Antrag auf Nachteilsausgleich Note
									</fo:block>   
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Antrag gestellt:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/Zusatzantraege/NachteilsausgleichNote/amendmentID!=''">Ja</xsl:when>
											<xsl:otherwise>Nein</xsl:otherwise>
										</xsl:choose>
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}" number-columns-spanned="2"
											   border-bottom-width="1.5pt">
									<fo:block font-weight="bold">
										Berufsausbildung
									</fo:block>   
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block >
										Ausbildung abgeschlossen:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/Ausbildung/ausbildungID!=''">
												Ja
											</xsl:when>
											<xsl:otherwise>
												Nein
											</xsl:otherwise>
										</xsl:choose>
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="Root/Ausbildung/ausbildungID!=''">
								<fo:table-row >
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block >
											Ausbildungsbeginn
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of select="Root/Ausbildung/startdate" />
										</fo:block>	
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row >
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											Ausbildungsende
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of select="Root/Ausbildung/enddate" />
										</fo:block>	
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}" number-columns-spanned="2"
											   border-bottom-width="1.5pt">
									<fo:block font-weight="bold">
										Antrag auf außergewöhnliche Härte
									</fo:block>   
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Antrag gestellt:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/Zusatzantraege/Haertefall/amendmentID!=''">Ja</xsl:when>
											<xsl:otherwise>Nein</xsl:otherwise>
										</xsl:choose>
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}" number-columns-spanned="2"
											   border-bottom-width="1.5pt">
									<fo:block font-weight="bold">
										Antrag auf bevorzugte Zulassung
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										Antrag gestellt:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
											   border-width="{$tableBorderWidth}">
									<fo:block>
										<xsl:choose>
											<xsl:when test="Root/Zusatzantraege/BevorzugteZulassung/amendmentID!=''">Ja</xsl:when>
											<xsl:otherwise>Nein</xsl:otherwise>
										</xsl:choose>
									</fo:block>	
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="Root/Zusatzantraege/BevorzugteZulassung">
								<fo:table-row>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											Studiengang für Antrag:
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="{$tablePadding}" border-style="solid" border-color="{$tableBorderColor}"
												   border-width="{$tableBorderWidth}">
										<fo:block>
											<xsl:value-of select="studiengang"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						
					</fo:table>
					
														
					<fo:block id="lastPage" />
				</fo:flow>
			</fo:page-sequence>
		</fo:root>		
	</xsl:template>
	
</xsl:stylesheet>