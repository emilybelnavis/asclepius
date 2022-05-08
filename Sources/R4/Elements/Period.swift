//
//  Period.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore
/**
 Time range defined by a start and end date, and optionally time
 */
open class Period: Element {
  public var start: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  public var end: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    start: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil,
    end: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.start = start
    self.end = end
  }
  
  private enum CodingKeys: String, CodingKey {
    case start; case _start
    case end; case _end
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.start = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .start, auxKey: ._start)
    self.end = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .end, auxKey: ._end)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try start?.encode(on: &codingKeyContainer, forKey: .start, auxKey: ._start)
    try end?.encode(on: &codingKeyContainer, forKey: .end, auxKey: ._end)
    
    try super.encode(to: encoder)
  }
  
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Period else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return start == _other.start
    && end == _other.end
  }
  
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(start)
    hasher.combine(end)
  }
}
