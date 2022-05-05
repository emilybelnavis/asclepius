//
//  FHIRKit+IntegerRepresentable.swift
//  FHIRKit
//  Module: FHIRKitCore
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

public protocol FHIRKitIntegerRepresentable: ExpressibleByIntegerLiteral, Equatable, Decodable {
    
    var integer: Self.IntegerLiteralType { get set }
}

extension FHIRKitIntegerRepresentable where IntegerLiteralType: Equatable {
    
    public static func == (leftSide: Self, rightSide: Self) -> Bool {
        return leftSide.integer == rightSide.integer
    }
}
