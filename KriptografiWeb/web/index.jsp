<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="test.base64.*,java.sql.*,org.xmldb.api.base.*,org.xmldb.api.modules.*,org.xmldb.api.*,javax.xml.parsers.*,org.w3c.dom.*,org.apache.xerces.parsers.*,util.*" errorPage="" %>
<%
	session.setAttribute("menu","1");
	session.setAttribute("submenu","1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/index.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Rumah Sakit Pusat Kota Semarang</title>
<!-- InstanceEndEditable -->
<link rel="stylesheet" type="text/css" href="css/avg/index.css" media="all">
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
<%  
	
	String hak_akses_halaman=""; 
		//===========   Xindice
        String xdriver = "org.apache.xindice.client.xmldb.DatabaseImpl";
        Class xc = Class.forName(xdriver);
        Database xdatabase = (Database) xc.newInstance();
        DatabaseManager.registerDatabase(xdatabase);
        Collection xcol = null;
        xcol = DatabaseManager.getCollection("xmldb:xindice:///db/edy");
        XPathQueryService xqueryService = (XPathQueryService) xcol.getService("XPathQueryService", "1.0");
        XUpdateQueryService xupdateService = (XUpdateQueryService) xcol.getService("XUpdateQueryService", "1.0");
        String xxpath = "";
        ResourceSet xresultSet = null;
        ResourceIterator xresults = null;
        String xdata = "";
        Resource xres = null;
//===========	
	if(request.getParameter("Submit")!=null && request.getParameter("Submit").equals("Login")){


		String namax = request.getParameter("username")!=null?request.getParameter("username"):"";
		String sandix = request.getParameter("sandi")!=null?request.getParameter("sandi"):"";
		xxpath = "//pemakai[nama='"+ namax +"'][sandi='" + sandix + "']";
		xresultSet = xqueryService.query(xxpath);
		xresults = xresultSet.getIterator();
		xres = null;

		if (xresults.hasMoreResources()) {
			xres = xresults.nextResource();
			xdata = ((String) xres.getContent());
			Document xdoc = XMLHelper.parseXMLFromString(xdata);
			Node xn = xdoc.getFirstChild();//.getFirstChild();//pasien
			NodeList xnl = xn.getChildNodes();
			String loginperan = xnl.item(3).getTextContent();		
			session.setAttribute("loginperan",loginperan);
		}
	}else if(request.getParameter("Submit")!=null && request.getParameter("Submit").equals("Logout")) {
		session.removeAttribute("loginperan");
	}
	String LOGIN_PERAN = session.getAttribute("loginperan")!=null?session.getAttribute("loginperan")+"":"";
%>
	<div id="env">
		<div id="main">
			<div id="mayor">
			  <div id="tabbed_content4"><div style="display: block;" class="tabc" id="tc1"><div class="tabc_bg">
			    <div class="tabc_bottom"><div class="tabc_top">
<div class="intabbg">
  <div class="intabbtm">
    <div class="intabtop mbottom"><!-- InstanceBeginEditable name="hak_akses_halaman" --><!-- InstanceEndEditable -->
      <% if(LOGIN_PERAN.equals(hak_akses_halaman) || hak_akses_halaman.equals("")){%><!-- InstanceBeginEditable name="data" -->
    <table width="100%" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="article_column" valign="top" width="100%"><table class="contentpaneopen">
              <tbody>
                <tr>
                  <td class="contentheading" width="100%"> MSCT-Scan 64 Slice </td>
                  </tr>
              </tbody>
          </table>
              <table class="contentpaneopen">
                <tbody>
                  <tr>
                    <td colspan="2" valign="top"><!--[if gte mso 9]><xml>  <w:WordDocument>   <w:View>Normal</w:View>   <w:Zoom>0</w:Zoom>   <w:TrackMoves/>   <w:TrackFormatting/>   <w:PunctuationKerning/>   <w:ValidateAgainstSchemas/>   <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>   <w:IgnoreMixedContent>false</w:IgnoreMixedContent>   <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>   <w:DoNotPromoteQF/>   <w:LidThemeOther>EN-US</w:LidThemeOther>   <w:LidThemeAsian>X-NONE</w:LidThemeAsian>   <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>   <w:Compatibility>    <w:BreakWrappedTables/>    <w:SnapToGridInCell/>    <w:WrapTextWithPunct/>    <w:UseAsianBreakRules/>    <w:DontGrowAutofit/>    <w:SplitPgBreakAndParaMark/>    <w:DontVertAlignCellWithSp/>    <w:DontBreakConstrainedForcedTables/>    <w:DontVertAlignInTxbx/>    <w:Word11KerningPairs/>    <w:CachedColBalance/>   </w:Compatibility>   <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>   <m:mathPr>    <m:mathFont m:val="Cambria Math"/>    <m:brkBin m:val="before"/>    <m:brkBinSub m:val="-->
                        <m:smallfrac m:val="off">
                          <m:dispdef>
                            <m:lmargin m:val="0">
                              <m:rmargin m:val="0">
                                <m:defjc m:val="centerGroup">
                                  <m:wrapindent m:val="1440">
                                    <m:intlim m:val="subSup">
                                      <m:narylim m:val="undOvr"> </m:narylim>
                                    </m:intlim>
                                  </m:wrapindent>
                                  <!--[endif]-->
                                  <!--[if gte mso 9]><xml>  <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"   DefSemiHidden="true" DefQFormat="false" DefPriority="99"   LatentStyleCount="267">   <w:LsdException Locked="false" Priority="0" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Normal"/>   <w:LsdException Locked="false" Priority="9" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>   <w:LsdException Locked="false" Priority="39" Name="toc 1"/>   <w:LsdException Locked="false" Priority="39" Name="toc 2"/>   <w:LsdException Locked="false" Priority="39" Name="toc 3"/>   <w:LsdException Locked="false" Priority="39" Name="toc 4"/>   <w:LsdException Locked="false" Priority="39" Name="toc 5"/>   <w:LsdException Locked="false" Priority="39" Name="toc 6"/>   <w:LsdException Locked="false" Priority="39" Name="toc 7"/>   <w:LsdException Locked="false" Priority="39" Name="toc 8"/>   <w:LsdException Locked="false" Priority="39" Name="toc 9"/>   <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>   <w:LsdException Locked="false" Priority="10" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Title"/>   <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>   <w:LsdException Locked="false" Priority="11" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>   <w:LsdException Locked="false" Priority="22" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Strong"/>   <w:LsdException Locked="false" Priority="20" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>   <w:LsdException Locked="false" Priority="59" SemiHidden="false"    UnhideWhenUsed="false" Name="Table Grid"/>   <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>   <w:LsdException Locked="false" Priority="1" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 1"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 1"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 1"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>   <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>   <w:LsdException Locked="false" Priority="34" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>   <w:LsdException Locked="false" Priority="29" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Quote"/>   <w:LsdException Locked="false" Priority="30" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 1"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 1"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 2"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 2"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 2"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 2"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 2"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 3"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 3"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 3"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 3"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 3"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 4"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 4"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 4"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 4"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 4"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 5"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 5"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 5"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 5"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 5"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 6"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 6"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 6"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 6"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 6"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>   <w:LsdException Locked="false" Priority="19" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>   <w:LsdException Locked="false" Priority="21" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>   <w:LsdException Locked="false" Priority="31" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>   <w:LsdException Locked="false" Priority="32" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>   <w:LsdException Locked="false" Priority="33" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>   <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>   <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>  </w:LatentStyles> </xml><![endif]-->
                                  <!--  /* Font Definitions */  @font-face 	{font-family:"Cambria Math"; 	panose-1:0 0 0 0 0 0 0 0 0 0; 	mso-font-charset:1; 	mso-generic-font-family:roman; 	mso-font-format:other; 	mso-font-pitch:variable; 	mso-font-signature:0 0 0 0 0 0;} @font-face 	{font-family:Calibri; 	panose-1:2 15 5 2 2 2 4 3 2 4; 	mso-font-charset:0; 	mso-generic-font-family:swiss; 	mso-font-pitch:variable; 	mso-font-signature:-1610611985 1073750139 0 0 159 0;}  /* Style Definitions */  p.MsoNormal, li.MsoNormal, div.MsoNormal 	{mso-style-unhide:no; 	mso-style-qformat:yes; 	mso-style-parent:""; 	margin-top:0in; 	margin-right:0in; 	margin-bottom:10.0pt; 	margin-left:0in; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} .MsoChpDefault 	{mso-style-type:export-only; 	mso-default-props:yes; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} .MsoPapDefault 	{mso-style-type:export-only; 	margin-bottom:10.0pt; 	line-height:115%;} @page Section1 	{size:8.5in 11.0in; 	margin:1.0in 1.0in 1.0in 1.0in; 	mso-header-margin:.5in; 	mso-footer-margin:.5in; 	mso-paper-source:0;} div.Section1 	{page:Section1;} -->
                                  <!--[if gte mso 10]> <style>  /* Style Definitions */  table.MsoNormalTable 	{mso-style-name:"Table Normal"; 	mso-tstyle-rowband-size:0; 	mso-tstyle-colband-size:0; 	mso-style-noshow:yes; 	mso-style-priority:99; 	mso-style-qformat:yes; 	mso-style-parent:""; 	mso-padding-alt:0in 5.4pt 0in 5.4pt; 	mso-para-margin-top:0in; 	mso-para-margin-right:0in; 	mso-para-margin-bottom:10.0pt; 	mso-para-margin-left:0in; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin;} </style> <![endif]-->
                                  <p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;" class="MsoNormal">MSCT-Scan 64 Slice adalah Multi Slice Computed Tomography Scanning 64 Slice generasi terbaru yang mampu menghasilkan gambar secara detil dari bagian tubuh manusia seperti kepala, leher, pembuluh darah<span>&nbsp; </span>(Jantung, otak &amp; pembuluh darah tepi), paru-paru, perut, usus besar, tulan</p>
                                  <div style="float: right; width: 231px;" class="img_caption right"><img src="css/kariadi/64@20slice.jpg" alt="d" width="257" height="254" border="0" align="right" class="caption" /></div>
                                  g.
                                  </p>
                                  <p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;" class="MsoNormal">MSCT-Scan 64 Slice mendeteksi secara dini penyakit jantung koroner, selain itu MSCT-Scan 64 Slice dapat menunjukkan lokasi tumor secara baik, serta dapat menentukan ukuran tumor dengan akurat. Hal ini dapat membantu dalam evaluasi pasien yang menjalani terapi atau operasi.</p>
                                  <p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;" class="MsoNormal">Keunggulan</p>
                                  <ol>
                                    <li>Dapat mendeteksi 3 penyebab nyeri dada akut secara bersamaan dengan menggunakan &quot;Triple Rule Out&quot;. Tiga kelainan tersebut yaitu penyakit jantung koroner, emboli paru dan dissecting aorta</li>
                                  </ol>
                                </m:defjc>
                              </m:rmargin>
                            </m:lmargin>
                          </m:dispdef>
                        </m:smallfrac></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="modifydate"> Pemutakhiran Terakhir ( Kamis, 05 Pebruari 2009 14:30 ) </td>
                  </tr>
                  <tr>
                    <td colspan="2"><a href="http://www.rskariadi.com/component/content/article/30-fasilitas/71-msct-scan-64-slice.html" class="readon"> Baca selengkapnya...</a> </td>
                  </tr>
                </tbody>
              </table>
            <span class="article_separator">&nbsp;</span>
              <table class="contentpaneopen">
                <tbody>
                  <tr>
                    <td class="contentheading" width="100%"> Bone Mineral Densitometry (BMD) </td>
                    </tr>
                </tbody>
              </table>
            <table class="contentpaneopen">
                <tbody>
                  <tr>
                    <td colspan="2" valign="top"><!--[if gte mso 9]><xml>  <w:WordDocument>   <w:View>Normal</w:View>   <w:Zoom>0</w:Zoom>   <w:TrackMoves/>   <w:TrackFormatting/>   <w:PunctuationKerning/>   <w:ValidateAgainstSchemas/>   <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>   <w:IgnoreMixedContent>false</w:IgnoreMixedContent>   <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>   <w:DoNotPromoteQF/>   <w:LidThemeOther>EN-US</w:LidThemeOther>   <w:LidThemeAsian>X-NONE</w:LidThemeAsian>   <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>   <w:Compatibility>    <w:BreakWrappedTables/>    <w:SnapToGridInCell/>    <w:WrapTextWithPunct/>    <w:UseAsianBreakRules/>    <w:DontGrowAutofit/>    <w:SplitPgBreakAndParaMark/>    <w:DontVertAlignCellWithSp/>    <w:DontBreakConstrainedForcedTables/>    <w:DontVertAlignInTxbx/>    <w:Word11KerningPairs/>    <w:CachedColBalance/>   </w:Compatibility>   <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>   <m:mathPr>    <m:mathFont m:val="Cambria Math"/>    <m:brkBin m:val="before"/>    <m:brkBinSub m:val="-->
                        <m:smallfrac m:val="off">
                          <m:dispdef>
                            <m:lmargin m:val="0">
                              <m:rmargin m:val="0">
                                <m:defjc m:val="centerGroup">
                                  <m:wrapindent m:val="1440">
                                    <m:intlim m:val="subSup">
                                      <m:narylim m:val="undOvr"> </m:narylim>
                                    </m:intlim>
                                  </m:wrapindent>
                                  <!--[endif]-->
                                  <!--[if gte mso 9]><xml>  <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"   DefSemiHidden="true" DefQFormat="false" DefPriority="99"   LatentStyleCount="267">   <w:LsdException Locked="false" Priority="0" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Normal"/>   <w:LsdException Locked="false" Priority="9" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>   <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>   <w:LsdException Locked="false" Priority="39" Name="toc 1"/>   <w:LsdException Locked="false" Priority="39" Name="toc 2"/>   <w:LsdException Locked="false" Priority="39" Name="toc 3"/>   <w:LsdException Locked="false" Priority="39" Name="toc 4"/>   <w:LsdException Locked="false" Priority="39" Name="toc 5"/>   <w:LsdException Locked="false" Priority="39" Name="toc 6"/>   <w:LsdException Locked="false" Priority="39" Name="toc 7"/>   <w:LsdException Locked="false" Priority="39" Name="toc 8"/>   <w:LsdException Locked="false" Priority="39" Name="toc 9"/>   <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>   <w:LsdException Locked="false" Priority="10" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Title"/>   <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>   <w:LsdException Locked="false" Priority="11" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>   <w:LsdException Locked="false" Priority="22" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Strong"/>   <w:LsdException Locked="false" Priority="20" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>   <w:LsdException Locked="false" Priority="59" SemiHidden="false"    UnhideWhenUsed="false" Name="Table Grid"/>   <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>   <w:LsdException Locked="false" Priority="1" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 1"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 1"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 1"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>   <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>   <w:LsdException Locked="false" Priority="34" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>   <w:LsdException Locked="false" Priority="29" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Quote"/>   <w:LsdException Locked="false" Priority="30" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 1"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 1"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 2"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 2"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 2"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 2"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 2"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 3"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 3"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 3"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 3"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 3"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 4"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 4"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 4"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 4"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 4"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 5"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 5"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 5"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 5"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 5"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>   <w:LsdException Locked="false" Priority="60" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Shading Accent 6"/>   <w:LsdException Locked="false" Priority="61" SemiHidden="false"    UnhideWhenUsed="false" Name="Light List Accent 6"/>   <w:LsdException Locked="false" Priority="62" SemiHidden="false"    UnhideWhenUsed="false" Name="Light Grid Accent 6"/>   <w:LsdException Locked="false" Priority="63" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>   <w:LsdException Locked="false" Priority="64" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>   <w:LsdException Locked="false" Priority="65" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>   <w:LsdException Locked="false" Priority="66" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>   <w:LsdException Locked="false" Priority="67" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>   <w:LsdException Locked="false" Priority="68" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>   <w:LsdException Locked="false" Priority="69" SemiHidden="false"    UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>   <w:LsdException Locked="false" Priority="70" SemiHidden="false"    UnhideWhenUsed="false" Name="Dark List Accent 6"/>   <w:LsdException Locked="false" Priority="71" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>   <w:LsdException Locked="false" Priority="72" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful List Accent 6"/>   <w:LsdException Locked="false" Priority="73" SemiHidden="false"    UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>   <w:LsdException Locked="false" Priority="19" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>   <w:LsdException Locked="false" Priority="21" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>   <w:LsdException Locked="false" Priority="31" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>   <w:LsdException Locked="false" Priority="32" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>   <w:LsdException Locked="false" Priority="33" SemiHidden="false"    UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>   <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>   <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>  </w:LatentStyles> </xml><![endif]-->
                                  <!--  /* Font Definitions */  @font-face 	{font-family:Wingdings; 	panose-1:5 0 0 0 0 0 0 0 0 0; 	mso-font-charset:2; 	mso-generic-font-family:auto; 	mso-font-pitch:variable; 	mso-font-signature:0 268435456 0 0 -2147483648 0;} @font-face 	{font-family:"Cambria Math"; 	panose-1:0 0 0 0 0 0 0 0 0 0; 	mso-font-charset:1; 	mso-generic-font-family:roman; 	mso-font-format:other; 	mso-font-pitch:variable; 	mso-font-signature:0 0 0 0 0 0;} @font-face 	{font-family:Calibri; 	panose-1:2 15 5 2 2 2 4 3 2 4; 	mso-font-charset:0; 	mso-generic-font-family:swiss; 	mso-font-pitch:variable; 	mso-font-signature:-1610611985 1073750139 0 0 159 0;}  /* Style Definitions */  p.MsoNormal, li.MsoNormal, div.MsoNormal 	{mso-style-unhide:no; 	mso-style-qformat:yes; 	mso-style-parent:""; 	margin-top:0in; 	margin-right:0in; 	margin-bottom:10.0pt; 	margin-left:0in; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph 	{mso-style-priority:34; 	mso-style-unhide:no; 	mso-style-qformat:yes; 	margin-top:0in; 	margin-right:0in; 	margin-bottom:10.0pt; 	margin-left:.5in; 	mso-add-space:auto; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParagraphCxSpFirst 	{mso-style-priority:34; 	mso-style-unhide:no; 	mso-style-qformat:yes; 	mso-style-type:export-only; 	margin-top:0in; 	margin-right:0in; 	margin-bottom:0in; 	margin-left:.5in; 	margin-bottom:.0001pt; 	mso-add-space:auto; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListParagraphCxSpMiddle 	{mso-style-priority:34; 	mso-style-unhide:no; 	mso-style-qformat:yes; 	mso-style-type:export-only; 	margin-top:0in; 	margin-right:0in; 	margin-bottom:0in; 	margin-left:.5in; 	margin-bottom:.0001pt; 	mso-add-space:auto; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagraphCxSpLast 	{mso-style-priority:34; 	mso-style-unhide:no; 	mso-style-qformat:yes; 	mso-style-type:export-only; 	margin-top:0in; 	margin-right:0in; 	margin-bottom:10.0pt; 	margin-left:.5in; 	mso-add-space:auto; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} .MsoChpDefault 	{mso-style-type:export-only; 	mso-default-props:yes; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} .MsoPapDefault 	{mso-style-type:export-only; 	margin-bottom:10.0pt; 	line-height:115%;} @page Section1 	{size:8.5in 11.0in; 	margin:1.0in 1.0in 1.0in 1.0in; 	mso-header-margin:.5in; 	mso-footer-margin:.5in; 	mso-paper-source:0;} div.Section1 	{page:Section1;}  /* List Definitions */  @list l0 	{mso-list-id:2142842418; 	mso-list-type:hybrid; 	mso-list-template-ids:-330420370 -9127958 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;} @list l0:level1 	{mso-level-start-at:0; 	mso-level-number-format:bullet; 	mso-level-text:-; 	mso-level-tab-stop:none; 	mso-level-number-position:left; 	text-indent:-.25in; 	font-family:"Calibri","sans-serif"; 	mso-fareast-font-family:Calibri; 	mso-fareast-theme-font:minor-latin; 	mso-bidi-font-family:"Times New Roman"; 	mso-bidi-theme-font:minor-bidi;} ol 	{margin-bottom:0in;} ul 	{margin-bottom:0in;} -->
                                  <!--[if gte mso 10]> <style>  /* Style Definitions */  table.MsoNormalTable 	{mso-style-name:"Table Normal"; 	mso-tstyle-rowband-size:0; 	mso-tstyle-colband-size:0; 	mso-style-noshow:yes; 	mso-style-priority:99; 	mso-style-qformat:yes; 	mso-style-parent:""; 	mso-padding-alt:0in 5.4pt 0in 5.4pt; 	mso-para-margin-top:0in; 	mso-para-margin-right:0in; 	mso-para-margin-bottom:10.0pt; 	mso-para-margin-left:0in; 	line-height:115%; 	mso-pagination:widow-orphan; 	font-size:11.0pt; 	font-family:"Calibri","sans-serif"; 	mso-ascii-font-family:Calibri; 	mso-ascii-theme-font:minor-latin; 	mso-hansi-font-family:Calibri; 	mso-hansi-theme-font:minor-latin;} </style> <![endif]-->
                                  <p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;" class="MsoNormal"><img src="css/kariadi/bmd.jpg" alt="d" width="400" height="299" border="0" align="right" />Bone densitometry disebut juga dual energy x-ray absorptiometry (DXA atau DEXA) adalah suatu pemeriksaan radiologi dengan menggunakan teknologi sinar X yang aman untuk mengukur densitas (kepadatan) tulang. Pemeriksaan ini dapat membantu mendiagnosa osteoporosis (kerapuhan tulang) dan menentukan terapi</p>
                                  <br />
                                  <p><font color="#0000ff"><strong>Informasi Lebih Lanjut :<br />
                                    Hubungi Bagian Radiologi RSUP Dr. Kariadi<br />
                                    Telp : 024-8413993, 8413476, 8413764<br />
                                    Ext&nbsp; : 4012, 4008</strong></font></p>
                                </m:defjc>
                              </m:rmargin>
                            </m:lmargin>
                          </m:dispdef>
                        </m:smallfrac></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="modifydate"> Pemutakhiran Terakhir ( Kamis, 05 Pebruari 2009 14:40 ) </td>
                  </tr>
                </tbody>
            </table>
            <span class="article_separator">&nbsp;</span>
              <table class="contentpaneopen">
                <tbody>
                  <tr>
                    <td class="contentheading" width="100%"> Sejarah Rumah Sakit </td>
                    </tr>
                </tbody>
              </table>
            <table class="contentpaneopen">
                <tbody>
                  <tr>
                    <td colspan="2" valign="top"><strong>Periode 1925 - 1945</strong><img src="css/kariadi/gambar-29.jpg" alt="d" width="330" height="240" border="0" align="right" />
                        <div align="justify">Pada periode 1919, Dr. N.F. Liem menggagas untuk mengganti dan menggabungkan Rumah Sakit Kota (<em>Stadverband Ziekenhuis</em>) dengan Rumah Sakit Kota Pembantu ( <em>Hulp Stadverband Ziekenhuis</em> ) di Semarang menjadi <em>Centrale Begrliijke Ziekenninricting</em> yang dikenal dengan nama CBZ. Tanggal 9 September, resmilah CBZ berdiri setelah memakan waktu 5 tahun pembangunan sejak tahun 1920 dengan kapasitas 500 tempat tidur dalam bangsal-bangsal besar yang dapat menampung 45 tempat tidur.<br />
                        </div>
                      <div align="justify"></div></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="modifydate"> Pemutakhiran Terakhir ( Senin, 02 Pebruari 2009 11:30 ) </td>
                  </tr>
                  <tr>
                    <td colspan="2"><a href="http://www.rskariadi.com/component/content/article/30-fasilitas/69-sejarah-rumah-sakit.html" class="readon"> Baca selengkapnya...</a> </td>
                  </tr>
                </tbody>
            </table>
            <span class="article_separator">&nbsp;</span> </td>
        </tr>
      </tbody>
    </table>
  <!-- InstanceEndEditable --><% } %></div></div></div>
</div>
</div>
			  </div>
	</div>	<div style="display: none;" class="tabc" id="tc2">
		
		<div class="tabc_bg">
		<div class="tabc_bottom">
		<div class="tabc_top">

<h2 class="prdhdr cross_alt">AVG Free limitations</h2><ul><li>Basic protection only (<a href="http://www.avg.com/product-avg-internet-security?fprd=ais.12m" target="_top">comprehensive protection is available with AVG Internet Security</a>)</li><li>Limited languages (<a href="http://www.avg.com/home-and-office-security" target="_top">multiple languages are available with any paid product</a>)</li><li>No technical support (<a href="http://www.avg.com/home-and-office-security" target="_top">available with any paid product</a>)</li><li>No server protection (<a href="http://www.avg.com/business-security" target="_top">available with Network Editions</a>)</li><li><b>Not for commercial use</b> (<a href="http://www.avg.com/home-and-office-security" target="_top">legal license available with any paid product</a>)</li></ul>
<h2 class="prdhdr lic">Licensing</h2><ul><li>AVG Anti-Virus Free Edition is for private, non-commercial, single computer use only. The use of AVG Free within any organization or for commercial purposes is strictly prohibited.</li><li>AVG Anti-Virus Free Edition is not for use with any type of OEM bundling with software, hardware components, or any other services.</li><li>Your use of AVG Anti-Virus Free Edition shall be in accordance with and is subject to the terms and conditions set forth in the AVG Anti-Virus Free Edition License Agreement that accompanies AVG Anti-Virus Free Edition.</li></ul>
<p><a class="btn btn_270 blk fright" href="http://free.avg.com/download?prd=afe">Continue to AVG Free download</a><a class="dwn" href="http://www.avg.com/product-avg-internet-security?fprd=ais.12m" target="_top">Continue to AVG Internet Security download</a></p><div class="clear"></div>
		</div>
		</div>
		</div>
	</div>	<div style="display: none;" class="tabc" id="tc3">
		
		<div class="tabc_bg">
		<div class="tabc_bottom">
		<div class="tabc_top">

<h2 class="prdhdr comp">Computer Hardware</h2><ul><li>Intel Pentium 300 MHz</li><li>30 MB free hard drive space (for installation)</li><li>256 MB RAM</li></ul>
<h2 class="prdhdr pzl mbottom">Operating Systems</h2><div class="intabbg"><div class="intabbtm"><div class="intabtop"><table class="intab">
<tbody><tr><th>Operational System</th><th>AVG Anti-Virus Free Edition 8.0</th><th>AVG Anti-Virus Network Edition 8.0</th></tr>
<tr class="dark"><td>MS Windows 98</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Windows Me</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>MS Windows NT</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Windows 2000</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows XP</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows XP Pro x64  Edition</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows Vista</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows Vista x64 Edition</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows NT Server 4.0</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Windows 2000 Server</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows 2003 Server</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows 2003 Server x64 Edition</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows 2008 Server</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows 2008 Server x64 Edition</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Linux i386</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>FreeBSD</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>Symbian</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="head"><th>Application</th><th>&nbsp;</th><th>&nbsp;</th></tr>

<tr class="dark"><td>MS SharePoint</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Exchange Server 5.x</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>MS Exchange Server 2000/2003</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Exchange Server 2007</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>Kerio MailServer 5/6 (MS Windows)</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>Kerio MailServer 5/6 (Linux i386)</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>Lotus Domino (MS Windows)</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>Lotus Domino (Linux i386)</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>PostFix</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>QMail</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>SendMail</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>Exim</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td></tr>
</tbody></table></div></div></div><h2>Important notice</h2><ul><li>AVG only runs on Windows 2000 SP4 + Update Rollup 1, Windows XP SP2, Windows XP Pro x64 Edition SP1 and Windows Vista/Vista x64 Edition or higher. </li></ul>
<h3>Need server protection?</h3>
<p>AVG Anti-Virus Free Edition does not have support for server operating systems (Windows NT Server, Windows 2000/2003 Server etc.). For server and network protection we recommend <a href="http://www.avg.com/business-security" target="_top">Business Security solutions</a>.</p>
<h2 class="prdhdr lng mbottom">Languages</h2><div class="intabbg"><div class="intabbtm"><div class="intabtop"><table class="intab">
<tbody><tr><th>Language:</th><th>AVG Anti-Virus Free Edition 8.0</th><th>AVG Internet Security 8.0</th></tr>
<tr class="dark"><td>Brasilian Portuguese</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Czech</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Danish</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Dutch</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>English</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>French</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>German</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Hungarian</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Italian</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Japanese</td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Polish</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Portuguese</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Serbian</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Slovak</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Spanish</td><td class="a_center"><img src="css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="css/avg/ico_yes.gif" alt="Yes"></td></tr>
</tbody></table></div></div></div>
<h3>Need more than English?</h3>
<p>For multiple language application we recommend <a href="http://www.avg.com/product-avg-internet-security?fprd=ais.12m" target="_top">AVG Internet Security</a>.</p>
		</div>
		</div>
		</div>
	</div>
</div>
		  </div>
		</div>
		<%

			
			if(request.getParameter("menu")!=null) session.setAttribute("menu",request.getParameter("menu"));
			if(request.getParameter("submenu")!=null) session.setAttribute("submenu",request.getParameter("submenu"));			
			
			String menu = session.getAttribute("menu")+"";
			String submenu=session.getAttribute("submenu")+"";

			if(menu.equals("1")) {
		%>
		<div id="nav2">
			<ul id="mnu2">
			<li <% 
				if( submenu.equals("1")) { %>class="active" <% } %> >
				<a href="index.jsp?menu=1&submenu=1"  
				<% if( submenu.equals("1")) { %>class="active" <% } %> >Selamat Datang</a></li>
				
				<li <% if( submenu.equals("2")) { %>class="active" <% } %> >
				<a href="pencarian_data.jsp?menu=1&submenu=2" 
				<% if( submenu.equals("2")) { %>class="active" <% } %>>Pencarian Data</a></li>
			</ul>
		</div>
		<%
			}
		%>
		
		<%
			if( menu.equals("2")) {
		%>
		<div id="nav2">
			<ul id="mnu2">
				<li <% if( submenu.equals("1")) { %>class="active" <% } %> >
				<a href="operator_pasien.jsp?menu=2&amp;submenu=1" 
				<% if( submenu.equals("1")) { %>class="active" <% } %>>Data Pasien</a></li>
			</ul>
		</div>
		<%
			}
		%>
		
		<%
			if( menu.equals("3")) {
		%>
		<div id="nav2">
			<ul id="mnu2">
				<li class="active"><a href="#" class="active">Pemeriksaan Pasien</a></li>
			</ul>
		</div>
		<%
			}
		%>
		
		<%
			if( menu.equals("4")) {
		%>
		<div id="nav2">
			<ul id="mnu2">
				<li class="active"><a href="#" class="active">Data Pemakai</a></li>
			</ul>
	  </div>
		<%
			}
		%>
		
<div id="nav1">
  <ul id="mnu1">
	<li <% if( menu.equals("4")) { %>class="last-active" <% } else { %> class="last" <% } %> ><a <% if( menu.equals("4")) { %>class="last-active" <% } else { %> class="last" <% } %>  href="admin.jsp?menu=4" >Admin</a></li>
	
	<li <% if( menu.equals("3")) { %>class="active" <% } else { %>  <% } %> ><a <% if( menu.equals("3")) { %>class="active" <% } else { %>  <% } %>  href="dokter.jsp?menu=3" >Dokter</a></li>
	
	<li <% if( menu.equals("2")) { %>class="active" <% } else { %> <% } %> ><a <% if( menu.equals("2")) { %>class="active" <% } else { %>  <% } %>  href="operator.jsp?menu=2&submenu=1" >Operator</a></li>
	
	<li <% if( menu.equals("1")) { %>class="first-active" <% } else { %> class="first" <% } %> ><a <% if( menu.equals("1")) { %>class="first-active" <% } else { %> class="first" <% } %>  href="index.jsp?menu=1" >Homepage</a></li>
</ul>
</div>
		<!--UdmComment-->
<div id="search" style="z-index:4">
  <div>
			<form  method="post">
				<%
					String loginperan = session.getAttribute("loginperan")!=null?session.getAttribute("loginperan")+"":"";
					if(loginperan.equals("")){
				%>Login
				<input name="username" type="text" class="srch" id="username" onfocus="this.value=''" size="6" />
				<input name="sandi" type="password" class="srch" id="sftxt" onfocus="this.value=''" size="6">
				<input name="Submit" value="Login" type="image" id="sfbtn" src="css/avg/btn_bg_search.gif" alt="Login">				
				<% } else { %>
				Logout>><input name="Submit" value="Logout" type="image" id="sfbtn" src="css/avg/btn_bg_search.gif" alt="Logout">				
				<% } %>
			</form>
	</div>
			<!--[if lte IE 6]><noscript><div id="lngselnojs"></noscript><![endif]-->
<div class="hpfx"><ul id="lngsel">
<li class="" id="lngactive">
  <ul id="lnglist">
<li><a onblur="hideLngsel()" href="http://free.avg.de/download-avg-anti-virus-free-edition" class="LngCountryDE" title="Deutschland (Deutsch)">Deutschland (Deutsch)</a></li>
	<li><a onblur="hideLngsel()" href="http://gratis.avg.it/antivirus-antispyware-gratis-protezione" class="LngCountryIT" title="Italia (Italiano)">Italia (Italiano)</a></li>
	<li><a onblur="hideLngsel()" href="http://free.avg.com/jp.download-avg-anti-virus-free-edition" class="LngCountryJP" title="日本 (日本語)">日本 (日本語)</a></li>
	<li><a onblur="hideLngsel()" href="http://free.avg.com/download-avg-anti-virus-free-edition" class="LngActive LngCountryWW" title="Worldwide (English)">Worldwide (English)</a></li>
</ul>
</li></ul>
</div>
<!--[if lte IE 6]><noscript></div></noscript><![endif]-->

  </div>		
		<div id="promo">
	  <div id="logo"><a class="logo motto" href="http://free.avg.com/"></a></div>
  </div>

	  <div id="foot">
			<div>
				<p>Hak Cipta Edy Winarno© 2008 Program Studi S2 Teknik Elektro <br />
		(Sistem Komputer dan Informatika) </p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
		</div>
		
	  </div>
		<!--/UdmComment-->
</div>
</body>
<!-- InstanceEnd --></html>
