//
//  CoverageEligibilityRequestSupportingInfo.swift
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
 Supporting information; Additional information codes regarding exceptions, special considerations, the condition,
 situation, prior, or concurrent issues.
 */
open class CoverageEligibilityRequestSupportingInfo: BackboneElement {
  /// Information instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Data to be provided
  public var information: Reference
  
  /// Applies to all items
  public var appliesToAll: FHIRKitPrimitive<FHIRKitBool>?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, information: Reference) {
    self.sequence = sequence
    self.information = information
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    information: Reference,
    appliesToAll: FHIRKitPrimitive<FHIRKitBool>? = nil
  ) {
    self.init(sequence: sequence, information: information)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.appliesToAll = appliesToAll
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case information
    case appliesToAll; case _appliesToAll
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.information = try Reference(from: codingKeyContainer, forKey: .information)
    self.appliesToAll = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .appliesToAll, auxKey: ._appliesToAll)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    let codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
  
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try information.encode(on: &codingKeyContainer, forKey: .information)
    try appliesToAll?.encode(on: &codingKeyContainer, forKey: .appliesToAll, auxKey: ._appliesToAll)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityRequestSupportingInfo else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && information == _other.information
    && appliesToAll == _other.appliesToAll
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(information)
    hasher.combine(appliesToAll)
  }
}
