//
//  ChargeItemDefinitionPropertyGroup.swift
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
 Group of properties which are applicable under the same conditions. If no applicability rules are established
 for the group, then all properties always apply.
 */
open class ChargeItemDefinitionPropertyGroup: BackboneElement {
  /// Conditoins under which the `priceComponent` is applicable
  public var applicability: [ChargeItemDefinitionApplicability]?
  
  /// Components of total line item price
  public var priceComponent: [ChargeItemDefinitionPropertyGroupPriceComponent]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    applicability: [ChargeItemDefinitionApplicability]? = nil,
    priceComponent: [ChargeItemDefinitionPropertyGroupPriceComponent]? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.applicability = applicability
    self.priceComponent = priceComponent
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case applicability
    case priceComponent
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.applicability = try [ChargeItemDefinitionApplicability](from: _container, forKeyIfPresent: .applicability)
    self.priceComponent = try [ChargeItemDefinitionPropertyGroupPriceComponent](from: _container, forKeyIfPresent: .priceComponent)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try applicability?.encode(on: &_container, forKey: .applicability)
    try priceComponent?.encode(on: &_container, forKey: .priceComponent)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ChargeItemDefinitionPropertyGroup else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return applicability == _other.applicability
    && priceComponent == _other.priceComponent
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(applicability)
    hasher.combine(priceComponent)
  }
}