//
//  StringSymbolsRemove.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 26.05.2022.
//

import Foundation

extension String {

    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }

    func removeCharacters(from: String) -> String {
        return removeCharacters(from: CharacterSet(charactersIn: from))
    }
}
