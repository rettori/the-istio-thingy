<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8"/>

  <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

  <xsl:variable name="apache_v2_name" select="'Apache Software License, Version 2.0'"/>
  <xsl:variable name="apache_v2_url" select="'http://www.apache.org/licenses/LICENSE-2.0.txt'"/>

  <xsl:variable name="eclipse_v1_name" select="'Eclipse Public License, Version 1.0'"/>
  <xsl:variable name="eclipse_v1_url" select="'http://www.eclipse.org/legal/epl-v10.html'"/>

  <xsl:variable name="lgpl_v21_name" select="'GNU Lesser General Public License, Version 2.1'"/>
  <xsl:variable name="lgpl_v21_url" select="'http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html'"/>

  <xsl:variable name="bsd_2_name" select="'BSD 2-clause &quot;Simplified&quot; License'"/>
  <xsl:variable name="bsd_2_url" select="'http://www.opensource.org/licenses/bsd-2-clause'"/>

  <xsl:variable name="bsd_3_name" select="'BSD 3-clause &quot;New&quot; or &quot;Revised&quot; License'"/>
  <xsl:variable name="bsd_3_url" select="'https://opensource.org/licenses/bsd-3-clause'"/>

  <xsl:variable name="json_name" select="'JSON License'"/>
  <xsl:variable name="json_url" select="'http://www.json.org/license.html'"/>

  <xsl:variable name="mit_name" select="'The MIT License'"/>
  <xsl:variable name="mit_url" select="'https://opensource.org/licenses/mit'"/>

  <xsl:variable name="cc0_name" select="'Creative Commons Zero v1.0 Universal'"/>
  <xsl:variable name="cc0_url" select="'http://creativecommons.org/publicdomain/zero/1.0/legalcode'"/>

  <xsl:variable name="cddl_11_gpl2_name" select="'Dual license consisting of the CDDL v1.1 and GPL v2'"/>
  <xsl:variable name="cddl_11_gpl2_url" select="'https://oss.oracle.com/licenses/CDDL+GPL-1.1'"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="license">
    <xsl:choose>
      <!-- Custom license modifications -->
      <xsl:when test="contains(ancestor::dependency/groupId/text(), 'org.ow2.asm')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$bsd_3_name"/>
          <xsl:with-param name="url" select="$bsd_3_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(ancestor::dependency/groupId/text(), 'org.mockito')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$mit_name"/>
          <xsl:with-param name="url" select="$mit_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(ancestor::dependency/groupId/text(), 'com.jayway.awaitility')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$apache_v2_name"/>
          <xsl:with-param name="url" select="$apache_v2_url"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Generic license modifications -->
      <xsl:when test="contains(translate(url/text(), $uppercase, $lowercase), 'www.apache.org/licenses/license-2.0')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$apache_v2_name"/>
          <xsl:with-param name="url" select="$apache_v2_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'www.eclipse.org/legal/epl-v10')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$eclipse_v1_name"/>
          <xsl:with-param name="url" select="$eclipse_v1_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'www.gnu.org/licenses/old-licenses/lgpl-2.1')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$lgpl_v21_name"/>
          <xsl:with-param name="url" select="$lgpl_v21_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'www.opensource.org/licenses/bsd-license')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$bsd_2_name"/>
          <xsl:with-param name="url" select="$bsd_2_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'json.org')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$json_name"/>
          <xsl:with-param name="url" select="$json_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'www.opensource.org/licenses/mit-license')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$mit_name"/>
          <xsl:with-param name="url" select="$mit_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'creativecommons.org/publicdomain/zero/1.0')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$cc0_name"/>
          <xsl:with-param name="url" select="$cc0_url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(translate(., $uppercase, $lowercase), 'glassfish.java.net/public/cddl+gpl_1_1.html')">
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="$cddl_11_gpl2_name"/>
          <xsl:with-param name="url" select="$cddl_11_gpl2_url"/>
        </xsl:call-template>
      </xsl:when>
      <!-- If nothing matches, leave original values -->
      <xsl:otherwise>
        <xsl:call-template name="license">
          <xsl:with-param name="name" select="name/text()"/>
          <xsl:with-param name="url" select="url/text()"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="license">
    <xsl:param name="name"/>
    <xsl:param name="url"/>
    <license>
      <name><xsl:value-of select="$name"/></name>
      <url><xsl:value-of select="$url"/></url>
    </license>
  </xsl:template>


</xsl:stylesheet>
