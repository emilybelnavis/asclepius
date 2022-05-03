//
//  Ratio.swift
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
 A ratio of two `Quantity` values - a numerator and a denominator
 
 A relationship of two `Quantity` values expressed as a numerator and denominator
 */
open class Ratio: Element {
  /// Numerator value
  public var numerator: Quantity?
  
  /// Denominator value
  public var denominator: Quantity?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    numerator: Quantity? = nil,
    denominator: Quantity? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.numerator = numerator
    self.denominator = denominator
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case numerator
    case denominator
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.numerator = try Quantity(from: codingKeyContainer, forKeyIfPresent: .numerator)
    self.denominator = try Quantity(from: codingKeyContainer, forKeyIfPresent: .denominator)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try numerator?.encode(on: &codingKeyContainer, forKey: .numerator)
    try denominator?.encode(on: &codingKeyContainer, forKey: .denominator)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Ratio else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return numerator == _other.numerator
    && denominator == _other.denominator
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(numerator)
    hasher.combine(denominator)
  }
}
