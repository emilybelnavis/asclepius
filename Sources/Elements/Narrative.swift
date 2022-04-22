//
//  Narrative.swift
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
 A human-readable summary of the resouce conveying the essential clinical and business information for the
 resource.
 */
open class Narrative: Element {
  /// The status of the narrative - whether it's entirely generated, or wheter a human authored it and it may
  /// contain additional data.
  public var status: FHIRKitPrimitive<NarrativeStatus>
  
  /// Limited XHTML content
  public var div: FHIRKitPrimitive<FHIRKitString>
  
  public init(status: FHIRKitPrimitive<NarrativeStatus>, div: FHIRKitPrimitive<FHIRKitString>) {
    self.status = status
    self.div = div
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    status: FHIRKitPrimitive<NarrativeStatus>,
    div: FHIRKitPrimitive<FHIRKitString>
  ) {
    self.init(status: status, div: div)
    self.`extension` = `extension`
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case status; case _status
    case div; case _div
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.status = try FHIRKitPrimitive<NarrativeStatus>(from: _container, forKey: .status, auxiliaryKey: ._status)
    self.div = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .div, auxiliaryKey: ._div)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try status.encode(on: &_container, forKey: .status, auxiliaryKey: ._status)
    try div.encode(on: &_container, forKey: .div, auxiliaryKey: ._div)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Narrative else {
      return false
    }

    guard super.isEqual(to: _other) else {
      return false
    }
    
    return status == _other.status
    && div == _other.div
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(status)
    hasher.combine(div)
  }
}
