package Lib;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MyLib {

    public static String hashString(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());

            // Chuyển đổi byte array thành chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean isOrderSuccess() {
        return true;
    }

}
