//
//  Coding.swift
//  Asclepius
//  Module: R4
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

import AsclepiusCore

/**
 A representatoin of a defined concept using a sympbol from a defined "code system"
 */
open class Coding: Element {
  /// Identity of the terminology system
  public var system: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Version of the system (if relevant)
  public var version: AsclepiusPrimitive<AsclepiusString>?
  
  /// Symbol in syntax defined by the system
  public var code: AsclepiusPrimitive<AsclepiusString>?
  
  /// Representation defined by the system
  public var display: AsclepiusPrimitive<AsclepiusString>?
  
  /// Was this coding chosen directly by the user?
  public var userSelected: AsclepiusPrimitive<AsclepiusBool>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    system: AsclepiusPrimitive<AsclepiusURI>? = nil,
    version: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: AsclepiusPrimitive<AsclepiusString>? = nil,
    display: AsclepiusPrimitive<AsclepiusString>? = nil,
    userSelected: AsclepiusPrimitive<AsclepiusBool>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.system = system
    self.version = version
    self.code = code
    self.display = display
    self.userSelected = userSelected
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case system; case _system
    case version; case _version
    case code; case _code
    case display; case _display
    case userSelected; case _userSelected
  }

  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.system = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.version = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .version, auxKey: ._version)
    self.code = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .code, auxKey: ._code)
    self.display = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.userSelected = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .userSelected, auxKey: ._userSelected)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    try code?.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    try userSelected?.encode(on: &codingKeyContainer, forKey: .userSelected, auxKey: ._userSelected)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Coding else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return system == _other.system
      && version == _other.version
      && code == _other.code
      && display == _other.display
      && userSelected == _other.userSelected
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(system)
    hasher.combine(version)
    hasher.combine(code)
    hasher.combine(display)
    hasher.combine(userSelected)
  }
}
