//
//  AdverseEventSuspectEntity.swift
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

/// Describes the entity that is suspected to have caused the adverse event
open class AdverseEventSuspectEntity: BackboneElement {
  /// Refers to the specific entity that caused the adverse event
  public var instance: Reference
  
  /// Information on the possible cause of the event
  public var causality: [AdverseEventSuspectEntityCausality]?
  
  public init(instance: Reference) {
    self.instance = instance
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    instance: Reference,
    causality: [AdverseEventSuspectEntityCausality]? = nil
  ) {
    self.init(instance: instance)
    self.`extension` = `extension`
    self.id = id
    self.causality = causality
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case instance
    case causality
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.instance = try Reference(from: _container, forKey: .instance)
    self.causality = try [AdverseEventSuspectEntityCausality](from: _container, forKeyIfPresent: .causality)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try instance.encode(on: &_container, forKey: .instance)
    try causality?.encode(on: &_container, forKey: .causality)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AdverseEventSuspectEntity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return instance == _other.instance
    && causality == _other.causality
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(instance)
    hasher.combine(causality)
  }
}
