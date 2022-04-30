//
//  ParameterDefinition.swift
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
 The parameters to the module. This collection specifies both the input and output parameters. Input
 parameters are provided by the caller as part of the `$evaluate` operaion. Output parameters are included
 in the GuidanceResponse
 */
open class ParameterDefinition: Element {
  /// Name used to access the parameter value
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  /// Whether the parameter is input or output for the module
  public var use: FHIRKitPrimitive<OperationParameterUse>
  
  /// Minimum cardinality
  public var min: FHIRKitPrimitive<FHIRKitInteger>?
  
  /// Maximum cardinality
  public var max: FHIRKitPrimitive<FHIRKitInteger>?
  
  /// A brief description of the parameter
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  /// What type of value
  public var type: FHIRKitPrimitive<FHIRKitString>
  
  /// What profile the value is expected to be
  public var profile: FHIRKitPrimitive<Canonical>?
  
  public init(use: FHIRKitPrimitive<OperationParameterUse>, type: FHIRKitPrimitive<FHIRKitString>) {
    self.use = use
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    use: FHIRKitPrimitive<OperationParameterUse>,
    min: FHIRKitPrimitive<FHIRKitInteger>? = nil,
    max: FHIRKitPrimitive<FHIRKitInteger>? = nil,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<FHIRKitString>,
    profile: FHIRKitPrimitive<Canonical>? = nil
  ) {
    self.init(use: use, type: type)
    self.fhirExtension = fhirExtension
    self.id = id
    self.name = name
    self.min = min
    self.max = max
    self.documentation = documentation
    self.profile = profile
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case use; case _use
    case min; case _min
    case max; case _max
    case documentation; case _documentation
    case type; case _type
    case profile; case _profile
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.use = try FHIRKitPrimitive<OperationParameterUse>(from: codingKeyContainer, forKey: .use, auxKey: ._use)
    self.min = try FHIRKitPrimitive<FHIRKitInteger>(from: codingKeyContainer, forKeyIfPresent: .min, auxKey: ._min)
    self.max = try FHIRKitPrimitive<FHIRKitInteger>(from: codingKeyContainer, forKeyIfPresent: .max, auxKey: ._max)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.type = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.profile = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try use.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try min?.encode(on: &codingKeyContainer, forKey: .min, auxKey: ._min)
    try max?.encode(on: &codingKeyContainer, forKey: .max, auxKey: ._max)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ParameterDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && use == _other.use
    && min == _other.min
    && max == _other.max
    && documentation == _other.documentation
    && type == _other.type
    && profile == _other.profile
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(use)
    hasher.combine(min)
    hasher.combine(max)
    hasher.combine(documentation)
    hasher.combine(type)
    hasher.combine(profile)
  }
}
