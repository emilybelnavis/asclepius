//
//  ClaimRelated.swift
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
 Prior or corollary claims. Other claims which are related to this claim such as prior submissions or claims for
 related services or for the same event.
 */
open class ClaimRelated: BackboneElement {
  /// Reference to the related claim
  public var claim: Reference?
  
  /// How the reference claim is related
  public var relationship: CodableConcept?
  
  /// File or case reference
  public var reference: Identifier?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    claim: Reference? = nil,
    relationship: CodableConcept? = nil,
    reference: Identifier? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.claim = claim
    self.relationship = relationship
    self.reference = reference
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case claim
    case relationship
    case reference
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.claim = try Reference(from: _container, forKeyIfPresent: .claim)
    self.relationship = try CodableConcept(from: _container, forKeyIfPresent: .relationship)
    self.reference = try Identifier(from: _container, forKeyIfPresent: .reference)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try claim?.encode(on: &_container, forKey: .claim)
    try relationship?.encode(on: &_container, forKey: .relationship)
    try reference?.encode(on: &_container, forKey: .reference)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimRelated else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return claim == _other.claim
    && relationship == _other.claim
    && reference == _other.reference
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(claim)
    hasher.combine(relationship)
    hasher.combine(reference)
  }
}
