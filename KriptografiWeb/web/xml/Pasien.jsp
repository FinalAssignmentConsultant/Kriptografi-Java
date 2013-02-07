<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.xmldb.api.base.*,org.xmldb.api.modules.*,org.xmldb.api.*,javax.xml.parsers.*,org.w3c.dom.*,org.apache.xerces.parsers.*,util.*" errorPage="" %>
<?xml version="1.0" encoding="UTF-8" ?>
<daftar_pasien>
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
        xpath = "//pasien";
        resultSet = queryService.query(xpath);
        results = resultSet.getIterator();
        res = null;
        String kode = "", nama = "", alamat = "";
        String nomoridentitas = "", tempatlahir = "", jeniskelamin = "", golongandarah = "",
                tinggi = "", berat = "", telepon = "", pekerjaan = "", alergiobat = "";
        
        while (results.hasMoreResources()) {
            res = results.nextResource();
            data = ((String) res.getContent());
            out.print(data);
            String s2 = "";
            String ss = "";
            id = "";
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
%>
</daftar_pasien>