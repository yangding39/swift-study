// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var str1 = "the first playGround 程序"

var unicodeString = ""

var c in str1.utf8 {
    unicodeString += c
}
unicodeString = "" + unicodeString
println(unicodeString)
