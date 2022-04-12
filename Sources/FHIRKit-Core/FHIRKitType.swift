//
//  FHIRKitType.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

public protocol FHIRType: Codable, Hashable {
    
}

extension FHIRType {
    
    public init<K>(from parentContainer: KeyedDecodingContainer<K>, forKey key: K) throws {
        self = try parentContainer.decode(Self.self, forKey: key)
    }
    
    public init?<K>(from parentContainer: KeyedDecodingContainer<K>, forKeyIfPresent key: K) throws {
        guard let decoded = try parentContainer.decodeIfPresent(Self.self, forKey: key) else {
            return nil
        }
        self = decoded
    }
    
    public func encode<K>(on parentContainer: inout KeyedEncodingContainer<K>, forKey key: K) throws {
        try parentContainer.encode(self, forKey: key)
    }
}

extension Array where Element: FHIRType {
    
    public init<K>(from container: KeyedDecodingContainer<K>, forKey key: K) throws {
        self = try container.decode(Self.self, forKey: key)
    }
    
    public init?<K>(from container: KeyedDecodingContainer<K>, forKeyIfPresent key: K) throws {
        guard let decoded = try container.decodeIfPresent(Self.self, forKey: key) else {
            return nil
        }
        self = decoded
    }
    
    public func encode<K>(on parentContainer: inout KeyedEncodingContainer<K>, forKey key: K) throws {
        try parentContainer.encode(self, forKey: key)
    }
}