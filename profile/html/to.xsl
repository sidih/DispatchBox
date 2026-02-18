<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs" version="2.0">

   <xsl:import href="../sistory/html5-foundation6/to.xsl"/>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6
            http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed: 1. Distributed under a Creative Commons
            Attribution-ShareAlike 3.0 Unported License
            http://creativecommons.org/licenses/by-sa/3.0/ 2.
            http://www.opensource.org/licenses/BSD-2-Clause Redistribution and use in source and
            binary forms, with or without modification, are permitted provided that the following
            conditions are met: * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer. * Redistributions in
            binary form must reproduce the above copyright notice, this list of conditions and the
            following disclaimer in the documentation and/or other materials provided with the
            distribution. This software is provided by the copyright holders and contributors "as
            is" and any express or implied warranties, including, but not limited to, the implied
            warranties of merchantability and fitness for a particular purpose are disclaimed. In no
            event shall the copyright holder or contributors be liable for any direct, indirect,
            incidental, special, exemplary, or consequential damages (including, but not limited to,
            procurement of substitute goods or services; loss of use, data, or profits; or business
            interruption) however caused and on any theory of liability, whether in contract, strict
            liability, or tort (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage. </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>

   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- https://www2.sistory.si/publikacije/ -->
   <!-- ../../../  -->
   <xsl:param name="path-general">https://www2.sistory.si/publikacije/</xsl:param>

   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>

   <xsl:param name="homeLabel"></xsl:param>
   <xsl:param name="homeURL">https://sidih.github.io/DispatchBox/</xsl:param>

   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>

   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>

   <xsl:param name="documentationLanguage">en</xsl:param>

   <xsl:param name="languages-locale">false</xsl:param>
   <xsl:param name="languages-locale-primary">en</xsl:param>

   <!-- odstranim pri spodnjih param true -->
   <xsl:param name="numberFigures"/>
   <xsl:param name="numberFrontTables"/>
   <xsl:param name="numberHeadings"/>
   <xsl:param name="numberParagraphs">true</xsl:param>
   <xsl:param name="numberTables"/>

   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description">Publikacija From the Dispatch Box: unlocking the potential of ParlaMint through noSketch Engine and TEITOK</xsl:param>
   <xsl:param name="keywords">digital textbook, European parliaments, ParlaMint</xsl:param>
   <xsl:param name="title">From the Dispatch Box: unlocking the potential of ParlaMint through noSketch Engine and TEITOK</xsl:param>

   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>V css Hook dodam še nokaj projektno specifičnih CSS</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="cssHook">
      <xsl:if test="$title-bar-sticky = 'true'">
         <xsl:value-of
            select="concat($path-general, 'themes/css/foundation/6/sistory-sticky_title_bar.css')"/>
      </xsl:if>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css"
         rel="stylesheet" type="text/css"/>
      <link
         href="{concat($path-general,'themes/plugin/TipueSearch/6.1/tipuesearch/css/normalize.css')}"
         rel="stylesheet" type="text/css"/>
      <link href="{concat($path-general,'themes/css/plugin/TipueSearch/6.1/my-tipuesearch.css')}"
         rel="stylesheet" type="text/css"/>
      <!-- dodan imageViewer -->
      <link href="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.css')}"
         rel="stylesheet" type="text/css"/>
      <!-- dodam za povezave na same sebe -->
      <style>
         .selflink:hover {
            opacity: 0.5;
         }
         .keywordlink:hover {
            opacity: 0.5;
         }
         .numberParagraphLink {
            text-decoration: none;
         }
         .numberParagraph:hover {
            color: black;
         }</style>
      <style>
         /*dt + dd::before {
            content: "\2022" " ";
         }*/
         dt, dd {
         display: block;
         margin-block: -5px;
         }
         dt + dd::before {
         content: none;
         }              
         .tipue_search_button {
         width: 100px;
         height: 37px;
         border: 0;
         border-radius: 1px;
         background: #8e130b url(search.png) no-repeat center;
         outline: none;
         }         
         .imageviewer {
         cursor: -moz-zoom-in; 
         cursor: -webkit-zoom-in; 
         cursor: zoom-in;
         }         
         h5 {
         color: #6b6b6b;
         }
         #DispatchBox-head-10 {
         font-size: 20px;
         color: #6b6b6b;
         }         
         .is-dropdown-submenu {
         width: max-content;
         min-width: 12rem;     
         max-width: 20rem;
         }         
         .fi-home:before {
         padding-top: .3rem;
         padding-right: 1rem;
         font-size: 28px;
         }         
         .chapter {
         margin-top: 3rem;
         }         
         .subchapter {
         margin-top: 3rem;
         } 
         #table2 tr:nth-child(even) {
         background-color: transparent;
         }         
      </style>
   </xsl:template>
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>[html] Hook where extra Javascript functions can be defined</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="javascriptHook">
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/jquery.js')}"/>
      <!-- za highcharts -->
      <xsl:if
         test="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']]">
         <xsl:variable name="jsfile"
            select="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']][1]/tei:graphic[@mimeType = 'application/javascript']/@url"/>
         <xsl:variable name="chart-jsfile" select="document($jsfile)/html/body/script[1]/@src"/>
         <script src="{$chart-jsfile[1]}"/>
      </xsl:if>
      <!-- za back-to-top in highcharts je drugače potrebno dati jquery, vendar sedaj ne rabim dodajati jquery kodo,
         ker je že vsebovana zgoraj -->
      <!-- dodan imageViewer -->
      <script src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.js')}"/>
   </xsl:template>

   <!--<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure">
      <xsl:variable name="image-file-name" select="tokenize(tei:graphic/@url,'/')[last()]"/>
      <xsl:variable name="height" select="if (tei:graphic/@height) then 'max' else ',600'"/>
      <figure id="{@xml:id}">
         <img class="imageviewer" src="{concat('https://sidih.si/iiif/2/entity|1-1000|120|',$image-file-name,'/full/',$height,'/0/default.jpg')}" data-high-res-src="{concat('https://sidih.si/cdn/120/',$image-file-name)}" alt="{normalize-space(tei:head)}"/>
         <figcaption>
            <xsl:apply-templates select="tei:head"/>
         </figcaption>
      </figure>
      <br/>
      <br/>
   </xsl:template> -->

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer - 400 px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="height:400px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <!--<xsl:value-of select="tei:head[1]"/>-->
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <!--<xsl:value-of select="tei:head[2]"/>-->
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer1 - 600px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer1']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="height:600px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer2 - 200px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer2']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="height:200px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer2a - width 150px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer2a']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="width:150px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer3 - width:450px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer3']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="width:450px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer4 - width:250px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer4']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="width:350px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer4 - width:900px - Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer5']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="width:900px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
         <figcaption style="font-size:10pt">
            <br/>
            <xsl:apply-templates select="tei:head[1]"/>
            <br/>
            <xsl:apply-templates select="tei:head[2]"/>
         </figcaption>
      </figure>
      <br/>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>imageviewer_table - Slike tabel, naslov naj bo nad tabelo, še vseeno vključena možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'imageviewer_table']">
      <figure id="{@xml:id}">
         <figcaption style="font-style:italic; font-weight:700">
            <xsl:apply-templates select="tei:head"/>
         </figcaption>
         <img class="imageviewer" style="width:450px;"
            src="{tei:graphic[contains(@url,'normal')]/@url}"
            data-high-res-src="{tei:graphic[1]/@url}" alt="{tei:head}"/>
      </figure>
      <br/>
   </xsl:template>


   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Dodam zaključni javascript za ImageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="bodyEndHook">
      <script type="text/javascript">
      $(function () {
         var viewer = ImageViewer();
         $('.imageviewer').click(function () {
            var imgSrc = this.src,
            highResolutionImage = $(this).data('high-res-src');
            viewer.show(imgSrc, highResolutionImage);
         });
      });</script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/what-input.js')}"/>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/foundation.min.js')}"/>
      <script src="{concat($path-general,'themes/foundation/6/js/app.js')}"/>
      <!-- back-to-top -->
      <script src="{concat($path-general,'themes/js/plugin/back-to-top/back-to-top.js')}"/>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Procesiranje specifilnih vsebinskih sklopov</desc>
   </doc>
   <xsl:template match="tei:note[@rend = 'bluebox']">
      <div id="{@xml:id}" class="callout primary">
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>How to number paragraphs: ga bom predrogačil na način, da bo omogočil linke na samega
         sebe</desc>
   </doc>
   <xsl:template name="numberParagraph">
      <xsl:choose>
         <xsl:when test="@xml:id and $numberParagraphs = 'true'">
            <!-- dodam zunanji span in nato a -->
            <span>
               <a href="#{@xml:id}" title="number paragraph link" class="numberParagraphLink">
                  <span class="numberParagraph">
                     <xsl:number/>
                  </span>
               </a>
            </span>
         </xsl:when>
         <xsl:otherwise>
            <span class="numberParagraph">
               <xsl:number/>
            </span>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>video prikaz</desc>
   </doc>
   <xsl:template match="tei:graphic[@mimeType = 'video/mp4']">
      <video width="420" height="345" controls="">
         <source src="{@url}" type="video/mp4"/> Your browser does not support the video tag.
      </video>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc/>
   </doc>
   <xsl:template match="tei:quote">
      <xsl:choose>
         <!-- Če ni znotraj odstavka -->
         <xsl:when test="not(ancestor::tei:p)">
            <blockquote>
               <xsl:choose>
                  <xsl:when test="@xml:id and not(parent::tei:cit[@xml:id])">
                     <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                     </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="parent::tei:cit[@xml:id]">
                     <xsl:attribute name="id">
                        <xsl:value-of select="parent::tei:cit/@xml:id"/>
                     </xsl:attribute>
                  </xsl:when>
               </xsl:choose>
               <xsl:apply-templates/>
               <!-- glej spodaj obrazložitev pri procesiranju elementov cit -->
               <!-- sem preuredil originalno pretvorbo in odstranil pogoj parent::tei:cit/tei:bibl/tei:author -->
               <xsl:if test="parent::tei:cit/tei:bibl">
                  <!-- odstranil na koncu parent::tei:cit/tei:bibl/tei:author -->
                  <xsl:for-each select="parent::tei:cit/tei:bibl">
                     <cite>
                        <xsl:apply-templates/>
                     </cite>
                  </xsl:for-each>
               </xsl:if>
            </blockquote>
         </xsl:when>
         <!-- Če pa je znotraj odstavka, ga damo samo v element q, se pravi v narekovaje. -->
         <xsl:otherwise>
            <q>
               <xsl:apply-templates/>
            </q>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Če je naveden tudi avtor citata, damo predhodno element quote v parent element cit
         in mu dodamo še sibling element bibl
    -->
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Preuredim template iz tei:bibl[tei:author] v tei:cit/tei:bibl</desc>
   </doc>
   <xsl:template match="tei:cit/tei:bibl">
      <!-- ta element pustimo prazen,ker ga procesiroma zgoraj v okviru elementa quote -->
   </xsl:template>

   <!-- KAZALO SLIK -->
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Odstranil procesiranje tei:figure[@type='table']</desc>
      <param name="thisLanguage"/>
   </doc>
   <xsl:template name="images">
      <xsl:param name="thisLanguage"/>
      <!-- izpiše vse slike -->
      <ul class="circel">
         <xsl:for-each select="
               //tei:figure[if ($languages-locale = 'true') then
                  ancestor::tei:div[@xml:id][@xml:lang = $thisLanguage]
               else
                  @xml:id][tei:graphic][not(@type = 'chart')][not(@type = 'table')]">
            <xsl:variable name="figure-id" select="@xml:id"/>
            <xsl:variable name="image-chapter-id"
               select="ancestor::tei:div[@xml:id][parent::tei:front | parent::tei:body | parent::tei:back]/@xml:id"/>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications = 'true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$image-chapter-id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <li>
               <a href="{concat($sistoryPath,$image-chapter-id,'.html#',$figure-id)}">
                  <!-- V kazalih slik pri naslovih slik prikažem le besediilo naslova, brez besedila opombe -->
                  <xsl:apply-templates select="tei:head" mode="slika"/>
               </a>
            </li>
         </xsl:for-each>
      </ul>
      <!-- konec procesiranja slik -->
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>V kazalih slik pri naslovih slik prikažem le besediilo naslova, brez besedila
         opombe</desc>
   </doc>
   <xsl:template match="tei:head" mode="slika">
      <xsl:apply-templates mode="slika"/>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>V kazalih slik pri naslovih slik prikažem le besediilo naslova, brez besedila
         opombe</desc>
   </doc>
   <xsl:template match="tei:note" mode="slika"> </xsl:template>

   <!-- KAZALO TABEL -->
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Namesto tei:table procesira tei:*[@type='table'] - * zato ker so tabele v figure in v table elementih</desc>
      <param name="thisLanguage"/>
   </doc>
   <xsl:template name="tables">
      <xsl:param name="thisLanguage"/>
      <!-- izpiše vse tabele, ki imajo naslov (s tem filtriramo tiste tabele, ki so v okviru grafikonov) -->
      <ul class="circel">
         <xsl:for-each select="
               //tei:*[@type = 'table'][if ($languages-locale = 'true') then
                  ancestor::tei:div[@xml:id][@xml:lang = $thisLanguage]
               else
                  @xml:id][tei:head]">
            <xsl:variable name="table-id" select="@xml:id"/>
            <xsl:variable name="table-chapter-id"
               select="ancestor::tei:div[@xml:id][parent::tei:front | parent::tei:body | parent::tei:back]/@xml:id"/>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications = 'true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$table-chapter-id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <li>
               <a href="{concat($sistoryPath,$table-chapter-id,'.html#',$table-id)}">
                  <!-- V kazalih slik pri naslovih slik prikažem le besediilo naslova, brez besedila opombe -->
                  <xsl:apply-templates select="tei:head" mode="slika"/>
               </a>
            </li>
         </xsl:for-each>
      </ul>
      <!-- konec procesiranja slik -->
   </xsl:template>

   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc> NASLOVNA STRAN </xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titlePage">
      <!-- avtor -->
      <br/>
      <p  class="naslovnicaAvtor">
         <xsl:for-each select="tei:docAuthor">
            <xsl:choose>
               <xsl:when test="tei:forename or tei:surname">
                  <xsl:for-each select="tei:forename">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="tei:surname">
                     <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:for-each select="tei:surname">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() ne last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <!--<br/>
      <!-\- naslov: spremenjeno procesiranje naslovov -\->
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='en']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <hr/>
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='sl']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <br/>
      <xsl:if test="tei:figure">
         <div class="text-center">
            <p>
               <img src="{tei:figure/tei:graphic/@url}" alt="naslovna slika"/>
            </p>
         </div>
      </xsl:if>-->
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='en']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <hr/>
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='sl']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <br/>
      <xsl:if test="tei:graphic">
         <div class="text-center">
            <p>
               <img src="{tei:graphic[1]/@url}" alt="naslovna slika" style="max-height: 800px;"/>
            </p>
            <p>Image source: <a href="http://espreso.tv/" rel="noopener" target="_blank">espreso.tv</a></p>
            <p>
               <a href="https://inz.si/" target="_blank" rel="noopener"><img src="{tei:graphic[2]/@url}" alt="logo INZ" style="max-width: 250px;"></img></a>
            </p>
         </div>
      </xsl:if>
      <!--<br/>
      <p class="text-center">
         <!-\- založnik -\->
         <xsl:for-each select="tei:docImprint/tei:publisher">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-\- kraj izdaje -\->
         <xsl:for-each select="tei:docImprint/tei:pubPlace">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-\- leto izdaje -\->
         <xsl:for-each select="tei:docImprint/tei:docDate">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
      </p>-->
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Dodatno za kolofon: procesiranje idno</desc>
   </doc>
   <xsl:template match="tei:publicationStmt" mode="kolofon">
      <xsl:apply-templates select="tei:publisher" mode="kolofon"/>
      <xsl:apply-templates select="tei:date" mode="kolofon"/>
      <xsl:apply-templates select="tei:pubPlace" mode="kolofon"/>
      <xsl:apply-templates select="tei:availability" mode="kolofon"/>
      <xsl:apply-templates select="tei:idno" mode="kolofon"/>
   </xsl:template>

   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc/>
   </doc>
   <xsl:template match="tei:idno" mode="kolofon">
      <p>
         <xsl:choose>
            <xsl:when test="matches(., 'https?://')">
               <a href="{.}">
                  <xsl:value-of select="."/>
               </a>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="concat(@type, ' ', .)"/>
            </xsl:otherwise>
         </xsl:choose>
      </p>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Vse povezave ki gredo na www se morajo odpreti v novem zavihku in imeti noopener in noreferrer. ostale pusti</desc>
   </doc>
   <xsl:template match="tei:text//tei:ref[matches(@target, '^https?://')]">
      <a href="{@target}" target="_blank" rel="noopener noreferrer">
         <xsl:apply-templates/>
      </a>
   </xsl:template>
   
   
   
   <!--<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Vse povezave ki gredo na www se morajo odpreti v novem zavihku in imeti noopener in noreferrer. ostale pusti</desc>
   </doc>
   <xsl:template match="tei:text//tei:ref">
      <a href="{@target}">
         
         <xsl:if test=" matches(@target, 'https?://')">
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:attribute name="ref">noopener norefferer</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates/>
      </a>
   </xsl:template>-->
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Ni ločil med avtorji pri navedbi licence ma cip strani. Dodal tudi v myi18n besedo "in" čisto na koncu</desc>
   </doc>
   <xsl:template match="tei:licence" mode="kolofon">
      <!-- dodaj še ostale možne licence -->
      <xsl:if test="contains(.,'/by-nc-nd/4.0/')">
         <p>
            <a rel="license" href="{.}">
               <img alt="Creative Commons licenca" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" />
            </a>
            <br />
            <xsl:sequence select="tei:i18n('by-nc-nd/4.0 text 1')"/><xsl:text> </xsl:text>
            <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">
               <xsl:sequence select="tei:i18n('by-nc-nd/4.0 text 2')"/>
            </span>
            <xsl:if test="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author">
               <xsl:text> </xsl:text>
               <xsl:sequence select="tei:i18n('by-nc-nd/4.0 text 3')"/>
               <xsl:text> </xsl:text>
               <a xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName" rel="cc:attributionURL" href="{ancestor::tei:publicationStmt/tei:pubPlace/tei:ref}">
                  <!-- SPREMENIL: Poiščem avtorje.
                         Imena in priimki ločeni s presledkom, avtorji z vejico -->
                  <xsl:for-each select="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author">
                     <xsl:choose>
                        <xsl:when test="position() = 1"/>
                        <xsl:when test="position() = last()">
                          <xsl:text>  </xsl:text>
                          <xsl:sequence select="tei:i18n('In')"/>
                          <xsl:text>  </xsl:text>                           
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text>, </xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     
                     <!-- ime avtorja in nato presledek pred priimkom-->
                     <xsl:for-each select="tei:forename">
                        <xsl:value-of select="."/>
                        <xsl:text> </xsl:text>
                     </xsl:for-each>
                     
                     <xsl:value-of select="tei:surname"/>
                  </xsl:for-each>
               </a>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:sequence select="tei:i18n('by-nc-nd/4.0 text 4')"/>
            <xsl:text> </xsl:text>
            <a rel="license" href="{.}">
               <xsl:sequence select="tei:i18n('by-nc-nd/4.0 text 5')"/>
            </a>
         </p>
      </xsl:if>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
      <param name="thisChapter-id"></param>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="html-header">
      <xsl:param name="thisChapter-id"/>
      <xsl:param name="thisLanguage"/>
      <header>
         <div class="hide-for-large">
            <xsl:if test="$title-bar-sticky = 'true'">
               <xsl:attribute name="data-sticky-container"/>
            </xsl:if>
            <div id="header-bar">
               <xsl:if test="$title-bar-sticky = 'true'">
                  <xsl:attribute name="data-sticky"/>
                  <xsl:attribute name="data-sticky-on">small</xsl:attribute>
                  <xsl:attribute name="data-options">marginTop:0;</xsl:attribute>
                  <xsl:attribute name="style">width:100%</xsl:attribute>
                  <xsl:attribute name="data-top-anchor">1</xsl:attribute>
               </xsl:if>
               <div class="title-bar" data-responsive-toggle="publication-menu" data-hide-for="large">
                  <button class="menu-icon" type="button" data-toggle=""></button>
                  <div class="title-bar-title">
                     <xsl:choose>
                        <xsl:when test="$languages-locale='true'">
                           <xsl:call-template name="myi18n-lang">
                              <xsl:with-param name="word">Menu</xsl:with-param>
                              <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
                           </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:sequence select="tei:i18n('Menu')"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </div>
                  <div class="title-bar-right">
                     <a class="title-bar-title" href="{$homeURL}">
                        <i class="fi-home" style="color:white;"></i>
                     </a>
                  </div>
                  <div id="publication-menu" class="hide-for-large">
                     <ul class="vertical menu" data-drilldown="" data-options="backButton: &lt;li class=&quot;js-drilldown-back&quot;&gt;&lt;a tabindex=&quot;0&quot;&gt;{tei:i18n('Nazaj')}&lt;/a&gt;&lt;/li&gt;;">
                        <xsl:call-template name="title-bar-list-of-contents">
                           <xsl:with-param name="title-bar-type">vertical</xsl:with-param>
                           <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
                           <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
                        </xsl:call-template>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         
         <div class="show-for-large">
            <xsl:if test="$title-bar-sticky = 'true'">
               <xsl:attribute name="data-sticky-container"/>
            </xsl:if>
            <nav class="title-bar">
               <xsl:if test="$title-bar-sticky = 'true'">
                  <xsl:attribute name="data-sticky"/>
                  <xsl:attribute name="data-options">marginTop:0;</xsl:attribute>
                  <xsl:attribute name="style">width:100%</xsl:attribute>
                  <xsl:attribute name="data-top-anchor">1</xsl:attribute>
               </xsl:if>
               <div class="title-bar-right">
                  <a class="title-bar-title" href="{$homeURL}">
                     <i class="fi-home" style="color:white;"></i>
                     <xsl:text> </xsl:text>
                     <span>
                        <xsl:value-of select="$homeLabel"/>
                     </span>
                  </a>
               </div>
               <div class="title-bar-left">
                  <ul class="dropdown menu" data-dropdown-menu="">
                     <xsl:call-template name="title-bar-list-of-contents">
                        <xsl:with-param name="title-bar-type">dropdown</xsl:with-param>
                        <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
                        <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
                     </xsl:call-template>
                  </ul>
               </div>
            </nav>
         </div>
         
         <!-- iskalnik -->
         <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='search']">
            <xsl:choose>
               <xsl:when test="$languages-locale='true'">
                  <xsl:variable name="sistoryPath-search">
                     <xsl:if test="$chapterAsSIstoryPublications='true'">
                        <xsl:call-template name="sistoryPath">
                           <xsl:with-param name="chapterID" select="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='search'][@xml:lang=$thisLanguage]/@xml:id"/>
                        </xsl:call-template>
                     </xsl:if>
                  </xsl:variable>
                  <form action="{concat($sistoryPath-search,ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='search'][@xml:lang=$thisLanguage]/@xml:id,'.html')}">
                     <div class="row collapse">
                        <div class="small-10 large-11 columns">
                           <input type="text" name="q" id="tipue_search_input">
                              <xsl:attribute name="placeholder">
                                 <xsl:call-template name="myi18n-lang">
                                    <xsl:with-param name="word">Search placeholder</xsl:with-param>
                                    <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
                                 </xsl:call-template>
                              </xsl:attribute>
                           </input>
                        </div>
                        <div class="small-2 large-1 columns">
                           <img type="button" class="tipue_search_button"/>
                        </div>
                     </div>
                  </form>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:variable name="sistoryPath-search">
                     <xsl:if test="$chapterAsSIstoryPublications='true'">
                        <xsl:call-template name="sistoryPath">
                           <xsl:with-param name="chapterID" select="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='search']/@xml:id"/>
                        </xsl:call-template>
                     </xsl:if>
                  </xsl:variable>
                  <form action="{concat($sistoryPath-search,ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='search']/@xml:id,'.html')}">
                     <div class="row collapse">
                        <div class="small-10 large-11 columns">
                           <input type="text" name="q" id="tipue_search_input" placeholder="{tei:i18n('Search placeholder')}"/>
                        </div>
                        <div class="small-2 large-1 columns">
                           <img type="button" class="tipue_search_button"/>
                        </div>
                     </div>
                  </form>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:if>
      </header>
   </xsl:template>
   
   
</xsl:stylesheet>
