<?xml version="1.0" encoding="UTF-8"?>
<!-- Written by Gjermund G Thorsen -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:eurofxref="http://www.ecb.int/vocabulary/2002-08-01/eurofxref" version="1.0" exclude-result-prefixes="eurofxref">
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
  <xsl:template match="/*">
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
      <ERRORCODE>0</ERRORCODE>
      <PRODUCT BUILD="" NAME="" VERSION=""/>
      <DATABASE DATEFORMAT="M/d/yyyy" LAYOUT="" NAME="" RECORDS="1" TIMEFORMAT="h:mm:ss a"/>
      <METADATA>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="pkHost" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="pkPort" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="created" TYPE="TIMESTAMP"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="state" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="protocol" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="port" TYPE="NUMBER"/>
      </METADATA>
      <RESULTSET FOUND="{count(/nmaprun/host/ports/port)}">
        <xsl:apply-templates select="/nmaprun/host/ports/port"/>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
  <xsl:template match="*[name() = 'port']">
    <ROW xmlns="http://www.filemaker.com/fmpxmlresult" MODID="0" RECORDID="{position()}">
      <COL>
        <DATA>
          <xsl:value-of select="../../address[ @addrtype = 'mac' ]/@addr" /><xsl:value-of select="../../address[ @addrtype = 'ipv4' ]/@addr" />
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="../../address[ @addrtype = 'mac' ]/@addr" /><xsl:value-of select="../../address[ @addrtype = 'ipv4' ]/@addr" /><xsl:value-of select="@portid"/>
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="../../../host[position()]/@endtime" />
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="state/@state"/>
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="@protocol"/>
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="@portid"/>
        </DATA>
      </COL>
    </ROW>
  </xsl:template>
</xsl:stylesheet>
