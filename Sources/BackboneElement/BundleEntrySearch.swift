//
//  BundleEntrySearch.swift
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

/// Information about the search process that lead to the creation of this entry
open class BundleEntrySearch: BackboneElement {
  /// Why yhis entry is in the result set - whether it is include as a mathc or because of an `_include`
  /// requrirement, or to convey information or warning infomation about the search process.
  public var mode: FHIRKitPrimitive<SearchEntryMode>?
  
  /// Search ranking (between 0 and 1
  public var score: FHIRKitPrimitive<FHIRKitDecimal>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    mode: FHIRKitPrimitive<SearchEntryMode>? = nil,
    score: FHIRKitPrimitive<FHIRKitDecimal>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.mode = mode
    self.score = score
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case score; case _score
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try FHIRKitPrimitive<SearchEntryMode>(from: codingKeyContainer, forKeyIfPresent: .mode, auxKey: ._mode)
    self.score = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .score, auxKey: ._score)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode?.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try score?.encode(on: &codingKeyContainer, forKey: .score, auxKey: ._score)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BundleEntrySearch else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && score == _other.score
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(score)
  }
}
