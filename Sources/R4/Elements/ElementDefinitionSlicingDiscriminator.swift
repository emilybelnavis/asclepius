//
//  ElementDefinitionSlicingDiscriminator.swift
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
 Element values that are used to distinguish the slices. Designates which child elements are used to discriminate
 between the slices when processing an instance. If one or more discriminators are provided, the value of the
 child elements SHALL completely distinguish which slice the element in the resource matches based on the
 allowed values for thos elements in each of the slices
 */
open class ElementDefinitionSlicingDiscriminator: Element {
  /// How the element value is interpreted when discrimination is evaluated
  public var type: FHIRKitPrimitive<DiscriminatorType>
  
  /// Path to element value
  public var path: FHIRKitPrimitive<FHIRKitString>
  
  public init(type: FHIRKitPrimitive<DiscriminatorType>, path: FHIRKitPrimitive<FHIRKitString>) {
    self.type = type
    self.path = path
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<DiscriminatorType>,
    path: FHIRKitPrimitive<FHIRKitString>
  ) {
    self.init(type: type, path: path)
    self.fhirExtension = fhirExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case path; case _path
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try FHIRKitPrimitive<DiscriminatorType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionSlicingDiscriminator else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && path == _other.path
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(path)
  }
}
