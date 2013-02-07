/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import java.io.IOException;
import org.xml.sax.SAXException;

/**
 *
 * @author Eko SW
 */
class XMLHelperException extends Exception {

    XMLHelperException(String string, IOException ioe) {
        super(string,ioe);
    }

    XMLHelperException(String string, SAXException saxe) {
        super(string,saxe);

    }

}
