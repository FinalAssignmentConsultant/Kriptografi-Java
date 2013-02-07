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
        xpath = "//pemakai";
        resultSet = queryService.query(xpath);
        results = resultSet.getIterator();
        res = null;
        
        while (results.hasMoreResources()) {
            res = results.nextResource();
            data = ((String) res.getContent());
            out.print(data);

        }
%>
</daftar_pasien>