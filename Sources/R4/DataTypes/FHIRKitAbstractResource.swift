//
//  AbstractResource.swift
//  FHIRKit
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

import Foundation
import FHIRKitCore

/**
 Base class for all FHIR Resources
 */

open class FHIRKitAbstractResource: FHIRKitType {
  open class var resourceType: ResourceType { return .resource }
  
  public init() { }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case resourceType
  }
  
  public required init(from decoder: Decoder) throws { }
  
  public func encode(to encoder: Encoder) throws {
    var codingContainer = encoder.container(keyedBy: CodingKeys.self)
    try codingContainer.encode(type(of: self).resourceType.rawValue, forKey: .resourceType)
  }
  
  // MARK: - Custom String Convertible
  public var description: String {
    return "<\(type(of: self).resourceType)>"
  }
  
  // MARK: - Equatable
  public static func == (leftSide: FHIRKitAbstractResource, rightSide: FHIRKitAbstractResource) -> Bool {
    return leftSide.isEqual(to: rightSide)
  }
  
  public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? FHIRKitAbstractResource else {
      return false
    }
    
    guard type(of: self) == type(of: _other) else {
      return false
    }
    
    return type(of: self).resourceType == type(of: _other).resourceType
  }
  
  // MARK: - Hashable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(type(of: self).resourceType)
  }
}
