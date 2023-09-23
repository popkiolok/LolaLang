package com.lola.lang.parser;

public class NumberSystemHelper {
    public static boolean isValidNumber(String text) {
        text = text.toUpperCase();
        int base = Integer.parseInt(text.substring(0, text.indexOf('X')));
        String number = text.substring(text.indexOf('X') + 1);

        for (char c : number.toCharArray()) {
            int digit = Character.digit(c, base);
            if (digit < 0 || digit >= base) {
                return false;
            }
        }

        return true;
    }
}

