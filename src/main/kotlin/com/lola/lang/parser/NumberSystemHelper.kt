@file:JvmName("NumberSystemHelper")
package com.lola.lang.parser

fun isValidNumber(text: String): Boolean {
    val delIndex = text.indexOfFirst { it == 'x' || it == 'X' }
    val base = text.substring(0, delIndex).toInt()
    val number = text.substring(delIndex + 1)
    for (c in number.toCharArray()) {
        if (c < '0' || c >= '0' + base)
            return false
    }
    return true
}