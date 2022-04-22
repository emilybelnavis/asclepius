//
//  Period.swift
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
 Time range defined by a start and end date, and optionally time
 */
open class Period: Element {
  public var start: FHIRKitPrimitive<FHIRKitDateTime>?
  public var end: FHIRKitPrimitive<FHIRKitDateTime>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    end: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    start: FHIRKitPrimitive<FHIRKitDateTime>? = nil
  ) {
    self.init()
    
    self.end = end
    self.`extension` = `extension`
    self.id = id
    self.start = start
  }
  
  private enum CodingKeys: String, CodingKey {
    case end; case _end
    case start; case _start
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.end = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .end, auxiliaryKey: ._end)
    self.start = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .start, auxiliaryKey: ._start)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try end?.encode(on: &_container, forKey: .end, auxiliaryKey: ._end)
    try start?.encode(on: &_container, forKey: .start, auxiliaryKey: ._start)
    
    try super.encode(to: encoder)
  }
  
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Period else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return end == _other.end
    && start == _other.start
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(end)
    hasher.combine(start)
  }
}
