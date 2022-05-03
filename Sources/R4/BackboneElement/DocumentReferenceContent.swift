//
//  DocumentReferenceContent.swift
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
 The document and format referenced. There may be multiple content element repititions, each with a different
 format.
 */
open class DocumentReferenceContent: BackboneElement {
  /// Where to access the document
  public var attachment: Attachment
  
  /// Format/content rules for the document
  public var format: Coding?
  
  public init(attachment: Attachment) {
    self.attachment = attachment
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    attachment: Attachment,
    format: Coding?
  ) {
    self.init(attachment: attachment)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.format = format
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case attachment
    case format
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.attachment = try Attachment(from: codingKeyContainer, forKey: .attachment)
    self.format = try Coding(from: codingKeyContainer, forKeyIfPresent: .format)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try attachment.encode(on: &codingKeyContainer, forKey: .attachment)
    try format?.encode(on: &codingKeyContainer, forKey: .format)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DocumentReferenceContent else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return attachment == _other.attachment
    && format == _other.format
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(attachment)
    hasher.combine(format)
  }
}
