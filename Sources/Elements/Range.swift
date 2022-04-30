//
//  Range.swift
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
 Set of values bounded by low and high.
 
 A set of ordered Quantities defined by a low and high limit
 */
open class Range: Element {
  /// Low limit
  public var low: Quantity?
  
  /// High limit
  public var high: Quantity?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    low: Quantity? = nil,
    high: Quantity? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.low = low
    self.high = high
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case low
    case high
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.low = try Quantity(from: codingKeyContainer, forKeyIfPresent: .low)
    self.high = try Quantity(from: codingKeyContainer, forKeyIfPresent: .high)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try low?.encode(on: &codingKeyContainer, forKey: .low)
    try high?.encode(on: &codingKeyContainer, forKey: .high)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Range else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return low == _other.low
    && high == _other.high
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(low)
    hasher.combine(high)
  }
}
