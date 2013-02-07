<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="test.base64.*,java.sql.*,org.xmldb.api.base.*,org.xmldb.api.modules.*,org.xmldb.api.*,javax.xml.parsers.*,org.w3c.dom.*,org.apache.xerces.parsers.*,util.*" errorPage="" %>
<%
//===========   Xindice
        String driver = "org.apache.xindice.client.xmldb.DatabaseImpl";
        Class c = Class.forName(driver);
        Database database = (Database) c.newInstance();
        DatabaseManager.registerDatabase(database);
        Collection col = null;
        col = DatabaseManager.getCollection("xmldb:xindice:///db/edy");
        XPathQueryService queryService = (XPathQueryService) col.getService("XPathQueryService", "1.0");
        XUpdateQueryService updateService = (XUpdateQueryService) col.getService("XUpdateQueryService", "1.0");
        String xpath = "";
        ResourceSet resultSet = null;
        ResourceIterator results = null;
        String data = "";
        Resource res = null;
        String id = "";
//===========

        boolean openForm = request.getParameter("openForm") == null ? false : request.getParameter("openForm").equals("true");
        String submit = request.getParameter("Submit") == null ? "" : request.getParameter("Submit");
        String mode = "";
        String xupdate = "";


        String oldKode = "", kode = "", nama = "", alamat = "";
        String nomoridentitas = "", tempatlahir = "", jeniskelamin = "", golongandarah = "",
                tinggi = "", berat = "", telepon = "", pekerjaan = "", alergiobat = "";

        //enc dec
        String tag = "";
        String content = "";

        String entitas = "";
        String backto = "";
        mode = request.getParameter("mode") == null ? "" : request.getParameter("mode");

        String formEncDec = request.getParameter("formEncDec") == null ? "" : request.getParameter("formEncDec");
        String password ="";
        if (formEncDec.equals("true")) {
            kode = request.getParameter("kode") != null ? request.getParameter("kode") : "";
            tag = request.getParameter("tag") != null ? request.getParameter("tag") : "";
            content = request.getParameter("content") != null ? request.getParameter("content") : "";
            xpath = request.getParameter("xpath") != null ? request.getParameter("xpath") : "";
            entitas = request.getParameter("entitas") != null ? request.getParameter("entitas") : "";
            password = request.getParameter("password") != null ? request.getParameter("password") : "";
            if (mode.equals("enc")) {
                
                String encryted = Logic.encrypt(content, password);
                String base64 = Base64Coder.encodeString(encryted);
                xupdate = Logic.buildUpdateTag(xpath, base64);
                updateService.update(xupdate); 
            } else {
                String base64 = Base64Coder.decodeString(content);
                String decrypted = Logic.decrypt(base64, password);
                xupdate = Logic.buildUpdateTag(xpath, decrypted);
                updateService.update(xupdate);  
            } 
            submit = "";
            }
            if (!submit.equals("")) {
                if (submit.equals("Batal")) {
                    openForm = false;
                } else if (submit.equals("Simpan")) {
                    oldKode = request.getParameter("oldKode") != null ? request.getParameter("oldKode") : "";
                    nama = request.getParameter("nama") != null ? request.getParameter("nama") : "";
                    nomoridentitas = request.getParameter("nomoridentitas") != null ? request.getParameter("nomoridentitas") : "";
                    jeniskelamin = request.getParameter("jeniskelamin") != null ? request.getParameter("jeniskelamin") : "";
                    tempatlahir = request.getParameter("tempatlahir") != null ? request.getParameter("tempatlahir") : "";
                    golongandarah = request.getParameter("golongandarah") != null ? request.getParameter("golongandarah") : "";
                    tinggi = request.getParameter("tinggi") != null ? request.getParameter("tinggi") : "";
                    berat = request.getParameter("berat") != null ? request.getParameter("berat") : "";
                    telepon = request.getParameter("telepon") != null ? request.getParameter("telepon") : "";
                    pekerjaan = request.getParameter("pekerjaan") != null ? request.getParameter("pekerjaan") : "";
                    alergiobat = request.getParameter("alergiobat") != null ? request.getParameter("alergiobat") : "";

                    alamat = request.getParameter("alamat") != null ? request.getParameter("alamat") : "";

                    if (mode.equals("tambah")) {
                        xupdate = Logic.buildInsertXUpdate(nama, nomoridentitas, tempatlahir,
                                jeniskelamin, golongandarah,
                                tinggi, berat, telepon, pekerjaan,
                                alergiobat, alamat);
                    } else if (mode.equals("ubah")) {
                        xupdate = Logic.buildUpdateXUpdate(oldKode, nama, nomoridentitas, tempatlahir,
                                jeniskelamin, golongandarah,
                                tinggi, berat, telepon, pekerjaan,
                                alergiobat, alamat);
                    }
                    updateService.update(xupdate);
                    openForm = false;
                }
            }

            if (mode.equals("hapus")) {
                kode = request.getParameter("kode") != null ? request.getParameter("kode") : "";
                xupdate = Logic.buildDeleteXUpdate("pasien","nomorinduk",kode);
                updateService.update(xupdate);
            } else if (mode.equals("ubah")) {
                kode = request.getParameter("kode") != null ? request.getParameter("kode") : "";
                xpath = "//pasien[nomorinduk='" + kode + "']";
                resultSet = queryService.query(xpath);
                results = resultSet.getIterator();
                res = null;

                if (results.hasMoreResources()) {
                    res = results.nextResource();
                    data = ((String) res.getContent());
                    Document doc = XMLHelper.parseXMLFromString(data);
                    Node n = doc.getFirstChild();//.getFirstChild();//pasien
                    NodeList nl = n.getChildNodes();
                    id = nl.item(0).getTextContent();
                    nama = nl.item(1).getTextContent();
                    nomoridentitas = nl.item(2).getTextContent();
                    tempatlahir = nl.item(3).getTextContent();
                    jeniskelamin = nl.item(4).getTextContent();
                    golongandarah = nl.item(5).getTextContent();
                    tinggi = nl.item(6).getTextContent();
                    berat = nl.item(7).getTextContent();
                    telepon = nl.item(8).getTextContent();
                    pekerjaan = nl.item(9).getTextContent();
                    alergiobat = nl.item(10).getTextContent();
                    alamat = nl.item(11).getTextContent();
                }
            }



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/index.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- InstanceBeginEditable name="doctitle" -->
        <title>Rumah Sakit Pusat Kota Semarang</title>
<!-- InstanceEndEditable -->
<link rel="stylesheet" type="text/css" href="css/avg/index.css" media="all">
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
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
    <div class="intabtop mbottom"><!-- InstanceBeginEditable name="hak_akses_halaman" --><%hak_akses_halaman="Operator";%><!-- InstanceEndEditable -->
      <% if(LOGIN_PERAN.equals(hak_akses_halaman) || hak_akses_halaman.equals("")){%><!-- InstanceBeginEditable name="data" -->
    <%
            if (submit.equals("encrypt") || submit.equals("decrypt")) {
                kode = request.getParameter("kode") != null ? request.getParameter("kode") : "";
                tag = request.getParameter("tag") != null ? request.getParameter("tag") : "";
                xpath = request.getParameter("xpath") != null ? request.getParameter("xpath") : "";
                backto = request.getParameter("backto") != null ? request.getParameter("backto") : "";
                resultSet = queryService.query(xpath);
                results = resultSet.getIterator();
                res = null;
                openForm = false;

                if (results.hasMoreResources()) {
                    res = results.nextResource();
                    data = ((String) res.getContent());
                    Document doc = XMLHelper.parseXMLFromString(data);
                    Node n = doc.getFirstChild();//.getFirstChild();//pasien
                    NodeList nl = n.getChildNodes();
                    content = nl.item(0).getTextContent();
                }
                                                    %>
                                                    <form id="frmEncDec" name="frmEncDec" method="post" action="">

                                                        <table width="60%" border="0" align="center">
                                                            <tr>
                                                                <td valign="top">Tag yang akan di enkrip </td>
                                                                <td valign="top">:</td>
                                                                <td valign="top"><%=tag%>
                                                                    <input name="tag" type="hidden" id="tag" value="<%=tag%>" />
                                                                    <input name="kode" type="hidden" id="kode" value="<%=kode%>" />
                                                                    <input name="xpath" type="hidden" id="xpath" value="<%=xpath%>" />
                                                                    <input name="backto" type="hidden" id="backto" value="<%=backto%>"/>
                                                                <input name="mode" type="hidden" id="mode" value="<%=mode%>" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top">Isi tag </td>
                                                                <td valign="top">:</td>
                                                                <td valign="top"><%=content%>
                                                                    <input name="content" type="hidden" id="content" value="<%=content%>" />
                                                                <input name="formEncDec" type="hidden" id="formEncDec" value="<%="true"%>" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top">Password </td>
                                                                <td valign="top">:</td>
                                                                <td valign="top"><label>
                                                                        <input name="password" type="text" id="password" />
                                                                </label></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top">&nbsp;</td>
                                                                <td valign="top">&nbsp;</td>
                                                                <td valign="top"><label>
                                                                        <input type="submit" name="Submit" value="Proses" />
                                                                </label></td>
                                                            </tr>
                                                        </table>
                                                    </form>
                                                    <%
        } else if (openForm) {
                                                    %>
                                                    <form action="" method="post">
                                                        <table width="81%" border="0" align="center">
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td><input name="Submit" type="submit" id="Submit" value="Simpan" />
                                                                <input name="Submit" type="submit" id="Submit" value="Batal" /></td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td width="32%">Nama</td>
                                                                <td width="7%">:</td>
                                                                <td width="61%"><label>
                                                                        <input name="nama" type="text" id="nama" value="<%=nama%>" />
                                                                        <input name="oldKode" type="hidden" id="oldKode" value="<%=id%>" />
                                                                        <input name="mode" type="hidden" id="mode" value="<%=request.getParameter("mode")%>" />
                                                                <a href="?Submit=encrypt&amp;tag=nama&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/nama&amp;back=rekmed.jsp">Encrpyt</a> <a href="?Submit=decrypt&amp;tag=nama&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/nama&amp;back=rekmed.jsp">Decrypt</a> </label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Nomor Identitas </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="nomoridentitas" type="text" id="nomoridentitas" value="<%=nomoridentitas%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=nomoridentitas&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/nomoridentitas&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=nomoridentitas&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/nomoridentitas&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Tempat Lahir </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="tempatlahir" type="text" id="tempatlahir" value="<%=tempatlahir%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=tempatlahir&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/tempatlahir&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=nomoridentitas&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/tempatlahir&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Jenis Kelamin </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <select name="jeniskelamin" id="jeniskelamin">
                                                                            <option value="Laki-Laki" <%=(("Laki-Laki".toString().equals(jeniskelamin)) ? "selected=\"selected\"" : "")%>>Laki-Laki</option>
                                                                            <option value="Perempuan" <%=(("Perempuan".toString().equals(jeniskelamin)) ? "selected=\"selected\"" : "")%>>Perempuan</option>
                                                                        </select>
                                                                </label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Golongan Darah </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <select name="golongandarah" id="golongandarah">
                                                                            <option value="A" <%=(("A".toString().equals(golongandarah)) ? "selected=\"selected\"" : "")%>>A</option>
                                                                            <option value="B" <%=(("B".toString().equals(golongandarah)) ? "selected=\"selected\"" : "")%>>B</option>
                                                                            <option value="AB" <%=(("AB".toString().equals(golongandarah)) ? "selected=\"selected\"" : "")%>>AB</option>
                                                                            <option value="O" <%=(("O".toString().equals(golongandarah)) ? "selected=\"selected\"" : "")%>>O</option>
                                                                        </select>
                                                                </label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Tinggi Badan </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="tinggi" type="text" id="tinggi" value="<%=tinggi%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=tinggi&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/tinggi&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=tinggi&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/tinggi&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Berat Badan </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="berat" type="text" id="berat" value="<%=berat%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=berat&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/berat&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=berat&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/berat&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Telepon</td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="telepon" type="text" id="telepon" value="<%=telepon%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=telepon&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/telepon&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=telepon&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/telepon&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Pekerjaan</td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="pekerjaan" type="text" id="pekerjaan" value="<%=pekerjaan%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=pekerjaan&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/pekerjaan&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=pekerjaan&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/pekerjaan&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Alergi Obat </td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="alergiobat" type="text" id="alergiobat" value="<%=alergiobat%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=alergiobat&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/alergiobat&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=alergiobat&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/alergiobat&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Alamat</td>
                                                                <td>:</td>
                                                                <td><label>
                                                                        <input name="alamat" type="text" id="alamat" value="<%=alamat%>" />
                                                                        <a href="?Submit=encrypt&amp;tag=alamat&amp;col=pasien&amp;kode=<%=id%>&amp;mode=enc&amp;xpath=//pasien[nomorinduk='<%=kode%>']/alamat&amp;back=rekmed.jsp">Encrpyt</a><a href="?Submit=decrypt&amp;tag=alamat&amp;col=pasien&amp;kode=<%=id%>&amp;mode=dec&amp;xpath=//pasien[nomorinduk='<%=kode%>']/alamat&amp;back=rekmed.jsp">Decrypt</a></label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td><label>
                                                                        <input type="submit" name="Submit" value="Simpan" />
                                                                        <input name="Submit" type="submit" id="Submit" value="Batal" />
                                                                </label></td>
                                                            </tr>
                                                        </table>
                                                    </form>
                                                    <% } else {%>
                                                    <a href="?openForm=true&amp;mode=tambah" target="_self" >Tambah Pasien</a>
                                                    <a href="xml/Pasien.jsp?full=true">View XML</a>
                                                    <table width="80%" border="0">
                                                        <tr>
                                                            <td width="8%">No</td>
                                                            <td width="38%">Nama</td>
                                                            <td width="31%">Alamat</td>
                                                            <td width="23%"><div align="center">Aksi</div></td>
                                                        </tr>
                                                        <%
            xpath = "//pasien";
            resultSet = queryService.query(xpath);
            try {
                results = resultSet.getIterator();
                int i = 1;



                while (results.hasMoreResources()) {
                    res = results.nextResource();
                    data = ((String) res.getContent());
                    String s2 = "";
                    String ss = "";
                    id = "";
                    Document doc = XMLHelper.parseXMLFromString(data);
                    Node n = doc.getFirstChild();//.getFirstChild();//pasien
                    NodeList nl = n.getChildNodes();

                    id = nl.item(0).getTextContent();
                    ss = nl.item(1).getTextContent();
                    s2 = nl.item(11).getTextContent();

                                                        %>
                                                        <tr>
                                                            <td><%=i%></td>
                                                            <td><%=ss%></td>
                                                            <td><%=s2%></td>
                                                            <td><div align="center"><a href="?mode=ubah&amp;kode=<%=id%>&amp;openForm=true">Ubah</a> <a href="?mode=hapus&amp;kode=<%=id%>">Hapus</a> </div></td>
                                                        </tr>
                                                        <%

                    //                out.print((String) );
                    i++;
                }
            //			out.print("</daftar_pasien>");
            } catch (XMLDBException e) {
                System.err.println("XML:DB Exception occured " + e.errorCode + "," + e.getMessage());
            } finally {
                if (col != null) {
                    col.close();
                }
            }
                                                        %>
                                                    </table>
                                                    <%
        }
                                                    %>
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
