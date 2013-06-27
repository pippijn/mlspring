<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:output method="text"/>

   <xsl:template match="/ProtocolDescription">
      <xsl:text>let cmds = ProtoType.([</xsl:text>
      <xsl:apply-templates select="CommandList"/>
      <xsl:text>
])</xsl:text>
   </xsl:template>

   <xsl:template match="CommandList">
      <xsl:apply-templates select="Command"/>
   </xsl:template>

   <xsl:template match="Command">
      <xsl:text>
  { cmd = "</xsl:text>
      <xsl:value-of select="@Name"/>

      <xsl:text>"; kind = </xsl:text>
      <xsl:choose>
         <xsl:when test="@Source = 'client'">Client</xsl:when>
         <xsl:when test="@Source = 'server'">Server</xsl:when>
         <xsl:otherwise>Unknown</xsl:otherwise>
      </xsl:choose>

      <xsl:text>; args = [</xsl:text>
      <xsl:choose>
         <xsl:when test="Arguments/Argument[last()]/@Name = '...'">

            <xsl:text>
      { name = "</xsl:text>
            <xsl:value-of select="substring(Arguments/Argument[1]/@Name, 0, string-length(Arguments/Argument[1]/@Name))"/>

            <xsl:text>s"; optional = </xsl:text>
            <xsl:choose>
               <xsl:when test="Arguments/Argument[1]/@Optional = 'yes'">true</xsl:when>
               <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
            <xsl:text>; sentence = </xsl:text>
            <xsl:choose>
               <xsl:when test="Arguments/Argument[1]/@Sentence = 'yes'">true</xsl:when>
               <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
            <xsl:text>; list = true; };</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="Arguments"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
         <xsl:when test="count(Arguments/Argument)"><xsl:text>
    ];
  };</xsl:text></xsl:when>
         <xsl:otherwise>
            <xsl:text>]; };</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="Arguments">
      <xsl:apply-templates select="Argument"/>
   </xsl:template>

   <xsl:template match="Argument">
      <xsl:text>
      { name = "</xsl:text>
      <xsl:value-of select="@Name"/>

      <xsl:text>"; optional = </xsl:text>
      <xsl:choose>
         <xsl:when test="@Optional = 'yes'">true</xsl:when>
         <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>

      <xsl:text>; sentence = </xsl:text>
      <xsl:choose>
         <xsl:when test="@Sentence = 'yes'">true</xsl:when>
         <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>

      <xsl:text>; list = false; };</xsl:text>
   </xsl:template>

</xsl:stylesheet>
