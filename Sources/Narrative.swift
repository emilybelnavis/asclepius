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

open class Narrative: Element {
  public var status: FHIRKitPrimitive<NarrativeStatus>
  public var div: FHIRKitPrimitive<FHIRKitString>
  
  public init(div: FHIRKitPrimitive<FHIRKitString>, status: FHIRKitPrimitive<NarrativeStatus>) {
    self.div = div
    self.status = status
    super.init()
  }
  
  public convenience init(
    div: FHIRKitPrimitive<FHIRKitString>,
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    status: FHIRKitPrimitive<NarrativeStatus>
  ) {
    self.init(div: div, status: status)
    self.`extension` = `extension`
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case div; case _div
    case status; case _status
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.div = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .div, auxiliaryKey: ._div)
    self.status = try FHIRKitPrimitive<NarrativeStatus(from: _container, forKey: .status, auxiliaryKey: ._status)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try div.encode(on: &_container, forKey: .div, auxiliaryKey: ._div)
    try status.encode(on: &_container, forKey: .status, auxiliaryKey: ._status)
    try super.encode(to: encoder)
  }
}
