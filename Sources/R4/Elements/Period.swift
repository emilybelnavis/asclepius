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
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    start: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    end: FHIRKitPrimitive<FHIRKitDateTime>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.start = start
    self.end = end
  }
  
  private enum CodingKeys: String, CodingKey {
    case start; case _start
    case end; case _end
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.start = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .start, auxKey: ._start)
    self.end = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .end, auxKey: ._end)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try start?.encode(on: &codingKeyContainer, forKey: .start, auxKey: ._start)
    try end?.encode(on: &codingKeyContainer, forKey: .end, auxKey: ._end)
    
    try super.encode(to: encoder)
  }
  
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Period else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return start == _other.start
    && end == _other.end
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(start)
    hasher.combine(end)
  }
}
