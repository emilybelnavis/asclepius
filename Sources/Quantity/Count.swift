//
//  Count.swift
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
 A measured or measurable amount
 
 A measured amount (or an amount that can be potentially measured). Note that measured amounts include
 amounts that are not precisely quantified, including amounts involving arbitrary units and floating currencies
 */
open class Count: Quantity {
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: FHIRKitPrimitive<FHIRKitString>? = nil,
    comparator: FHIRKitPrimitive<QuantityComparator>? = nil,
    system: FHIRKitPrimitive<FHIRKitURI>? = nil,
    unit: FHIRKitPrimitive<FHIRKitString>? = nil,
    value: FHIRKitPrimitive<FHIRKitDecimal>? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.code = code
    self.comparator = comparator
    self.system = system
    self.unit = unit
    self.value = value
  }
  
  // MARK: - Codable
  public required init(from decoder: Decoder) throws {
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Count else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return true
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
  }
}
