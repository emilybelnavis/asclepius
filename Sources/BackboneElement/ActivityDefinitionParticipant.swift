//
//  ActivityDefinitionParticipant.swift
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
 Who should participate in the action.
 
 Indicates who should participate in performing the described action
 */
open class ActivityDefinitionParticipant: BackboneElement {
  /// The type of participant
  public var type: FHIRKitPrimitive<ActionParticipantType>
  
  /// E.g. nurse, surgeon, parent, etc...
  public var role: CodableConcept?
  
  public init(type: FHIRKitPrimitive<ActionRelationshipType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<ActionRelationshipType>,
    role: CodableConcept? = nil,
    modifierExtension: [Extension]? = nil
  ) {
    self.init(type: type)
    self.`extension` = `extension`
    self.id = id
    self.role = role
    self.modifierExtension = modifierExtension
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case role
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try FHIRKitPrimitive<ActionRelationshipType>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.role = try CodableConcept(from: _container, forKeyIfPresent: .role)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try role?.encode(on: &_container, forKey: .role)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ActivityDefinitionParticipant else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && role == _other.role
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(role)
  }
}
