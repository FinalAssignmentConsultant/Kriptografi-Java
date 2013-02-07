<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="test.base64.*,java.sql.*,org.xmldb.api.base.*,org.xmldb.api.modules.*,org.xmldb.api.*,javax.xml.parsers.*,org.w3c.dom.*,org.apache.xerces.parsers.*,util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- TemplateBeginEditable name="doctitle" -->
<title>Rumah Sakit Pusat Kota Semarang</title>
<!-- TemplateEndEditable -->
<link rel="stylesheet" type="text/css" href="../css/avg/index.css" media="all">
<!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->
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
    <div class="intabtop mbottom"><!-- TemplateBeginEditable name="hak_akses_halaman" -->hak_akses<!-- TemplateEndEditable -->
      <% if(LOGIN_PERAN.equals(hak_akses_halaman) || hak_akses_halaman.equals("")){%><!-- TemplateBeginEditable name="data" -->Editable<!-- TemplateEndEditable --><% } %></div></div></div>
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
<tr class="dark"><td>MS Windows 98</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Windows Me</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>MS Windows NT</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Windows 2000</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows XP</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows XP Pro x64  Edition</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows Vista</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows Vista x64 Edition</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows NT Server 4.0</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Windows 2000 Server</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows 2003 Server</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows 2003 Server x64 Edition</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>MS Windows 2008 Server</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Windows 2008 Server x64 Edition</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Linux i386</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>FreeBSD</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>Symbian</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="head"><th>Application</th><th>&nbsp;</th><th>&nbsp;</th></tr>

<tr class="dark"><td>MS SharePoint</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>MS Exchange Server 5.x</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>MS Exchange Server 2000/2003</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>MS Exchange Server 2007</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>Kerio MailServer 5/6 (MS Windows)</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>Kerio MailServer 5/6 (Linux i386)</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>Lotus Domino (MS Windows)</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>Lotus Domino (Linux i386)</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>PostFix</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>QMail</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr class="dark"><td>SendMail</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>

<tr><td>Exim</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td></tr>
</tbody></table></div></div></div><h2>Important notice</h2><ul><li>AVG only runs on Windows 2000 SP4 + Update Rollup 1, Windows XP SP2, Windows XP Pro x64 Edition SP1 and Windows Vista/Vista x64 Edition or higher. </li></ul>
<h3>Need server protection?</h3>
<p>AVG Anti-Virus Free Edition does not have support for server operating systems (Windows NT Server, Windows 2000/2003 Server etc.). For server and network protection we recommend <a href="http://www.avg.com/business-security" target="_top">Business Security solutions</a>.</p>
<h2 class="prdhdr lng mbottom">Languages</h2><div class="intabbg"><div class="intabbtm"><div class="intabtop"><table class="intab">
<tbody><tr><th>Language:</th><th>AVG Anti-Virus Free Edition 8.0</th><th>AVG Internet Security 8.0</th></tr>
<tr class="dark"><td>Brasilian Portuguese</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Czech</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Danish</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Dutch</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>English</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>French</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>German</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Hungarian</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Italian</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Japanese</td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Polish</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Portuguese</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Serbian</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr><td>Slovak</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>

<tr class="dark"><td>Spanish</td><td class="a_center"><img src="../css/avg/ico_no.gif" alt="No"></td><td class="a_center"><img src="../css/avg/ico_yes.gif" alt="Yes"></td></tr>
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
				<a href="../index.jsp?menu=1&submenu=1"  
				<% if( submenu.equals("1")) { %>class="active" <% } %> >Selamat Datang</a></li>
				
				<li <% if( submenu.equals("2")) { %>class="active" <% } %> >
				<a href="../pencarian_data.jsp?menu=1&submenu=2" 
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
				<a href="../operator_pasien.jsp?menu=2&amp;submenu=1" 
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
	<li <% if( menu.equals("4")) { %>class="last-active" <% } else { %> class="last" <% } %> ><a <% if( menu.equals("4")) { %>class="last-active" <% } else { %> class="last" <% } %>  href="../admin.jsp?menu=4" >Admin</a></li>
	
	<li <% if( menu.equals("3")) { %>class="active" <% } else { %>  <% } %> ><a <% if( menu.equals("3")) { %>class="active" <% } else { %>  <% } %>  href="../dokter.jsp?menu=3" >Dokter</a></li>
	
	<li <% if( menu.equals("2")) { %>class="active" <% } else { %> <% } %> ><a <% if( menu.equals("2")) { %>class="active" <% } else { %>  <% } %>  href="../operator.jsp?menu=2&submenu=1" >Operator</a></li>
	
	<li <% if( menu.equals("1")) { %>class="first-active" <% } else { %> class="first" <% } %> ><a <% if( menu.equals("1")) { %>class="first-active" <% } else { %> class="first" <% } %>  href="../index.jsp?menu=1" >Homepage</a></li>
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
				<input name="Submit" value="Login" type="image" id="sfbtn" src="../css/avg/btn_bg_search.gif" alt="Login">				
				<% } else { %>
				Logout>><input name="Submit" value="Logout" type="image" id="sfbtn" src="../css/avg/btn_bg_search.gif" alt="Logout">				
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
</html>
