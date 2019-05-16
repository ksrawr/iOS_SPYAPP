//
//  CeasarCipher.swift
//  SpyApp
//
//  Created by Khoi Dao on 5/15/19.
//  Copyright © 2019 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

class CesarCipher: CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String {
        guard let secretInt = UInt32(secret) else {
            return "Error"
        }
        var encoded = ""
        for character in plaintext {
            guard let firstUnicodeScalar = character.unicodeScalars.first else {
                continue
            }
            let unicode = firstUnicodeScalar.value
            let shiftedUnicode = unicode + secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            encoded += shiftedCharacter
        }
        return encoded
    }
    func decode(output: String, secret: String) -> String {
        guard let secretAlpha = UInt32(secret) else {
            return "Error"
        }
        var decoded = ""
        
        for character in output {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - secretAlpha
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            decoded += shiftedCharacter
        }
        return decoded
    }
}
