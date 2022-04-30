//
//  AbstractResource.swift
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
