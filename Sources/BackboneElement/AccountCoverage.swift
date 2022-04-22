//
//  AccountCoverage.swift
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
 The party(s) that are responsible for covering the payment of this account and what order they should be
 applied to the account
 */
open class AccountCoverage: BackboneElement {
  /// The party(s), such as insurance providers, that may contribute to the payment of this account
  public var coverage: Reference
  
  /// The priority of coverage in the context of this account
  public var priority: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  public init(coverage: Reference) {
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    coverage: Reference,
    priority: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    modifierExtension: [Extension]? = nil
  ) {
    self.init(coverage: coverage)
    self.`extension` = `extension`
    self.id = id
    self.priority = priority
    self.modifierExtension = modifierExtension
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case coverage
    case priority; case _priority
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.coverage = try Reference(from: _container, forKey: .coverage)
    self.priority = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .priority, auxiliaryKey: ._priority)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try coverage.encode(on: &_container, forKey: .coverage)
    try priority?.encode(on: &_container, forKey: .priority, auxiliaryKey: ._priority)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AccountCoverage else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return coverage == _other.coverage
    && priority == _other.priority
  }
  
  public override func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(coverage)
    hasher.combine(priority)
  }
}
