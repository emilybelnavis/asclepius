//
//  AlexandriaHRM+Scanner.swift
//  AlexandriaHRM
//  Module: AlexandriaHRMCore
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation

public extension Scanner {
    
    func hs_scanCharacters(from characterSet: CharacterSet) -> String? {
        #if os(Linux)
        return scanCharacters(from: characterSet)
        #else
        
        if #available(macOS 10.15, *), #available(iOS 13, *), #available(watchOS 6, *), #available(tvOS 13, *) {
            return scanCharacters(from: characterSet)
        }
        var string: NSString?
        if scanCharacters(from: characterSet, into: &string), let string = string {
            return String(string)
        }
        return nil
        #endif
    }
}