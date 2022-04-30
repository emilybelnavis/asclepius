//
//  AdverseEventSuspectEntityCausality.swift
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

/// Information on the possible cause of the adverse event
open class AdverseEventSuspectEntityCausality: BackboneElement {
  /// Assessment of if the entity caused the event
  public var assessment: CodableConcept?
  
  /// AdverseEvent.suspectEntity.causalityProductRelatedness
  public var productRelatedness: FHIRKitPrimitive<FHIRKitString>?
  
  /// AdverseEvent.suspectEntity.causalityAuthor
  public var author: Reference?
  
  /// ProbabilityScale | Bayesian | Checklist
  public var method: CodableConcept?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    assessment: CodableConcept? = nil,
    productRelatedness: FHIRKitPrimitive<FHIRKitString>? = nil,
    author: Reference? = nil,
    method: CodableConcept? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.assessment = assessment
    self.productRelatedness = productRelatedness
    self.author = author
    self.method = method
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case assessment
    case productRelatedness; case _productRelatedness
    case author
    case method
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.assessment = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .assessment)
    self.productRelatedness = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .productRelatedness, auxKey: ._productRelatedness)
    self.author = try Reference(from: codingKeyContainer, forKeyIfPresent: .author)
    self.method = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .method)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try assessment?.encode(on: &codingKeyContainer, forKey: .assessment)
    try productRelatedness?.encode(on: &codingKeyContainer, forKey: .productRelatedness, auxKey: ._productRelatedness)
    try author?.encode(on: &codingKeyContainer, forKey: .author)
    try method?.encode(on: &codingKeyContainer, forKey: .method)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AdverseEventSuspectEntityCausality else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return assessment == _other.assessment
    && productRelatedness == _other.productRelatedness
    && author == _other.author
    && method == _other.method
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(assessment)
    hasher.combine(productRelatedness)
    hasher.combine(author)
    hasher.combine(method)
  }
}
