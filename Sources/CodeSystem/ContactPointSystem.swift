//
//  ContactPointSystem.swift
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
 Telecommunications form for contact point.
 
 URL: http://hl7.org/fhir/contact-point-system
 ValueSet: http://hl7.org/fhir/ValueSet/contact-point-system
 */
public enum ContactPointSystem: String, FHIRKitPrimitiveType {
  /// The value is a telephone number used for voice calls. Use of full international numbers starting with a
  /// `+` is recommended to enable automatic dialing support, but not required
  case phone
  
  /// The value is a fax machine. Use of international numbers starting with with a `+` is recommended
  /// to enable automatic dialing support, but not required
  case fax
  
  /// The value is an email address
  case email
  
  /// The value is a pager number. These may be local pager numbers that are only useable on a particular
  /// pager system
  case pager
  
  /// A contact that is not a phone, fax, pager, or email address, and is expressed as a URL. This is
  /// intended for various institutional or personal contacts including websites. Do not use for email
  /// addresses
  case url
  
  /// A contact that can be used for sending an SMS message (e.g. mobile phones, some landlines)
  case sms
  
  /// A contact that is not a phone, fax, page, or email address, and is not expressible as a URL. E.g.
  /// Internal mail address. This SHOULD NOT be used for contacts that are expressible as a URL,
  /// Extensions may be used to distinguish "other" contact types.
  case other
}
