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
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="addrIPv4" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="addrMac" TYPE="TEXT"/>
        <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="addrMacVendor" TYPE="TEXT"/>
      </METADATA>
      <RESULTSET FOUND="{count(/nmaprun/host)}">
        <xsl:apply-templates select="/nmaprun/host"/>
      </RESULTSET>
    </FMPXMLRESULT>
  </xsl:template>
  <xsl:template match="*[name() = 'host']">
    <ROW xmlns="http://www.filemaker.com/fmpxmlresult" MODID="0" RECORDID="{position()}">
      <COL>
        <DATA>
          <xsl:value-of select="address[ @addrtype = 'mac' ]/@addr" /><xsl:value-of select="address[ @addrtype = 'ipv4' ]/@addr" />
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="address[ @addrtype = 'ipv4' ]/@addr" />
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="address[ @addrtype = 'mac' ]/@addr" />
        </DATA>
      </COL>
      <COL>
        <DATA>
          <xsl:value-of select="address[ @addrtype = 'mac' ]/@vendor" />
        </DATA>
      </COL>
    </ROW>
  </xsl:template>
</xsl:stylesheet>
