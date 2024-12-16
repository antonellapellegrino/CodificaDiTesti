<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" />

 <!-- Template principale: viene applicato all'intero documento XML -->
    <xsl:template match="/">
        <html lang="it">
            <head>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt"/>
                </title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
                <script type="text/javascript" src="script.js"></script>
                <link rel="stylesheet" type="text/css" href="styles.css"></link>
            </head>

      <body>
        <header id="header">
          <nav>
            <ul>
              <li><a href="#descrizione">Descrizione</a></li>
              <li><a href="#pagine">Pagine codificate</a></li>
              <li><a href="#approfondimenti">Approfondimenti</a></li>
              <li><a href="#bibliografia">Bibliografia</a></li>
              <li><a href="#riferimenti">Riferimenti</a></li>
            </ul>
          </nav>
        </header>

        <section id="introduzione" class="hero-section">
          <div class="hero-content">
            <div class="hero-image">
              <img src="EArtom.jpg" alt="Emanuele Artom" class="portrait"/>
            </div>
            <div class="hero-text">
              <h1>I Diari di Emanuele Artom</h1>
              <p>Una testimonianza preziosa della Resistenza e dell'esperienza ebraica durante la Seconda Guerra Mondiale</p>
            </div>
          </div>
        </section>
        
       <section id="descrizione">
        <h2>Caratteristiche del Diario</h2>
        <div>
         <b>Titolo:</b> <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
        </div>
        <div>
         <b>Autore:</b> 
         <xsl:call-template name="format-person">
         <xsl:with-param name="person" select="//tei:titleStmt/tei:author"/>
         </xsl:call-template>
        </div>
        <div>
         <b>Conservazione:</b> 
         <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:institution/tei:orgName"/>
        </div>
        <div>
          <b>Lingua:</b> <xsl:value-of select="//tei:profileDesc/tei:langUsage/tei:language"/>
        </div>
        <div>
          <b>Descrizione Fisica:</b> <xsl:value-of select="//tei:msDesc/tei:physDesc"/>
        </div>
        <div>
         <b>Storia del Documento:</b> <xsl:apply-templates select="//tei:msDesc/tei:history"/>
        </div>
       </section>

  <section id="bottoni">
  <h1>Pagine codificate del Diario</h1>
    <div class="bottoni">
      <h2>Analizza i fenomeni testuali premendo sui pulsanti:</h2>
      <button id="btn-add">Aggiunte</button>
      <button id="btn-del">Cancellature</button>
      <button id="btn-gap">Lacune</button>
      <button id="btn-persname">Persone</button>
      <button id="btn-placename">Luoghi</button>
      <button id="btn-hide">Nascondi tutto</button>
    </div>
  </section>
  
  <section id="pagine">
    <h2 id="p111">Pagina 111</h2>
    <div class="flexbox">
      <div class="img">
        <xsl:apply-templates select="//tei:surface[@xml:id='pag111']"/>
      </div>
      <div class="text">
        <xsl:apply-templates select="//tei:body/tei:ab[@n='111']"/>
      </div>
    </div>
  
    <h2 id="p112">Pagina 112</h2>
    <div class="flexbox">
      <div class="img">
        <xsl:apply-templates select="//tei:surface[@xml:id='pag112']"/>
      </div>
      <div class="text">
        <xsl:apply-templates select="//tei:body/tei:ab[@n='112']"/>
      </div>
    </div>
  
    <h2 id="p113">Pagina 113</h2>
    <div class="flexbox">
      <div class="img">
        <xsl:apply-templates select="//tei:surface[@xml:id='pag113']"/>
      </div>
      <div class="text">
       <xsl:apply-templates select="//tei:body/tei:ab[@n='113']"/>
      </div>
    </div>
 
    <h2 id="p114">Pagina 114</h2>
    <div class="flexbox">
      <div class="img">
        <xsl:apply-templates select="//tei:surface[@xml:id='pag114']"/>
      </div>
      <div class="text">
        <xsl:apply-templates select="//tei:body/tei:ab[@n='114']"/>
      </div>
    </div>
  
    <h2 id="p115">Pagina 115</h2>
    <div class="flexbox">
      <div class="img">
        <xsl:apply-templates select="//tei:surface[@xml:id='pag115']"/>
      </div>
      <div class="text">
        <xsl:apply-templates select="//tei:body/tei:ab[@n='115']"/>
      </div>
    </div>
 </section>

<section id="approfondimenti">
   <h2>Approfondimenti</h2>
      <div id="listPerson">
        <h3>Persone</h3>
        <ul>
          <xsl:apply-templates select="//tei:back/tei:listPerson/tei:person"/>
        </ul>
      </div>
      <div id="listPlace">
        <h3>Luoghi</h3>
         <ul>
          <xsl:apply-templates select="//tei:placeName"/>
         </ul>
      </div>
      <div id="listOrg">
        <h3>Organizzazioni</h3>
         <ul>
           <xsl:apply-templates select="//tei:orgName"/>
          </ul>
      </div>
</section>

<section id="bibliografia">
    <h2>Bibliografia</h2>
      <xsl:apply-templates select="//tei:listBibl/tei:bibl"/>
</section>

        <footer id="riferimenti">
          <h2>Riferimenti</h2>
          <xsl:apply-templates select="//tei:editionStmt"/>
        </footer>
      </body>
    </html>
  </xsl:template>

  <!-- Template per formattare persone in modo più flessibile -->
<xsl:template name="format-person">
  <xsl:param name="person"/>
  <xsl:choose>
    <!-- Caso con persName -->
    <xsl:when test="$person/tei:persName">
      <!-- Nome -->
      <xsl:if test="$person/tei:persName/tei:forename">
        <xsl:value-of select="$person/tei:persName/tei:forename"/>
      </xsl:if>
      <!-- Cognome -->
      <xsl:if test="$person/tei:persName/tei:surname">
        <xsl:if test="$person/tei:persName/tei:forename">
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:value-of select="$person/tei:persName/tei:surname"/>
      </xsl:if>
      <!-- Add name fra parentesi -->
      <xsl:if test="$person/tei:persName/tei:addName">
        <xsl:if test="$person/tei:persName/tei:forename or $person/tei:persName/tei:surname">
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$person/tei:persName/tei:addName"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:when>
    <!-- Caso con forename e surname diretti -->
    <xsl:when test="$person/tei:forename or $person/tei:surname">
      <xsl:if test="$person/tei:forename">
        <xsl:value-of select="$person/tei:forename"/>
      </xsl:if>
      <xsl:if test="$person/tei:surname">
        <xsl:if test="$person/tei:forename">
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:value-of select="$person/tei:surname"/>
      </xsl:if>
      <xsl:if test="$person/tei:addName">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="$person/tei:addName"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:when>
    <!-- Caso di fallback -->
    <xsl:otherwise>
      <xsl:value-of select="$person"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Template per formattare organizzazioni in modo più flessibile -->
<xsl:template name="format-org">
  <xsl:param name="organisation"/>
  <xsl:choose>
    <xsl:when test="$organisation/tei:orgName">
      <xsl:value-of select="$organisation/tei:orgName"/>
      <xsl:if test="$organisation/tei:orgName/@type">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="$organisation/tei:orgName/@type"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$organisation"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Template per formattare luoghi in modo più flessibile -->
<xsl:template name="format-place">
  <xsl:param name="place"/>
  <xsl:choose>
    <xsl:when test="$place/tei:placeName">
      <xsl:value-of select="$place/tei:placeName"/>
      <xsl:if test="$place/tei:settlement">
        <xsl:text>, </xsl:text>
        <xsl:value-of select="$place/tei:settlement"/>
      </xsl:if>
      <xsl:if test="$place/tei:district">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="$place/tei:district"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$place"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

  <!-- Template per le immagini del diario modificato -->
  <xsl:template match="tei:surface">
    <img class="imgDiario" src="{tei:graphic/@url}" alt="Pagina {position()} del diario" data-page="{position()}">
      <xsl:attribute name="width">60%</xsl:attribute>
      <xsl:if test="tei:graphic/@height">
        <xsl:attribute name="height">auto</xsl:attribute>
      </xsl:if>
      <div class="page-navigation">
        <div class="nav-prev"></div>
        <div class="nav-next"></div>
      </div>
    </img>
  </xsl:template>

<!-- Template per la numerazione delle righe e il ritorno a capo -->
<xsl:template match="tei:lb">
    <br/>
      <xsl:element name="span">
     <b>
    <xsl:value-of select="@n"/> <!--num riga -->
     </b>
     </xsl:element>
</xsl:template>

<xsl:template match="tei:pb">
    <xsl:element name="div">
      <xsl:attribute name="id">pag_<xsl:value-of select="current()/@n" /></xsl:attribute>
    </xsl:element>
</xsl:template>

<!-- Tempplate per visualizzare i fenomeni testuali -->
<!-- Aggiunte -->
<xsl:template match="tei:add">
    <span class="add">
        <xsl:apply-templates/>
    </span>
</xsl:template>

<!-- Cancellature -->
<xsl:template match="tei:del">
    <span class="del">
        <xsl:apply-templates/>
    </span>
</xsl:template>

<!-- Lacune -->
<xsl:template match="tei:gap">
    <span class="gap">?</span>
</xsl:template>

<!-- Nomi di persone -->
<xsl:template match="tei:persName">
    <span class="persname">
        <xsl:apply-templates/>
    </span>
</xsl:template>

<!-- Nomi di luoghi -->
<xsl:template match="tei:placeName">
    <span class="placename">
        <xsl:apply-templates/>
    </span>
</xsl:template>

<!-- Template per le persone -->
<xsl:template match="tei:back/tei:listPerson/tei:person">
    <div class="nome-principale">
      <xsl:call-template name="format-person">
        <xsl:with-param name="person" select="."/>
      </xsl:call-template>
    </div>
    <div class="entry-info">
      <xsl:if test="tei:birth">
        <div class="dettagli">
          <strong>Nascita:</strong> 
          <xsl:value-of select="tei:birth/tei:date"/>
          <xsl:if test="tei:birth/tei:placeName">
            a <xsl:value-of select="tei:birth/tei:placeName"/>
          </xsl:if>
        </div>
      </xsl:if>
      <xsl:if test="tei:death">
        <div class="dettagli">
          <strong>Morte:</strong> 
          <xsl:value-of select="tei:death/tei:date"/>
          <xsl:if test="tei:death/tei:placeName">
            a <xsl:value-of select="tei:death/tei:placeName"/>
          </xsl:if>
        </div>
      </xsl:if>
      <xsl:if test="tei:occupation">
        <div class="dettagli">
          <strong>Occupazione:</strong>
          <xsl:value-of select="tei:occupation"/>
        </div>
      </xsl:if>
      <xsl:if test="tei:note">
        <div class="dettagli nota">
          <xsl:apply-templates select="tei:note"/>
        </div>
      </xsl:if>
    </div>
</xsl:template>


<!-- Template per i luoghi -->
<xsl:template match="tei:place">
    <div class="nome-principale">
        <xsl:value-of select="tei:placeName"/>
    </div>
    <div class="entry-info">
        <xsl:if test="tei:country">
            <div class="dettagli">
                <strong>Nazione:</strong> 
                <xsl:value-of select="tei:country"/>
                <xsl:if test="tei:country/@type">
                    (<xsl:value-of select="tei:country/@key"/>)
                </xsl:if>
            </div>
        </xsl:if>
        <xsl:if test="tei:settlement">
            <div class="dettagli">
                <strong>Provincia:</strong> 
                <xsl:value-of select="tei:settlement"/>
                <xsl:if test="tei:settlement/@type">
                    (<xsl:value-of select="tei:settlement/@key"/>)
                </xsl:if>
            </div>
        </xsl:if>
        <xsl:if test="tei:desc">
            <div class="dettagli nota">
                <xsl:apply-templates select="tei:desc"/>
            </div>
        </xsl:if>
    </div>
</xsl:template>

<xsl:template match="tei:back/tei:listOrg/tei:org">
    <div class="nome-principale">
        <xsl:choose>
            <!-- Se orgName ha l'attributo 'ref', visualizza come link -->
            <xsl:when test="tei:orgName/@ref">
                <a href="{tei:orgName/@ref}">
                    <xsl:value-of select="tei:orgName"/>
                </a>
            </xsl:when>
            <!-- Altrimenti, visualizza normalmente -->
            <xsl:otherwise>
                <xsl:value-of select="tei:orgName"/>
            </xsl:otherwise>
        </xsl:choose>
    </div>
    <div class="entry-info">
        <xsl:if test="tei:location">
            <div class="dettagli">
                <strong>Sede:</strong> 
                <xsl:value-of select="tei:location"/>
            </div>
        </xsl:if>
        <xsl:if test="tei:desc">
            <div class="dettagli nota">
                <xsl:apply-templates select="tei:desc"/>
            </div>
        </xsl:if>
        <!-- Gestione del paese -->
        <xsl:if test="tei:country">
            <div class="dettagli">
                <strong>Paese:</strong> 
                <xsl:value-of select="tei:country"/>
            </div>
        </xsl:if>
    </div>
</xsl:template>



<!-- Modifiche alla sezione Approfondimenti -->
<xsl:template match="//tei:back">
  <section id="approfondimenti">
    <h2>Approfondimenti</h2>
    
    <xsl:if test="tei:listPerson/tei:person">
      <div id="listPerson">
        <h3>Persone</h3>
        <xsl:apply-templates select="tei:listPerson/tei:person"/>
      </div>
    </xsl:if>
    
    <xsl:if test="tei:listPlace/tei:place">
      <div id="listPlace">
        <h3>Luoghi</h3>
        <xsl:apply-templates select="tei:listPlace/tei:place"/>
      </div>
    </xsl:if>
    
    <xsl:if test="tei:listOrg/tei:org">
      <div id="listOrg">
        <h3>Organizzazioni</h3>
        <xsl:apply-templates select="tei:listOrg/tei:org"/>
      </div>
    </xsl:if>
  </section>
</xsl:template>

<!-- Template per la bibliografia -->
<xsl:template match="tei:bibl">
  <div class="bibliography-entry">
    <div class="bibliography-title">
      <strong><xsl:value-of select="tei:title[@type='main']"/></strong>
    </div>
    <div class="bibliography-details">
      <span class="bibliography-author">
        <xsl:apply-templates select="tei:author/tei:persName"/>
      </span>
      <span class="bibliography-location">
        <xsl:value-of select="tei:pubPlace"/>
      </span>
      <span class="bibliography-publisher">
        <xsl:value-of select="tei:publisher"/>
      </span>
      <span class="bibliography-date">
        <xsl:value-of select="tei:date"/>
      </span>
      <xsl:if test="@type">
        <span class="bibl-type">[<xsl:value-of select="@type"/>]</span>
      </xsl:if>
    </div>
  </div>
</xsl:template>

<!-- Footer -->
<xsl:template match="tei:editionStmt">
  <div class="footer-container">
    <div class="edition-info">
      <h3 class="footer-title"><xsl:value-of select="tei:edition"/></h3>
      <div class="footer-contributors">
        <xsl:for-each select="tei:respStmt">
          <div class="contributor-block">
            <div class="contributor-role">
              <strong><xsl:value-of select="tei:resp"/></strong>
            </div>
            <div class="contributor-names">
              <xsl:for-each select="tei:name">
                <p class="contributor-name"><xsl:value-of select="."/></p>
              </xsl:for-each>
            </div>
          </div>
        </xsl:for-each>
      </div>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>