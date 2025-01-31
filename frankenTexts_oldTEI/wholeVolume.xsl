<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
    xmlns:tei="http://www.tei-c.org/ns/1.0" extension-element-prefixes="redirect"
    exclude-result-prefixes="xhtml redirect tei">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- variables -->
    <xsl:variable name="newline">
        <xsl:text>
			
		</xsl:text>
    </xsl:variable>
  
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Frankenstein</title>
                        <title type="subordinate">A Romantic Circles Electronic Edition</title>
                        <author>
                            <name>Mary Shelley (1797-1851)</name>
                        </author>
                        <editor>Stuart Curran</editor>
                        <sponsor>Romantic Circles</sponsor>
                        <respStmt>
                            <resp>General Editor, </resp>
                            <name>Neil Fraistat</name>
                        </respStmt>
                        <respStmt>
                            <resp>General Editor, </resp>
                            <name>Steven E. Jones</name>
                        </respStmt>
                        <respStmt>
                            <resp>General Editor, </resp>
                            <name>Carl Stahmer</name>
                        </respStmt>
                        <respStmt>
                            <resp>Technical Editor</resp>
                            <name>Laura Mandell</name>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <idno type="edition">frank27.1818</idno>
                        <idno type="nines">rce1209</idno>
                        <publisher>Romantic Circles, http://www.rc.umd.edu, University of Maryland</publisher>
                        <pubPlace>College Park, MD</pubPlace>
                        <date when="2009-04-01">April 1, 2009</date>
                        <availability status="restricted">
                            <p>Material from the Romantic Circles Website may not be downloaded, reproduced or disseminated in any manner without
                                authorization unless it is for purposes of criticism, comment, news reporting, teaching, and/or classroom use as provided by
                                the Copyright Act of 1976, as amended.</p>
                            <p>Unless otherwise noted, all Pages and Resources mounted on Romantic Circles are copyrighted by the author/editor and may be
                                shared only in accordance with the Fair Use provisions of U.S. copyright law. Except as expressly permitted by this statement,
                                redistribution or republication in any medium requires express prior written consent from the author/editors and advance
                                notification of Romantic Circles. Any requests for authorization should be forwarded to Romantic Circles:&gt;
                                <address>
                     <addrLine>Romantic Circles</addrLine>
                     <addrLine>c/o Professor Neil Fraistat</addrLine>
                     <addrLine>Department of English</addrLine>
                     <addrLine>University of Maryland</addrLine>
                     <addrLine>College Park, MD 20742</addrLine>
                     <addrLine>fraistat@umd.edu</addrLine>
                  </address>
                            </p>
                            <p>By their use of these texts and images, users agree to the following conditions: <list>
                                <item>These texts and images may not be used for any commercial purpose without prior written permission from Romantic
                                    Circles.</item>
                                <item>These texts and images may not be re-distributed in any forms other than their current ones.</item>
                            </list>
                            </p>
                            <p>Users are not permitted to download these texts and images in order to mount them on their own servers. It is not in our
                                interest or that of our users to have uncontrolled subsets of our holdings available elsewhere on the Internet. We make
                                corrections and additions to our edited resources on a continual basis, and we want the most current text to be the only one
                                generally available to all Internet users. Institutions can, of course, make a link to the copies at Romantic Circles, subject
                                to our conditions of use.</p>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <biblStruct>
                            <monogr>
                                <author>
                                    <persName>Shelley, Mary Wollstonecraft, 1797-1851</persName>
                                </author>
                                <title type="main" level="m">Frankenstein, </title>
                                <title type="subordinate" level="m">Or, the Modern Prometheus</title>
                                <imprint>
                                    <publisher>Lackington, Hughes, Harding, Mavor, &amp; Jones</publisher>
                                    <pubPlace>London</pubPlace>
                                    <date>1818</date>
                                    <biblScope type="ed">The First Edition</biblScope>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <editorialDecl>
                        <quotation>
                            <p>All quotation marks and apostrophes have been changed: " for “," for ”, ' for ‘, and ' for ’.</p>
                        </quotation>
                        <hyphenation eol="none">
                            <p>Any dashes occurring in line breaks have been removed.</p>
                            <p>Because of web browser variability, all hyphens have been typed on the U.S. keyboard</p>
                            <p>Dashes have been rendered as —</p>
                        </hyphenation>
                        <normalization method="markup">
                            <p>Spelling has not been regularized.</p>
                        </normalization>
                        <normalization>
                            <p>&amp; has been used for the ampersand sign.</p>
                            <p>£ has been used for £, the pound sign</p>
                            <p>All other characters, those with accents, non-breaking spaces, etc., have been encoded in HTML entity decimals.</p>
                        </normalization>
                    </editorialDecl>
                    <classDecl>
                        <taxonomy corresp="http://www.performantsoftware.com/nines_wiki/index.php/Submitting_RDF#.3Cnines:genre.3E"
                            xml:id="g">
                            <bibl>NINES categories for Genre and Material Form at
                                http://www.performantsoftware.com/nines_wiki/index.php/Submitting_RDF#.3Cnines:genre.3E on 2009-02-26</bibl>
                            <category xml:id="g1">
                                <catDesc>Architecture</catDesc>
                            </category>
                            <category xml:id="g2">
                                <catDesc>Artifacts</catDesc>
                            </category>
                            <category xml:id="g3">
                                <catDesc>Bibliography</catDesc>
                            </category>
                            <category xml:id="g4">
                                <catDesc>Collection</catDesc>
                            </category>
                            <category xml:id="g5">
                                <catDesc>Criticism</catDesc>
                            </category>
                            <category xml:id="g7">
                                <catDesc>Letters</catDesc>
                            </category>
                            <category xml:id="g6">
                                <catDesc>Drama</catDesc>
                            </category>
                            <category xml:id="g8">
                                <catDesc>Life Writing</catDesc>
                            </category>
                            <category xml:id="g9">
                                <catDesc>Politics</catDesc>
                            </category>
                            <category xml:id="g10">
                                <catDesc>Folklore</catDesc>
                            </category>
                            <category xml:id="g11">
                                <catDesc>Ephemera</catDesc>
                            </category>
                            <category xml:id="g12">
                                <catDesc>Fiction</catDesc>
                            </category>
                            <category xml:id="g13">
                                <catDesc>History</catDesc>
                            </category>
                            <category xml:id="g14">
                                <catDesc>Leisure</catDesc>
                            </category>
                            <category xml:id="g15">
                                <catDesc>Manuscript</catDesc>
                            </category>
                            <category xml:id="g16">
                                <catDesc>Reference Works</catDesc>
                            </category>
                            <category xml:id="g17">
                                <catDesc>Humor</catDesc>
                            </category>
                            <category xml:id="g18">
                                <catDesc>Education</catDesc>
                            </category>
                            <category xml:id="g19">
                                <catDesc>Music</catDesc>
                            </category>
                            <category xml:id="g20">
                                <catDesc>nonfiction</catDesc>
                            </category>
                            <category xml:id="g21">
                                <catDesc>Paratext</catDesc>
                            </category>
                            <category xml:id="g22">
                                <catDesc>Perodical</catDesc>
                            </category>
                            <category xml:id="g23">
                                <catDesc>Philosphy</catDesc>
                            </category>
                            <category xml:id="g24">
                                <catDesc>Photograph</catDesc>
                            </category>
                            <category xml:id="g25">
                                <catDesc>Citation</catDesc>
                            </category>
                            <category xml:id="g26">
                                <catDesc>Family Life</catDesc>
                            </category>
                            <category xml:id="g27">
                                <catDesc>Poetry</catDesc>
                            </category>
                            <category xml:id="g28">
                                <catDesc>Religion</catDesc>
                            </category>
                            <category xml:id="g29">
                                <catDesc>Review</catDesc>
                            </category>
                            <category xml:id="g30">
                                <catDesc>Visual Art</catDesc>
                            </category>
                            <category xml:id="g31">
                                <catDesc>Translation</catDesc>
                            </category>
                            <category xml:id="g32">
                                <catDesc>Travel</catDesc>
                            </category>
                            <category xml:id="g33">
                                <catDesc>Book History</catDesc>
                            </category>
                            <category xml:id="g34">
                                <catDesc>Law</catDesc>
                            </category>
                        </taxonomy>
                    </classDecl>
                </encodingDesc>
                <profileDesc>
                    <textClass>
                        <catRef scheme="#genre" target="#g12"/>
                    </textClass>
                </profileDesc>
                <revisionDesc>
                    <change who="#LM" when="2009-05-01" n="3">
                        <label>Changed by</label>
                        <name xml:id="LM">Laura Mandell</name>
                        <list>
                            <item>XSLT Transforming into TEI, RDF</item>
                        </list>
                    </change>
                    <change who="#DR" when="2009-05-01" n="2">
                        <label>Changed by</label>
                        <name xml:id="DR">David Rettenmaier</name>
                        <list>
                            <item>XHTML Encoding</item>
                        </list>
                    </change>
                    <change who="#MQ" when="2009-05-01" n="1">
                        <label>Changed by</label>
                        <name xml:id="MQ">Mike Quilligan</name>
                        <list>
                            <item>XHTML Encoding</item>
                        </list>
                    </change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
        <xsl:for-each select="Frankenstein/part">
            <xsl:apply-templates select="document(@code)/tei:TEI"/>
        </xsl:for-each>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="tei:TEI">
                <xsl:apply-templates select="tei:text"/>
    </xsl:template>
    
    <xsl:template match="tei:text">
        <xsl:variable name="volch">
            <xsl:value-of select="substring-after(ancestor-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='edition'], 'frank27.1818')"/>
        </xsl:variable>
        <div type="chapter" n="{$volch}" xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="tei:body"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:body">
            <xsl:apply-templates/>
    </xsl:template>

        <xsl:template match="@* | node()">
            <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </xsl:template>
    
  
</xsl:stylesheet>