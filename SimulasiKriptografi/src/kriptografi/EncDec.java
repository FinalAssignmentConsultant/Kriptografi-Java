/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package kriptografi;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

/**
 *
 * @author Eko SW
 */
public class EncDec {
    private static String METHOD;

    private static final byte[] salt = {
        (byte) 0xf5, (byte) 0x33, (byte) 0x01, (byte) 0x2a,
        (byte) 0xb2, (byte) 0xcc, (byte) 0xe4, (byte) 0x7f
    };
    private static int iterationCount = 100;
    private static Cipher cipher;
    private static byte[] outputArray;
    private static ByteArrayOutputStream cryptedText;
    private static ByteArrayInputStream decryptedText;
    private static String password = "eko";
    private static String originalText = "Rahasia Ilahi";
    private static Vector fileBytes = new Vector();
    private static String hasilEkripsi="";

    public static void main(String arg[]) {

            hasilEkripsi = enkripsi(originalText,password);
        
            System.out.println("Original = "+originalText);
            System.out.println("Password = "+password);
            System.out.println("Encrypted = "+cryptedText.toString());
            System.out.println("Decrypted = "+hasilEkripsi);


    }

    private static String enkripsi(String originalText, String password) {
        String dec = "";
        try {
            PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray());
            METHOD = "PBEWITHSHA-1AND128BITAES-CBC-BC"; //PBEWITHSHA256AND128BITAES-CBC-BC";//PBEWithMD5AndDES";
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(METHOD);
            SecretKey secretKey = keyFactory.generateSecret(keySpec);
            PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, iterationCount);
            cipher = Cipher.getInstance(METHOD);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, parameterSpec);
            outputArray = originalText.getBytes("ISO-8859-1");
            cryptedText = new ByteArrayOutputStream();
            CipherOutputStream out = new CipherOutputStream(cryptedText, cipher);
            out.write(outputArray);
            out.flush();
            out.close();
            System.out.println(originalText);
            System.out.println("dec=" + cryptedText.toString());

            //decrypt
            cipher = Cipher.getInstance(METHOD);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, parameterSpec);
            decryptedText = new ByteArrayInputStream(cryptedText.toByteArray());
            CipherInputStream in = new CipherInputStream(decryptedText, cipher);
            byte contents = (byte) in.read();
            
            char c = 82;
            while (contents != -1) {
                fileBytes.add(new Byte(contents));
                c = (char) Integer.parseInt(fileBytes.get(fileBytes.size() - 1)+"");
                dec = dec + c;
                contents = (byte) in.read();
            }
            in.close();
        } catch (IOException ex) {
            Logger.getLogger(EncDec.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(EncDec.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidAlgorithmParameterException ex) {
            Logger.getLogger(EncDec.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(EncDec.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(EncDec.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(EncDec.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dec;
    }
    
}
