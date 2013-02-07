/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.xindiced;

import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;

/**
 *
 * @author Eko SW
 */
public class TestQuery {

    public static void main(String[] args) throws Exception {
        Collection col = null;
        try {
            String driver = "org.apache.xindice.client.xmldb.DatabaseImpl";
            Class c = Class.forName(driver);
            Database database = (Database) c.newInstance();
            DatabaseManager.registerDatabase(database);
            col = DatabaseManager.getCollection("xmldb:xindice:///db/edy");
            String xpath = "//pasien";
            XPathQueryService service = (XPathQueryService) col.getService("XPathQueryService", "1.0");
            ResourceSet resultSet = service.query(xpath);
            ResourceIterator results = resultSet.getIterator();
            int i = 1;
            while (results.hasMoreResources()) {
                Resource res = results.nextResource();
                System.out.println(i + ":" + (String) res.getContent());
                i++;
            }
        } catch (XMLDBException e) {
            System.err.println("XML:DB Exception occured " + e.errorCode + "," + e.getMessage());
        } finally {
            if (col != null) {
                col.close();
            }
        }

    }
}

