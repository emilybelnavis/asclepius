//
//  DiagnosticReportMedia.swift
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
 Key images associated with this report; A list of key images associated with this report. The images are generally
 created during the diagnostic process, and may be directly of the patient, or of treated specimens (i.e. slides
 of interest)
 */
open class DiagnosticReportMedia: BackboneElement {
  /// Comment about the image (e.g. explanation)
  public var comment: FHIRKitPrimitive<FHIRKitString>?
  
  /// Reference to the image source
  public var link: Reference
  
  public init(link: Reference) {
    self.link = link
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    comment: FHIRKitPrimitive<FHIRKitString>? = nil,
    link: Reference
  ) {
    self.init(link: link)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.comment = comment
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case comment; case _comment
    case link
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.comment = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .comment, auxKey: ._comment)
    self.link = try Reference(from: codingKeyContainer, forKey: .link)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try comment?.encode(on: &codingKeyContainer, forKey: .comment, auxKey: ._comment)
    try link.encode(on: &codingKeyContainer, forKey: .link)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DiagnosticReportMedia else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return comment == _other.comment
    && link == _other.link
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(comment)
    hasher.combine(link)
  }
}
