/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package kriptografi;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
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
public class Logic {

    //enkripsi
    private static String METHOD = "PBEWithMD5AndDES";
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
    private static String hasilEkripsi = "";
    private static String encoding = "ISO-8859-1";//

    //enkripsi
    public static String buildInsertXUpdate(String nama,
            String nomoridentitas, String tempatlahir,
            String jeniskelamin, String golongandarah,
            String tinggi, String berat,
            String telepon, String pekerjaan,
            String alergiobat,
            String alamat) {
        //return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\"><xupdate:append select=\"/daftar_pasien\"><xupdate:element name=\"pasien\"><xupdate:attribute name=\"pasien_id\">"+kode+"</xupdate:attribute><kode>"+kode+"</kode><nama>"+nama+"</nama><alamat>"+alamat+"</alamat></xupdate:element></xupdate:append></xupdate:modifications>";
        return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:append select=\"/daftar_pasien\">" +
                "<xupdate:element name=\"pasien\">" +
                "<nomorinduk>" + getUniqueId() + "</nomorinduk>" +
                "<nama>" + nama + "</nama>" +
                "<nomoridentitas>" + nomoridentitas + "</nomoridentitas>" +
                "<tempatlahir>" + tempatlahir + "</tempatlahir>" +
                "<jeniskelamin>" + jeniskelamin + "</jeniskelamin>" +
                "<golongandarah>" + golongandarah + "</golongandarah>" +
                "<tinggi>" + tinggi + "</tinggi>" +
                "<berat>" + berat + "</berat>" +
                "<telepon>" + telepon + "</telepon>" +
                "<pekerjaan>" + pekerjaan + "</pekerjaan>" +
                "<alergiobat>" + alergiobat + "</alergiobat>" +
                "<alamat>" + alamat + "</alamat>" +
                "<riwayatpemeriksaan/>" +
                "</xupdate:element>" +
                "</xupdate:append>" +
                "</xupdate:modifications>";
    }

    public static String buildDeleteXUpdate(String entitas, String key, String id) {
        return "<xu:modifications version=\"1.0\" xmlns:xu=\"http://www.xmldb.org/xupdate\">" +
                "<xu:remove select=\"//" + entitas + "[" + key + "='" + id + "']\"/>" +
                "</xu:modifications>";
    }

    public static String buildUpdateXUpdate(String kode, String nama,
            String nomoridentitas, String tempatlahir,
            String jeniskelamin, String golongandarah,
            String tinggi, String berat,
            String telepon, String pekerjaan,
            String alergiobat,
            String alamat) {
        //return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\"><xupdate:append select=\"/daftar_pasien\"><xupdate:element name=\"pasien\"><xupdate:attribute name=\"pasien_id\">"+kode+"</xupdate:attribute><kode>"+kode+"</kode><nama>"+nama+"</nama><alamat>"+alamat+"</alamat></xupdate:element></xupdate:append></xupdate:modifications>";
        return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/nama\">" + nama + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/nomoridentitas\">" + nomoridentitas + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/tempatlahir\">" + tempatlahir + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/jeniskelamin\">" + jeniskelamin + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/golongandarah\">" + golongandarah + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/tinggi\">" + tinggi + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/berat\">" + berat + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/telepon\">" + telepon + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/pekerjaan\">" + pekerjaan + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/alergiobat\">" + alergiobat + "</xupdate:update>" +
                "<xupdate:update select=\"//pasien[nomorinduk=" + kode + "]/alamat\">" + alamat + "</xupdate:update>" +
                "</xupdate:modifications>";
    }
    private static String digits = "0123456789abcdef";

    /**
     * Return length many bytes of the passed in byte array as a hex string.
     *
     * @param data the bytes to be converted.
     * @param length the number of bytes in the data block to be converted.
     * @return a hex representation of length bytes of data.
     */
    public static String toHex(byte[] data, int length) {
        StringBuffer buf = new StringBuffer();

        for (int i = 0; i != length; i++) {
            int v = data[i] & 0xff;

            buf.append(digits.charAt(v >> 4));
            buf.append(digits.charAt(v & 0xf));
        }

        return buf.toString();
    }

    /**
     * Return the passed in byte array as a hex string.
     *
     * @param data the bytes to be converted.
     * @return a hex representation of data.
     */
    public static String toHex(byte[] data) {
        return toHex(data, data.length);
    }

    public static String encrypt(String originalText, String password) {
        String enc = "";
        try {
            // cara penggunaan JCE u/ melakukan enkripsi berdasarkan metode enkripsi PBE, yg dipilih (tidak 
            // mesti PBEWithMD5AndDES
            PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray());
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(METHOD);
            SecretKey secretKey = keyFactory.generateSecret(keySpec);
            PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, iterationCount);
            cipher = Cipher.getInstance(METHOD);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, parameterSpec);
            outputArray = originalText.getBytes(encoding);
            cryptedText = new ByteArrayOutputStream();
            CipherOutputStream out = new CipherOutputStream(cryptedText, cipher);
            out.write(outputArray);
            out.flush();
            out.close();
            return cryptedText.toString();

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
        return "error";
    }

    public static String decrypt(String cryptedText, String password) {
        String dec = "";
        try {
            // convert to byte array

            PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray());
            //METHOD = "PBEWITHSHA-1AND128BITAES-CBC-BC"; //PBEWITHSHA256AND128BITAES-CBC-BC";//PBEWithMD5AndDES";
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(METHOD);
            SecretKey secretKey = keyFactory.generateSecret(keySpec);
            PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, iterationCount);
            cipher = Cipher.getInstance(METHOD);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, parameterSpec);
            decryptedText = new ByteArrayInputStream(cryptedText.getBytes());
            CipherInputStream in = new CipherInputStream(decryptedText, cipher);
            byte contents = (byte) in.read();
            char c = 82;
            while (contents != -1) {
                fileBytes.add(new Byte(contents));
                c = (char) Integer.parseInt(fileBytes.get(fileBytes.size() - 1) + "");
                dec = dec + c;
                contents = (byte) in.read();
            }
            in.close();
        } catch (IOException ex) {
            Logger.getLogger(Logic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(Logic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidAlgorithmParameterException ex) {
            Logger.getLogger(Logic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(Logic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Logic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(Logic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dec;
    }

    public static void main(String arg[]) {
        String enc = encrypt("Eko SW", "eko");
        String dec = decrypt(enc, "eko");
        System.out.println("enc=" + enc);
        System.out.println("dec=" + dec);
        String enc64 = toBase64String(enc.getBytes());
        System.out.println("enc64=" + enc64);
        System.out.println("dec64=" + fromBase64String(enc64));
        String x = base64Encode(enc);
        System.out.println("encode=" + x);
        byte[] y = fromBase64String(x);
        System.out.println(y.toString());

        originalText = "Eko SW";
        String s1 = Base64Coder.encodeString(enc);
        String s2 = Base64Coder.decodeString(s1);
        System.out.println(enc + "," + s1 + "," + s2);
        String k = Base64Coder.decodeString("yUfOSMUbZ58=");
        String l = decrypt(k, "eko");
        System.out.println("xx=" + l);

    }

    public static String buildUpdateTag(String xpath, String encryted) {
        return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:update select=\"" + xpath + "\">" + encryted + "</xupdate:update>" +
                "</xupdate:modifications>";
    }
    /**
     * The BASE64 encoding standard's 6-bit alphabet, from RFC 1521,
     * plus the padding character at the end.
     */
    private static final char[] Base64Chars = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
        'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
        'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
        'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
        'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
        'w', 'x', 'y', 'z', '0', '1', '2', '3',
        '4', '5', '6', '7', '8', '9', '+', '/',
        '='
    };
    /**
     * Encoding alphabet for session keys. Contains only chars that
     * are safe to use in cookies, URLs and file names. Same as BASE64
     * except the last two chars and the padding char
     */
    private static final char[] SessionKeyChars = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
        'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
        'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
        'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
        'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
        'w', 'x', 'y', 'z', '0', '1', '2', '3',
        '4', '5', '6', '7', '8', '9', '_', '-',
        '.'
    };

    /**
     * Performs RFC1521 style Base64 encoding of arbitrary binary data.
     * The output is a java String containing the Base64 characters
     * representing the binary data.  Be aware that this string is in
     * Unicode form, and should be converted to UTF8 with the usual java
     * conversion routines before it is sent over a network.  The output
     * string is guaranteed to only contain characters that are a single
     * byte in UTF8 format.  Also be aware that this routine leaves it to
     * the caller to break the string into 70 byte lines as per RFC1521.
     *
     * @param bytes The array of bytes to convert to Base64 encoding.
     * @return	    An string containing the specified bytes in Base64
     * 		    encoded form.
     */
    public static final String toBase64String(byte[] bytes) {
        return toBase64String(bytes, Base64Chars);
    }

    /**
     * The encoding is more or less Base 64, but instead of '+'
     * and '/' as defined in RFC1521, the characters '_' and
     * '-' are used because they are safe in URLs and file names.
     *
     * @param bytes The array of bytes to convert to Base64SessionKey
     *              encoding.
     * @return	    An string containing the specified bytes in Base64
     * 		    encoded form.
     */
    public static final String toBase64SessionKeyString(byte[] bytes) {
        return toBase64String(bytes, SessionKeyChars);
    }

    /**
     * Performs encoding of arbitrary binary data based on a 6 bit
     * alphabet.  The output is a java String containing the encoded
     * characters representing the binary data.  Be aware that this
     * string is in Unicode form, and should be converted to UTF8 with
     * the usual java conversion routines before it is sent over a
     * network. The alphabet passed in via <code>chars</code> is used
     * without further checks, it's the callers responsibility to set
     * it to something meaningful.
     *
     * @param bytes The array of bytes to convert to Base64 encoding.
     * @param chars The alphabet used in encoding. Must contain
     *              exactly 65 characters: A 6 bit alphabet plus one
     *              padding char at position 65.
     * @return	    An string containing the specified bytes in Base64
     * 		    encoded form.
     */
    private static final String toBase64String(byte[] bytes, char[] chars) {
        StringBuffer sb = new StringBuffer();
        int len = bytes.length, i = 0, ival;
        while (len >= 3) {
            ival = ((int) bytes[i++] + 256) & 0xff;
            ival <<= 8;
            ival += ((int) bytes[i++] + 256) & 0xff;
            ival <<= 8;
            ival += ((int) bytes[i++] + 256) & 0xff;
            len -= 3;
            sb.append(chars[(ival >> 18) & 63]);
            sb.append(chars[(ival >> 12) & 63]);
            sb.append(chars[(ival >> 6) & 63]);
            sb.append(chars[ival & 63]);
        }
        switch (len) {
            case 0:	// No pads needed.
                break;
            case 1: // Two more output bytes and two pads.
                ival = ((int) bytes[i++] + 256) & 0xff;
                ival <<= 16;
                sb.append(chars[(ival >> 18) & 63]);
                sb.append(chars[(ival >> 12) & 63]);
                sb.append(chars[64]);
                sb.append(chars[64]);
                break;
            case 2:	// Three more output bytes and one pad.
                ival = ((int) bytes[i++] + 256) & 0xff;
                ival <<= 8;
                ival += ((int) bytes[i] + 256) & 0xff;
                ival <<= 8;
                sb.append(chars[(ival >> 18) & 63]);
                sb.append(chars[(ival >> 12) & 63]);
                sb.append(chars[(ival >> 6) & 63]);
                sb.append(chars[64]);
                break;
        }
        return new String(sb);
    }

    /**
     * Performs RFC1521 style Base64 decoding of Base64 encoded data.
     * The output is a byte array containing the decoded binary data.
     * The input is expected to be a normal Unicode String object.
     *
     * @param s The Base64 encoded string to decode into binary data.
     * @return An array of bytes containing the decoded data.
     */
    public static final byte[] fromBase64String(String s) {
        try {
            StringCharacterIterator iter = new StringCharacterIterator(s);
            ByteArrayOutputStream bytestr = new ByteArrayOutputStream();
            DataOutputStream outstr = new DataOutputStream(bytestr);
            char c;
            int d, i, group;
            int[] bgroup = new int[4];
            decode:
            for (i = 0, group = 0, c = iter.first();
                    c != CharacterIterator.DONE;
                    c = iter.next()) {
                switch (c) {
                    case 'A':
                        d = 0;
                        break;
                    case 'B':
                        d = 1;
                        break;
                    case 'C':
                        d = 2;
                        break;
                    case 'D':
                        d = 3;
                        break;
                    case 'E':
                        d = 4;
                        break;
                    case 'F':
                        d = 5;
                        break;
                    case 'G':
                        d = 6;
                        break;
                    case 'H':
                        d = 7;
                        break;
                    case 'I':
                        d = 8;
                        break;
                    case 'J':
                        d = 9;
                        break;
                    case 'K':
                        d = 10;
                        break;
                    case 'L':
                        d = 11;
                        break;
                    case 'M':
                        d = 12;
                        break;
                    case 'N':
                        d = 13;
                        break;
                    case 'O':
                        d = 14;
                        break;
                    case 'P':
                        d = 15;
                        break;
                    case 'Q':
                        d = 16;
                        break;
                    case 'R':
                        d = 17;
                        break;
                    case 'S':
                        d = 18;
                        break;
                    case 'T':
                        d = 19;
                        break;
                    case 'U':
                        d = 20;
                        break;
                    case 'V':
                        d = 21;
                        break;
                    case 'W':
                        d = 22;
                        break;
                    case 'X':
                        d = 23;
                        break;
                    case 'Y':
                        d = 24;
                        break;
                    case 'Z':
                        d = 25;
                        break;
                    case 'a':
                        d = 26;
                        break;
                    case 'b':
                        d = 27;
                        break;
                    case 'c':
                        d = 28;
                        break;
                    case 'd':
                        d = 29;
                        break;
                    case 'e':
                        d = 30;
                        break;
                    case 'f':
                        d = 31;
                        break;
                    case 'g':
                        d = 32;
                        break;
                    case 'h':
                        d = 33;
                        break;
                    case 'i':
                        d = 34;
                        break;
                    case 'j':
                        d = 35;
                        break;
                    case 'k':
                        d = 36;
                        break;
                    case 'l':
                        d = 37;
                        break;
                    case 'm':
                        d = 38;
                        break;
                    case 'n':
                        d = 39;
                        break;
                    case 'o':
                        d = 40;
                        break;
                    case 'p':
                        d = 41;
                        break;
                    case 'q':
                        d = 42;
                        break;
                    case 'r':
                        d = 43;
                        break;
                    case 's':
                        d = 44;
                        break;
                    case 't':
                        d = 45;
                        break;
                    case 'u':
                        d = 46;
                        break;
                    case 'v':
                        d = 47;
                        break;
                    case 'w':
                        d = 48;
                        break;
                    case 'x':
                        d = 49;
                        break;
                    case 'y':
                        d = 50;
                        break;
                    case 'z':
                        d = 51;
                        break;
                    case '0':
                        d = 52;
                        break;
                    case '1':
                        d = 53;
                        break;
                    case '2':
                        d = 54;
                        break;
                    case '3':
                        d = 55;
                        break;
                    case '4':
                        d = 56;
                        break;
                    case '5':
                        d = 57;
                        break;
                    case '6':
                        d = 58;
                        break;
                    case '7':
                        d = 59;
                        break;
                    case '8':
                        d = 60;
                        break;
                    case '9':
                        d = 61;
                        break;
                    case '+':
                        d = 62;
                        break;
                    case '/':
                        d = 63;
                        break;
                    case '_':
                        d = 62;
                        break;
                    case '-':
                        d = 63;
                        break;
                    default:
                        // Any character not in Base64 alphabet is treated
                        // as end of data.  This includes the '=' (pad) char.
                        break decode;   // Skip illegal characters.
                }
                bgroup[i++] = d;
                if (i >= 4) {
                    i = 0;
                    group = ((bgroup[0] & 63) << 18) + ((bgroup[1] & 63) << 12) +
                            ((bgroup[2] & 63) << 6) + (bgroup[3] & 63);
                    outstr.writeByte(((group >> 16) & 255));
                    outstr.writeByte(((group >> 8) & 255));
                    outstr.writeByte(group & 255);
                }
            }
            // Handle the case of remaining characters and
            // pad handling.  If input is not a multiple of 4
            // in length, then '=' pads are assumed.
            switch (i) {
                case 2:
                    // One output byte from two input bytes.
                    group = ((bgroup[0] & 63) << 18) + ((bgroup[1] & 63) << 12);
                    outstr.writeByte(((group >> 16) & 255));
                    break;
                case 3:
                    // Two output bytes from three input bytes.
                    group = ((bgroup[0] & 63) << 18) + ((bgroup[1] & 63) << 12) +
                            ((bgroup[2] & 63) << 6);
                    outstr.writeByte(((group >> 16) & 255));
                    outstr.writeByte(((group >> 8) & 255));
                    break;
                default:
                    // Any other case, including correct 0, is treated as
                    // end of data.
                    break;
            }
            outstr.flush();
            return bytestr.toByteArray();
        } catch (IOException e) {
        } // Won't happen. Return null if it does.
        return null;
    }
    public static String base64code = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
            "abcdefghijklmnopqrstuvwxyz" + "0123456789" + "+/";
    public static int splitLinesAt = 76;

    public static String base64Encode(String string) {

        String encoded = "";
        // determine how many padding bytes to add to the output
        int paddingCount = (3 - (string.length() % 3)) % 3;
        // add any necessary padding to the input
        string += "\0\0".substring(0, paddingCount);
        // process 3 bytes at a time, churning out 4 output bytes
        // worry about CRLF insertions later
        for (int i = 0; i < string.length(); i += 3) {

            int j = (string.charAt(i) << 16) + (string.charAt(i + 1) << 8) + string.charAt(i + 2);
            encoded = encoded + base64code.charAt((j >> 18) & 0x3f) +
                    base64code.charAt((j >> 12) & 0x3f) +
                    base64code.charAt((j >> 6) & 0x3f) +
                    base64code.charAt(j & 0x3f);

        }
        // replace encoded padding nulls with "="
        return splitLines(encoded.substring(0, encoded.length() -
                paddingCount) + "==".substring(0, paddingCount));

    }

    public static String splitLines(String string) {

        String lines = "";
        for (int i = 0; i < string.length(); i += splitLinesAt) {

            lines += string.substring(i, Math.min(string.length(), i + splitLinesAt));
            lines += "\r\n";

        }
        return lines;
    }

    public static String buildUpdateXUpdatePemakai(String entitas, String idTag, String id, String nama, String password, String peran) {
        return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:update select=\"//" + entitas + "[" + idTag + "=" + id + "]/nama\">" + nama + "</xupdate:update>" +
                "<xupdate:update select=\"//" + entitas + "[" + idTag + "=" + id + "]/sandi\">" + password + "</xupdate:update>" +
                "<xupdate:update select=\"//" + entitas + "[" + idTag + "=" + id + "]/peran\">" + peran + "</xupdate:update>" +
                "</xupdate:modifications>";
    }

    private static String getUniqueId() {
        return "" + (long) (1000000 + (Math.random() * 1000000));
    }

    public static String buildInsertXUpdatePemakai(String root, String entitas, String nama, String password, String peran) {
        return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:append select=\"/" + root + "\">" +
                "<xupdate:element name=\"" + entitas + "\">" +
                "<idpemakai>" + getUniqueId() + "</idpemakai>" +
                "<nama>" + nama + "</nama>" +
                "<sandi>" + password + "</sandi>" +
                "<peran>" + peran + "</peran>" +
                "</xupdate:element>" +
                "</xupdate:append>" +
                "</xupdate:modifications>";
    }

    public static String buildInsertXUpdateRiwayatPenyakit(String root, String entitas, String key, String child, String element, String nomoridentitas, String tanggalpemeriksaan,
            String keluhan, String diagnosa, String pengobatan, String tindakanmedis, String keterangan) {
            return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:append select=\"/"+root+"/"+entitas+"["+key+"='"+nomoridentitas+"']/"+child+"\">"+
                "<xupdate:element name=\"" + element + "\">" +
                "<idriwayatpenyakit>" + getUniqueId() + "</idriwayatpenyakit>" +
                "<tanggalpemeriksaan>" + tanggalpemeriksaan + "</tanggalpemeriksaan>" +
                "<keluhan>" + keluhan + "</keluhan>" +
                "<diagnosa>" + diagnosa + "</diagnosa>" +
                "<pengobatan>" + pengobatan + "</pengobatan>" +
                "<tindakanmedis>" + tindakanmedis + "</tindakanmedis>" +
                "<keterangan>" + keterangan + "</keterangan>" +
                "</xupdate:element>" +
                "</xupdate:append>" +
                "</xupdate:modifications>";
    }
    
    public static String buildUpdateXUpdateRiwayatPenyakit(String id, String tanggalpemeriksaan,
            String keluhan, String diagnosa, String pengobatan, String tindakanmedis, String keterangan) {
            //<xupdate:modifications version="1.0" xmlns:xupdate="http://www.xmldb.org/xupdate">
            //<xupdate:update select="//pemeriksaan[idriwayatpenyakit='1158733']/keluhan">Kuat</xupdate:update></xupdate:modifications>
            return "<xupdate:modifications version=\"1.0\" xmlns:xupdate=\"http://www.xmldb.org/xupdate\">" +
                "<xupdate:update select=\"//pemeriksaan[idriwayatpenyakit='"+id+"']/tanggalpemeriksaan\">"+tanggalpemeriksaan+"</xupdate:update>"+
                "<xupdate:update select=\"//pemeriksaan[idriwayatpenyakit='"+id+"']/keluhan\">"+keluhan+"</xupdate:update>"+
                "<xupdate:update select=\"//pemeriksaan[idriwayatpenyakit='"+id+"']/diagnosa\">"+diagnosa+"</xupdate:update>"+
                "<xupdate:update select=\"//pemeriksaan[idriwayatpenyakit='"+id+"']/pengobatan\">"+pengobatan+"</xupdate:update>"+
                "<xupdate:update select=\"//pemeriksaan[idriwayatpenyakit='"+id+"']/tindakanmedis\">"+tindakanmedis+"</xupdate:update>"+
                "<xupdate:update select=\"//pemeriksaan[idriwayatpenyakit='"+id+"']/keterangan\">"+keterangan+"</xupdate:update>"+
                "</xupdate:modifications>";
    }
    
    public static String safeEncrypt(String plainText,String password){
        return Base64Coder.encodeString(encrypt(plainText, password));
    }
    
    public static String safeDecrypt(String cryptedText,String password){
        return decrypt(Base64Coder.decodeString(cryptedText), password);
    }
}
