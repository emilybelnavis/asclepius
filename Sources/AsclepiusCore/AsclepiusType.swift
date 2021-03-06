//
//  AsclepiusType.swift
//  Asclepius
//  Module: AsclepiusCore
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

public protocol AsclepiusType: Codable, Hashable {

}

extension AsclepiusType {

    public init<_Key>(from parentContainer: KeyedDecodingContainer<_Key>, forKey key: _Key) throws {
        self = try parentContainer.decode(Self.self, forKey: key)
    }

    public init?<_Key>(from parentContainer: KeyedDecodingContainer<_Key>, forKeyIfPresent key: _Key) throws {
        guard let decoded = try parentContainer.decodeIfPresent(Self.self, forKey: key) else {
            return nil
        }
        self = decoded
    }

    public func encode<_Key>(on parentContainer: inout KeyedEncodingContainer<_Key>, forKey key: _Key) throws {
        try parentContainer.encode(self, forKey: key)
    }
}

extension Array where Element: AsclepiusType {

    public init<_Key>(from container: KeyedDecodingContainer<_Key>, forKey key: _Key) throws {
        self = try container.decode(Self.self, forKey: key)
    }

    public init?<_Key>(from container: KeyedDecodingContainer<_Key>, forKeyIfPresent key: _Key) throws {
        guard let decoded = try container.decodeIfPresent(Self.self, forKey: key) else {
            return nil
        }
        self = decoded
    }

    public func encode<_Key>(on parentContainer: inout KeyedEncodingContainer<_Key>, forKey key: _Key) throws {
        try parentContainer.encode(self, forKey: key)
    }
}
