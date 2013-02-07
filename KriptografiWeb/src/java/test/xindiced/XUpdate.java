/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.xindiced;

import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;

/**
 * Simple XML:DB API example to update the database.
 */
public class XUpdate {

    public static void main(String[] args) throws Exception {
        Collection col = null;
        try {
            String driver = "org.apache.xindice.client.xmldb.DatabaseImpl";
            Class c = Class.forName(driver);

            Database database = (Database) c.newInstance();
            DatabaseManager.registerDatabase(database);
            col = DatabaseManager.getCollection("xmldb:xindice:///db/edy"/*"xmldb:xindice:///db/addressbook"*/);

            String xupdate = 
                    "<xupdate:modifications version=\"1.0\" " +
                    "xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                        "<xupdate:append select=\"/daftar_pasien\" >" +
                            "<xupdate:element name=\"pasien\">" +
                                "<xupdate:attribute name=\"pasien_id\">101</xupdate:attribute>" +
                                "<nama>Eko SW</nama>" +
                                "<alamat>Karanggayam</alamat>" +
                            "</xupdate:element>" +
                        "</xupdate:append>" +
                    "</xupdate:modifications>";

           
            XUpdateQueryService service =
                    (XUpdateQueryService) col.getService("XUpdateQueryService", "1.0");
            service.update(xupdate);
        } catch (XMLDBException e) {
            System.err.println("XML:DB Exception occured " + e.errorCode + " " +
                    e.getMessage());
        } finally {
            if (col != null) {
                col.close();
            }
        }
    }
}
