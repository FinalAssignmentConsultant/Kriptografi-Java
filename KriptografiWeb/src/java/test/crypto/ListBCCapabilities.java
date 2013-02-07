/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package test.crypto;

import java.security.Provider;
import java.security.Security;
import java.util.Iterator;

/**
 *
 * @author Eko SW
 */
public class ListBCCapabilities
{
   public static void main(
        String[]    args)
    {
        Provider      provider = Security.getProvider("BC");

        Iterator it = provider.keySet().iterator();

        while (it.hasNext())
        {
            String    entry = (String)it.next();

            // this indicates the entry actually refers to another entry

            if (entry.startsWith("Alg.Alias."))
            {
                entry = entry.substring("Alg.Alias.".length());
            }

            String factoryClass = entry.substring(0, entry.indexOf('.'));
            String name = entry.substring(factoryClass.length() + 1);

            System.out.println(factoryClass + ": " + name);
        }
    }
}
