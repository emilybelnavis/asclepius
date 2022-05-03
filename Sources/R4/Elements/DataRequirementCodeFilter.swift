//
//  DataRequirementCodeFilter.swift
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
 What codes are expected.
 
 Code filters specifiy additional constraints on the data, specifying the value set of interest for a particular
 element of the data. Each code filter defines an additional constraint onf the data, i.e. code filters are
 `AND` not `OR`
 */
open class DataRequirementCodeFilter: Element {
  /// A code-valued attribute to filter on
  public var path: FHIRKitPrimitive<FHIRKitString>?
  
  /// A coded parameter to search on
  public var searchParam: FHIRKitPrimitive<FHIRKitString>?
  
  /// Valueset for the filter
  public var valueSet: FHIRKitPrimitive<Canonical>?
  
  /// What code is expected
  public var code: [Coding]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>? = nil,
    searchParam: FHIRKitPrimitive<FHIRKitString>? = nil,
    valueSet: FHIRKitPrimitive<Canonical>? = nil,
    code: [Coding]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.path = path
    self.searchParam = searchParam
    self.valueSet = valueSet
    self.code = code
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case searchParam; case _searchParam
    case valueSet; case _valueSet
    case code
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .path, auxKey: ._path)
    self.searchParam = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .searchParam, auxKey: ._searchParam)
    self.valueSet = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueSet, auxKey: .valueSet)
    self.code = try [Coding](from: codingKeyContainer, forKeyIfPresent: .code)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path?.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try searchParam?.encode(on: &codingKeyContainer, forKey: .searchParam, auxKey: ._searchParam)
    try valueSet?.encode(on: &codingKeyContainer, forKey: .valueSet, auxKey: ._valueSet)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirementCodeFilter else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && searchParam == _other.searchParam
    && valueSet == _other.valueSet
    && code == _other.code
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(searchParam)
    hasher.combine(valueSet)
    hasher.combine(code)
  }
}
