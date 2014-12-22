<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:date="http://exslt.org/dates-and-times"
    version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="now" select="date:date-time()" />
	<xsl:variable name="schrift16">16pt</xsl:variable>
	<xsl:variable name="schrift14">14pt</xsl:variable>
	<xsl:variable name="schrift12">12pt</xsl:variable>
	<xsl:variable name="schrift11">11pt</xsl:variable>
	<xsl:variable name="schrift10">10pt</xsl:variable>
	<xsl:variable name="schrift9">9pt</xsl:variable>
	<xsl:variable name="schrift8">8pt</xsl:variable>
	<xsl:variable name="schrift7">7pt</xsl:variable>
	<xsl:variable name="schrift6">6pt</xsl:variable>
	<xsl:variable name="fontFamily">Helvetica</xsl:variable>

<xsl:template match="publishDetail">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
		<fo:simple-page-master master-name="first-page" page-height="29.7cm" page-width="21.0cm" margin-left="2.5cm" margin-right="1.5cm" margin-top="1.0cm" margin-bottom="0.5cm">
			<fo:region-body margin-top="2.0cm" margin-bottom="0.5cm"  />
			<fo:region-before region-name="regionBefore1" extent="0.5cm" />
			<fo:region-after region-name="regionAfter1" extent="0.5cm" />
		</fo:simple-page-master>

        <fo:simple-page-master master-name="default-page" page-height="29.7cm" page-width="21.0cm" margin-left="2.5cm" margin-right="1.5cm" margin-top="1.0cm" margin-bottom="0.5cm">
          <fo:region-body margin-top="2.5cm" margin-bottom="0.5cm" />
          <fo:region-before region-name="regionBefore1" extent="0.5cm" />
          <fo:region-after region-name="regionAfter1" extent="0.5cm" />
        </fo:simple-page-master>

        <fo:page-sequence-master master-name="mainPart">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="first-page" page-position="first" />
            <fo:conditional-page-master-reference master-reference="default-page" page-position="rest" />
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>

        <fo:page-sequence master-reference="mainPart" >
		<fo:static-content flow-name="regionBefore1">
			<fo:block>&#160;
				<fo:table table-layout="auto" space-after.optimum="2pt" >
					<fo:table-column column-width="10.5cm" />
					<fo:table-column column-width="2.5cm" />
					<fo:table-column column-width="4.0cm" />	
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell  number-columns-spanned="2">			
								<!--Logo und Kopfdaten (Linux hat mit dem Backslash beim Logo-Pfad ein Problem. Daher darf kein Backslash benutzt werden)-->
								<fo:block>
									<xsl:variable name="LogoBrief">url('../ROOT/HISinOne/images/logos/his1_logo_large.gif')</xsl:variable>
									<fo:block margin-left="-0.2cm">
										<fo:external-graphic src="{$LogoBrief}" content-width="130px"/>
									</fo:block>
								</fo:block>	
							</fo:table-cell>
							<fo:table-cell >
								<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" padding-top="17pt" font-weight="bold"  color="#006ab2">
									Musteruniversität
								</fo:block>
								<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" font-weight="bold" color="#006ab2">
									Immatrikulations- und Prüfungsamt
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
					</fo:table-body>
				</fo:table>
			</fo:block>
        </fo:static-content>
         <fo:static-content flow-name="regionAfter1">
              <fo:block background-color="white">
              &#160;
             </fo:block>
          </fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block >

					<xsl:if test="descendant::*[Bewerber]">
						<xsl:for-each select="Root">
							<xsl:if test="Antrags/Bewerber/surname">
								<xsl:call-template name="header" />
								<xsl:call-template name="stg" />
								<xsl:call-template name="abschnAllgemeineInfos" />
								<xsl:call-template name="abschnUnterlagen" />
								<xsl:call-template name="seite2" />
								<xsl:call-template name="seite2Rueckantwort" />
							</xsl:if>
						 </xsl:for-each>
					 </xsl:if >
				</fo:block>
			</fo:flow>
        </fo:page-sequence>
    </fo:root>
</xsl:template>

<!-- Template - Kontaktdatendaten-->
<xsl:template name="header">
	<fo:table table-layout="auto" space-after.optimum="2pt" >
		<fo:table-column column-width="10.5cm" />
		<fo:table-column column-width="2.5cm" />
		<fo:table-column column-width="4.0cm" />	
		<fo:table-body>
			<fo:table-row >
				<fo:table-cell number-columns-spanned="2">
					<!-- Absenderadresse-->
					<fo:block  span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" margin-top="2.0cm">
						<fo:inline text-decoration="underline"><xsl:value-of select="Hochschuldaten/Hochschulname/hochschulname" /></fo:inline>
						<fo:inline text-decoration="underline">&#160;-&#160;</fo:inline>
						<fo:inline text-decoration="underline"><xsl:value-of select="Hochschuldaten/Adresse/street" /></fo:inline>
						<fo:inline text-decoration="underline">&#160;-&#160;</fo:inline>
						<fo:inline text-decoration="underline"><xsl:value-of select="Hochschuldaten/Adresse/postcode" />&#160;<xsl:value-of select="Root/Hochschuldaten/Adresse/city" /></fo:inline>
					</fo:block>
					<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-top="0.1cm">
						<xsl:choose>
							<xsl:when test="Antrags/Bewerber/k_gender_id!=1">
								<fo:block >Frau</fo:block>
							</xsl:when>
							<xsl:otherwise>
								<fo:block>Herrn</fo:block>
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>	
					<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start">
						<xsl:value-of select="Antrags/Bewerber/firstname" />&#160;
						<xsl:value-of select="Antrags/Bewerber/surname" />
					</fo:block>
					 <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start">
						<xsl:value-of select="Antrags/Bewerber/address/street" />
					</fo:block>
					<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start">
						<xsl:value-of select="Antrags/Bewerber/address/postcode" />&#160;
						<xsl:value-of select="Antrags/Bewerber/address/city" />
					</fo:block>
					<!--Bewerbernumer -->
					<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" padding-before="0.8cm">
					 <fo:inline>Bewerbernummer:&#160;</fo:inline>
					   <fo:inline>
						<xsl:value-of disable-output-escaping="no" select="Antrags/Bewerber/BewerberNr" />
					   </fo:inline>
					</fo:block>
				</fo:table-cell>
				<!--Hochschuldaten-->
				<fo:table-cell >
					<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" padding-top="10pt">
						bearbeitet von:
					</fo:block>
					<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start">
						Max Mustermann
					</fo:block>
					<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start">
						Telefon: <xsl:value-of select="Hochschuldaten/Adresse/Telefonnummer/telnr" />
					</fo:block>
					<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start">
						Fax: <xsl:value-of select="Hochschuldaten/Adresse/Telefonnummer/telnr" />
					</fo:block>
					<fo:block margin-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start">
						E-Mail: <xsl:value-of select="Hochschuldaten/Adresse/Email/email" />
					</fo:block>
					<!--Datum-->
					<fo:block margin-left="5pt" font-size="{$schrift8}" margin-top="10pt">
						<fo:inline text-align="left">
							<xsl:value-of select="Hochschuldaten/Adresse/city" />
						</fo:inline>						
						<fo:inline text-align="left">
							<xsl:text>,&#160;</xsl:text>
						</fo:inline>
						<fo:inline text-align="left">
							<date:date-format lang="de" />
<!-- FGL : Ticket 122544 ersetze das aktuelle Druckdatum durch das "Datum der Genehmigung der Zulassung" 	<xsl:value-of select="date:format-date($now,'dd.MM.yyyy')" /> -->
<!-- 							<xsl:value-of select="date:format-date(admissiondate,'dd.MM.yyyy')" /> -->
							<xsl:value-of select="admissiondate" />
						</fo:inline>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>	
		</fo:table-body>
	</fo:table>	
</xsl:template>
<!-- Template - Fachdatendaten-->
<xsl:template name="stg">
 <fo:block padding-before="0.0cm">
	<fo:table table-layout="fixed" space-after.optimum="2pt"  >
	  <fo:table-column column-width="3cm" />
	  <fo:table-column column-width="15.5cm" />
	  <fo:table-body>
		  <fo:table-row >
			<fo:table-cell number-columns-spanned="2" padding-top="0.8cm">
				  <fo:block font-family="{$fontFamily}" font-size="{$schrift14}" text-align="start"  font-weight="bold" color="#006ab2">
					Zulassungsbescheid	
					</fo:block>
			</fo:table-cell>
		  </fo:table-row>
		  <fo:table-row >
			<fo:table-cell padding-top="10pt">
				<fo:block  span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" font-weight="bold" >
				Studiengang:
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="10pt">
				<fo:block  span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" font-weight="bold">
				  <xsl:value-of disable-output-escaping="no" select="longtext" />
				</fo:block>
			</fo:table-cell>
		  </fo:table-row>
		  <fo:table-row >
			<fo:table-cell >
				<fo:block  span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" font-weight="bold">
				Fachsemester:
				</fo:block>
			</fo:table-cell>
			<fo:table-cell >
				<fo:block  span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" font-weight="bold">
					<xsl:value-of select=" FS" />
				</fo:block>
			</fo:table-cell>
		  </fo:table-row>
		</fo:table-body>
	 </fo:table>  
 </fo:block>
</xsl:template>

<xsl:template name="abschnAllgemeineInfos" >
   <fo:block>
        <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.5cm" >
                <xsl:choose>
					<xsl:when test="Antrags/Bewerber/k_gender_id!=1">
						<fo:block >
							Sehr geehrte Frau
							<xsl:value-of select="Antrags/Bewerber/surname" />,
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
						<fo:block  >
							Sehr geehrter Herr
							<xsl:value-of select="Antrags/Bewerber/surname" />,
						</fo:block>
					</xsl:otherwise>
                </xsl:choose>
        </fo:block>
         <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="10pt">
			<fo:inline>wir begrüßen Sie herzlich an der </fo:inline> <xsl:value-of select="Hochschuldaten/Hochschulname/hochschulname" />
			<fo:inline>.&#160;</fo:inline>
			<fo:inline>Aufgrund der Vorschriften &#252;ber die Vergabe von Studienpl&#228;tzen werden Sie hiermit zum&#160;</fo:inline> 
			<fo:inline>	
				<xsl:for-each select="Antrags">
					<xsl:choose>
						<xsl:when test="termnumber ='1'">
						  <!--Sommersemsterausgabe-->
									<xsl:value-of disable-output-escaping="no" select="concat(BewerbungDruckssemester,' ', term_year)" />
						</xsl:when>
						<xsl:otherwise>
						 <!-- Wintersemesterausgabe-->
							<xsl:value-of disable-output-escaping="no" select="concat(BewerbungDruckssemester,' ', term_year, '/',substring(term_year+1,3))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</fo:inline> 
			<fo:inline>&#160;</fo:inline>
			<fo:inline>&#160;für den Studiengang</fo:inline>
			<fo:inline>&#160;<xsl:value-of select="longtext" /></fo:inline>
			<fo:inline>&#160;zugelassen.</fo:inline>
        </fo:block>
		            
         <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.2cm" font-weight="normal">
			Bitte beachten Sie, dass diese Zuweisung eines Studienplatzes ungültig wird, wenn Sie nicht
		 </fo:block>
		<!--Hinterlegte Prioritaet der Datumsangaben für den Bescheid: 1. Feld Annahmefrist,2. Feld geplantes Imma-Datum, 3. zugewiesener Zeitraum, 4. globaler Zeitraum -->
		 <fo:block padding-before="0.2cm" span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="center"  font-weight="bold">
			<!-- bis zum TT.MM.JJJJ -->
			<xsl:choose>
				<!-- Anahmefrist -->
				<xsl:when test="acceptancedate!=' '">
					<xsl:value-of select="concat('bis zum ', acceptancedate)" />
 				</xsl:when>--> 
				
			
				<!-- geplantes Immatrikulationsdatum  (Ende Immazeitraum)
				<xsl:when test="scheduled_date_of_enrollment!=' '">
					<xsl:value-of select="concat('bis zum ', requestsubject.scheduled_date_of_enrollment)" />
				</xsl:when>-->
				<!-- Einschreibung zum Studium (k_period_usage.hiskey_id = 10)
				<xsl:when test="EinschreibenZeitraumStg/enddate!=''">										
					<xsl:value-of select="concat('bis zum ', EinschreibenZeitraumStg/enddate)" />
				</xsl:when>
				<xsl:when test="Antrags/Einschreiben-default/enddate!=''">
					<xsl:value-of select="concat('bis zum ', Antrags/Einschreiben-default/enddate)" />
				</xsl:when>
				<xsl:when test="Antrags/bewerbungszeitraum-default/enddate!=''">
					<xsl:value-of select="concat('bis zum ', Antrags/bewerbungszeitraum-default/enddate)" />
				</xsl:when>					
				<xsl:otherwise>
					<xsl:text>&#160;</xsl:text>
				</xsl:otherwise> -->
			</xsl:choose>
		 </fo:block>	
		<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.2cm" font-weight="normal">
			die Annahme des Studienplatzes auf dem beigef&#252;gten Formblatt per Post, per Fax oder formlos per E-Mail erklären.
		</fo:block>
        <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.1cm" >
			Für die fristgerechte Rücksendung der Annahmeerklärung ist der Eingang bei der Hochschule maßgebend.
			Die nachstehend aufgeführten Unterlagen müssen uns vorliegen. Für die Vollständigkeit der
			Unterlagen sind Sie selbst verantwortlich. Sollten bis zum oben genannten Termin Ihre Unterlagen
			nicht vollständig vorliegen, entfällt Ihr Anspruch auf den Studienplatz. Eingangsbestätigungen
			können leider nur erteilt werden, wenn Sie Ihren Unterlagen eine adressierte und frankierte Postkarte beifügen.
        </fo:block>   
        <xsl:if test="Antrags/AppRem = 'P' or Antrags/AppRem = 'p'">
            <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.1cm" >
				Sie kann nur pers&#246;nlich und nur zu diesem Zeitpunkt vorgenommen werden.
			</fo:block>
        </xsl:if>
        <!--Semestereroeffnung-->
        <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.5cm" font-weight="bold">
			Semestereröffnung:  
			<xsl:variable name="VB" select="VorlBeg/VorlBeg1/Vorlesungsbeginn" />
				<date:date-format lang="de" />
				<xsl:value-of select="date:format-date($VB,'dd.MM.yyyy ')" />
        </fo:block>
    </fo:block>
</xsl:template>

<xsl:template name="abschnUnterlagen" >
   <fo:block >
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start">
		<xsl:if test="Antrags/AppRem = 'P' or Antrags/AppRem = 'p'">    
		Die Einschreibung ist nur dann m&#246;glich, wenn die nachstehend aufgef&#252;hrten Unterlagen
		komplett vorliegen. (Bitte kein Vorausversand!) :
		</xsl:if>
		<xsl:if test="Antrags/AppRem != 'P' and Antrags/AppRem != 'p'">
			Bei Vorliegen der vollständigen Unterlagen senden wir Ihnen unaufgefordert Ihren Studienausweis und die 
		von uns nicht mehr benötigten Unterlagen zurück. Hierzu geh&#246;ren:
		</xsl:if>    
    
    <fo:table table-layout="fixed" space-after.optimum="1pt" >
	  <fo:table-column column-width="1cm" />
	  <fo:table-column column-width="16cm" />
	  <fo:table-body>
		<fo:table-row >
			<fo:table-cell padding-top="2.0pt"  text-align="right" >
				<fo:block font-size="{$schrift9}">
					   1.
				</fo:block>
			</fo:table-cell >
			<fo:table-cell padding-top="2.0pt"  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
					   Dieser Zulassungsbescheid
				</fo:block>
				</fo:table-cell >
			 </fo:table-row >
		 <fo:table-row >
			<fo:table-cell text-align="right" >
				<fo:block font-size="{$schrift9}">
					   2.
				</fo:block>
			</fo:table-cell >
			<fo:table-cell text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
					Tabellarischer Lebenslauf
				</fo:block>
			</fo:table-cell >
		 </fo:table-row >
		 <fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}"> 3.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
			   <xsl:if test="Antrags/AppRem = 'P' or Antrags/AppRem = 'p'">
					<fo:block font-size="{$schrift9}">
						Hochschulzugangsberechtigung (z.B. Abitur, Zeugnis der Fachhochschulreife, schulischer und praktischer Teil) im Original zur Einsicht
					</fo:block>
				</xsl:if>
			   <xsl:if test="Antrags/AppRem != 'P' and Antrags/AppRem != 'p'">
					<fo:block font-size="{$schrift9}">
					   Hochschulzugangsberechtigung (z.B. Abitur, Zeugnis der Fachhochschulreife, schulischer und praktischer Teil) - beglaubigte Kopie
					</fo:block>
				</xsl:if> 
				<fo:block />
			</fo:table-cell >
		 </fo:table-row >
		<fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}" >4.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
					Erkl&#228;rung zu Immatrikulationshindernissen und zum Datenschutz (http://www.eigene-hochschule.de)
				</fo:block>
			</fo:table-cell >
		</fo:table-row >
		<fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}">5.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
					Passbild (auf der R&#252;ckseite mit dem Namen versehen)
				</fo:block>
			</fo:table-cell >
		</fo:table-row >
		<fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}">6.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
					Bescheinigung einer gesetzlichen Krankenkasse &#252;ber Krankenkassenversicherung oder Nachweis zur Befreiung von der Versicherungspflicht (siehe umseitig Ziff. 2)
				</fo:block>
			</fo:table-cell >
		</fo:table-row >
		<fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}" >7.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<xsl:if test="Antrags/AppRem = 'P' or Antrags/AppRem = 'p'">
					<fo:block font-size="{$schrift9}">Personalausweis</fo:block>
				</xsl:if> 
				<xsl:if test="Antrags/AppRem != 'P' and Antrags/AppRem != 'p'">
					<fo:block font-size="{$schrift9}">Kopie des Personalausweis</fo:block>
				</xsl:if> 
				 <fo:block />
			</fo:table-cell >
		</fo:table-row >
		<fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}">8.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">Einzahlungsnachweis:</fo:block>
					<xsl:if test="Antrags/AppRem = 'P' or Antrags/AppRem = 'p'">
						<fo:block font-size="{$schrift9}">
							 Bitte überweisen Sie den Studentenwerks- und AStA-Beitrag in Höhe von XX,XX Euro unmittelbar nach Erhalt des Zulassungsbescheides. Bitte benutzen Sie ausschließlich den beiliegenden
	&#220;berweisungstr&#228;ger. Als Nachweis bringen Sie zur Einschreibung bitte Ihren Kontoauszug oder den Einzahlungsbeleg mit.
						</fo:block>
					</xsl:if> 
					<xsl:if test="Antrags/AppRem != 'P' and Antrags/AppRem != 'p'">
						<fo:block font-size="{$schrift9}">
							Bitte &#252;berweisen Sie den Studentenwerks- und AStA-Beitrag in H&#246;he von XX,XX Euro unmittelbar nach Erhalt des Zulassungsbescheides. Bitte benutzen Sie ausschlie&#223;lich den beiliegenden
&#220;berweisungstr&#228;ger. Als Nachweis legen Sie bitte Ihren Kontoauszug oder den Einzahlungsbeleg bei.
						</fo:block>
					</xsl:if>                                         
			</fo:table-cell >
		</fo:table-row >
		<fo:table-row >
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}">9.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
					Exmatrikulationsbescheinigung, sofern Sie vorher an einer Hochschule eingeschrieben waren
				</fo:block>
			</fo:table-cell >
		</fo:table-row >
		<fo:table-row>
			<fo:table-cell  text-align="right" >
				<fo:block font-size="{$schrift9}">10.</fo:block>
			</fo:table-cell >
			<fo:table-cell  text-align="start" padding-left="0.2cm" >
				<fo:block font-size="{$schrift9}">
				 Unbedenklichkeitsbescheinigung, sofern Sie vorher an einer anderen Hochschule im o.g. Studiengang studiert haben. (siehe umseitig Ziff. 3)
				</fo:block>
			</fo:table-cell>
		</fo:table-row >
	  </fo:table-body>
    </fo:table >
   </fo:block>
   
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.5cm" >
		<xsl:text>Mit freundlichen Gr&#252;&#223;en</xsl:text>
	</fo:block>
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start">
		Ihre Zulassungsstelle
	</fo:block>
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" padding-before="0.5cm" >
		Dieser Bescheid ist maschinell erstellt und ohne Unterschrift g&#252;ltig.
   </fo:block>
</fo:block>
<fo:block break-before="page"/>
</xsl:template>
<!--=====================================================================-->
<!-- 2. Seite Abschnitt Angaben zur Zulassung -->
<!--=====================================================================-->
<xsl:template name="seite2" >
<fo:block font-family="{$fontFamily}" text-align="justify" line-height="9pt">
  <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" padding-before="0.5cm">
  <fo:inline font-size="{$schrift7}" baseline-shift="super">1)</fo:inline>
 Wir weisen darauf hin, dass neue Studieng&#228;nge semesterweise eingef&#252;hrt werden. Sie haben
    Anspruch auf das Lehrangebot und Pr&#252;fungen in dem Semester, in dem Sie eingeschrieben sind.
    Weitere Angebote richten sich nach dem Fortschritt der Einf&#252;hrung des Studienganges.
   </fo:block>
    <fo:block font-family="{$fontFamily}" text-align="justify" font-size="{$schrift9}"  line-height="9pt" padding-before="0.5cm">
	 <fo:inline font-size="{$schrift7}" baseline-shift="super">2)</fo:inline>
	Alle Studierenden sind nach dem "Gesetz &#252;ber die Krankenversicherung der Studenten"
    krankenversicherungspflichtig. Ein Merkblatt und n&#228;here Ausk&#252;nfte &#252;ber die Krankenversicherung f&#252;r
    Studierende waren in der Vergangenheit bei den Krankenkassen und den Versicherungs&#228;mtern der
    St&#228;dte und Landkreise zu erhalten
   </fo:block>
   <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" padding-before="0.5cm">
Alle Studienbewerber m&#252;ssen sich vor Einschreibung mit der f&#252;r sie zust&#228;ndigen Krankenkasse in
    Verbindung setzen, um eine Versicherungsbescheinigung zu erhalten. Eine Einschreibung, R&#252;ckmeldung
     oder Beurlaubung kann ohne den Nachweis des Versicherungsschutzes nicht erfolgen
   </fo:block>
     <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" padding-before="0.5cm">
Wer einem privaten Versicherungsunternehmen angeh&#246;rt, muss den Nachweis erbringen, dass ihn die
    gesetzliche Krankenkasse (z. B. Allgemeine Ortskrankenkasse AOK) von der allgemeinen
    Versicherungspflicht befreit hat. Dieser Bescheid ist bei der Einschreibung vorzulegen.
   </fo:block>
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift9}" text-align="start" padding-before="0.5cm">
	<fo:inline font-size="{$schrift7}" baseline-shift="super">3)</fo:inline>
	Ihre Hochschule bescheinigt Ihnen damit, dass Ihr Pr&#252;fungsanspruch in einem Fach Ihres
    Studienganges nicht verloren gegangen ist.
   </fo:block>
 </fo:block>
</xsl:template>

<xsl:template name="seite2Rueckantwort" >
<fo:block>

	<fo:block font-size="{$schrift7}" padding-top="55pt" text-align="center" line-height="8pt" >
		Bitte hier abtrennen und sofort zurückschicken an:
	</fo:block>
	<!-- Absenderadresse-->
	<fo:block  span="none" font-family="{$fontFamily}" font-size="{$schrift9}" padding-top="10pt" text-align="center" line-height="8pt">
		<fo:inline ><xsl:value-of select="Hochschuldaten/Hochschulname/hochschulname" /></fo:inline>
		<fo:inline >&#160;-&#160;Immatrikulations- und Prüfungsamt</fo:inline>
		<fo:inline >&#160;-&#160;</fo:inline>
		<fo:inline ><xsl:value-of select="Hochschuldaten/Adresse/street" /></fo:inline>
		<fo:inline >&#160;-&#160;</fo:inline>
		<fo:inline ><xsl:value-of select="Hochschuldaten/Adresse/postcode" />&#160;<xsl:value-of select="Root/Hochschuldaten/Adresse/city" /></fo:inline>
	</fo:block>
	<!--gepunktete Linie -->
	 <fo:block >
          <fo:leader leader-pattern="dots" rule-thickness="0.5pt" leader-length="17.3cm" color="black" />
        </fo:block>
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start" line-height="1cm" padding-before="0.5cm">
     <fo:inline >R&#220;CKANTWORT BIS SP&#196;TESTENS:&#160;</fo:inline>
	 <fo:inline font-weight="bold"><xsl:value-of select="acceptancedate" /></fo:inline>
    </fo:block>
    <!--  
    <xsl:if test="Antrags/AppRem = 'P' or Antrags/AppRem = 'p'">
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" >
        Immatrikulationsdatum:&#160;
        <xsl:choose>
            <xsl:when test="Antrags/Bewerber/BewerberNr mod 4 = 0">$lang.TERMIN_IMMA_1</xsl:when>
            <xsl:when test="Antrags/Bewerber/BewerberNr mod 4 = 1">$lang.TERMIN_IMMA_2</xsl:when>
            <xsl:when test="Antrags/Bewerber/BewerberNr mod 4 = 2">$lang.TERMIN_IMMA_3</xsl:when>
            <xsl:when test="Antrags/Bewerber/BewerberNr mod 4 = 3">$lang.TERMIN_IMMA_4</xsl:when>
        </xsl:choose>
    </fo:block>
    </xsl:if>
    -->
    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.2cm">
        Die Zuweisung des Studienplatzes ist nur g&#252;ltig, wenn diese Annahmeerkl&#228;rung bis zum
     <fo:inline font-weight="bold"><xsl:value-of select="acceptancedate" /></fo:inline> bei der Eigene Hochschule eingegangen ist.
    </fo:block>
<fo:table table-layout="fixed"  >
              <fo:table-column column-width="8cm" />
              <fo:table-column column-width="9cm" />
              <fo:table-body>
                 <fo:table-row >
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start"  padding-before="0.5cm">
                                    <xsl:value-of disable-output-escaping="no" select="Antrags/Bewerber/surname" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start" padding-before="0.5cm">
                                    <xsl:value-of disable-output-escaping="no" select="Antrags/Bewerber/firstname" />
                                    </fo:block>
                                </fo:table-cell>
             </fo:table-row>
              <fo:table-row >
                                <fo:table-cell text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" >
                                    Name
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" >
                                    Vorname
                                    </fo:block>
                                </fo:table-cell>
             </fo:table-row>


             <fo:table-row >
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start"   padding-before="0.5cm">
                                    <xsl:value-of select="Antrags/Bewerber/address/postcode" />&#160;
                                            <xsl:value-of select="Antrags/Bewerber/address/city" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start" padding-before="0.5cm" >
                                    <xsl:value-of select="Antrags/Bewerber/address/street" />
                                    </fo:block>
                                </fo:table-cell>
             </fo:table-row>
             <fo:table-row >
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" >
                                    PLZ Wohnort
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" >
                                    Stra&#223;e
                                    </fo:block>
                                </fo:table-cell>
             </fo:table-row>


             <fo:table-row >
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.5cm">
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start">
                                            <xsl:value-of select="Antrags/Bewerber/mobilphone/eaddress" />
                                    </fo:block>
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start">
                                            <xsl:value-of select="Antrags/Bewerber/festnetzphone/eaddress" />
                                    </fo:block>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start" padding-before="0.5cm">
                                     <xsl:value-of disable-output-escaping="no" select="Antrags/Bewerber/BewerberNr" />
                                    </fo:block>
                                </fo:table-cell>
             </fo:table-row>
              <fo:table-row >
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" >
                                    Telefon
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="2.0pt"  text-align="center" >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start"  >
                                    <fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start">
                                    Bew.-Nr.
                                    </fo:block>
                                    </fo:block>
                                </fo:table-cell>
             </fo:table-row>

             </fo:table-body>
</fo:table >
<fo:block padding-before="0.5cm">&#160;</fo:block>
<fo:block padding-left="5pt" span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.5cm" border-left-style="solid" border-left-width="1pt" border-left-color="#000000" border-right-style="solid" border-right-width="1pt" border-right-color="#000000" border-top-style="solid" border-top-width="1pt" border-top-color="#000000" border-bottom-style="solid" border-bottom-width="1pt" border-bottom-color="#000000">
        Ich bestätige die Annahme des Studienplatzes für den Studiengang
	<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift12}" text-align="start" font-weight="bold" padding-before="0.5cm">
		<xsl:value-of select="longtext" />
	</fo:block>
	<fo:block padding-before="0.5cm">
		&#160;
	</fo:block>
	<!--<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift10}" text-align="start" padding-before="0.5cm">
		 zum&#160;<xsl:variable name="VB1" select="VorlBeg/VorlBeg1/Vorlesungsbeginn" />
													 <date:date-format lang="de" />
													<xsl:value-of select="date:format-date($VB1,'dd.MM.yyyy ')" />
	</fo:block>-->
</fo:block>
  <fo:block space-before="1.5cm">
   <fo:table table-layout="fixed"  >
	 <fo:table-column column-width="7.5cm" />
	 <fo:table-column column-width="1.5cm" />
	 <fo:table-column column-width="8.0cm" />
	 <fo:table-body>
		<fo:table-row >
			<fo:table-cell padding-top="2.0pt">
				<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" font-weight="bold" border-top-style="solid" border-top-width="0.6pt" border-top-color="#000000">
					<fo:inline padding-left="5pt">Ort, Datum</fo:inline>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2.0pt" >
				<fo:block >
					<xsl:text>&#160;</xsl:text>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2.0pt">
				<fo:block span="none" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" font-weight="bold" border-top-style="solid" border-top-width="0.6pt" border-top-color="#000000">
				<fo:inline padding-left="5pt">Unterschrift</fo:inline>	
				</fo:block>
			</fo:table-cell>
                 </fo:table-row >
     </fo:table-body>
	</fo:table>
	</fo:block>
</fo:block>

<fo:block span="none"  padding-before="1.0cm" font-family="{$fontFamily}" font-size="{$schrift8}" text-align="start" >
	<fo:inline font-weight="bold">Seite 2&#160;</fo:inline>
	<fo:inline>des Zulassungsbescheides der&#160;</fo:inline>
	<fo:inline><xsl:value-of select="Hochschuldaten/Hochschulname/hochschulname" />&#160;-&#160;</fo:inline>
	<fo:inline >
		<xsl:for-each select="Antrags">
			<xsl:choose>
				<xsl:when test="termnumber ='1'">
				  <!--<xsl:text>SoSe&#160;</xsl:text>-->
							<xsl:value-of disable-output-escaping="no" select="concat(Bewerbungssemester,' ', term_year)" />
				</xsl:when>
				<xsl:otherwise>
				 <!-- <xsl:text>WiSe&#160;</xsl:text>-->
					<xsl:value-of disable-output-escaping="no" select="concat(Bewerbungssemester,' ', term_year, '/',substring(term_year+1,3))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</fo:inline>
	<fo:inline>&#160;-&#160;Ihre Bewerbernummer:&#160;</fo:inline>
	<fo:inline>
		<xsl:value-of disable-output-escaping="no" select="Antrags/Bewerber/BewerberNr" />
	</fo:inline>
</fo:block>

<fo:block break-after="page"/>
</xsl:template>
</xsl:stylesheet>
