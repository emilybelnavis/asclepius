//
//  ContactPointSystem.swift
//  AlexandriaHRM
//  Module: STU3
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

/**
 Telecommunications form for contact point.
 
 URL: http://hl7.org/fhir/contact-point-system
 ValueSet: http://hl7.org/fhir/ValueSet/contact-point-system
 */
public enum ContactPointSystem: String, AlexandriaHRMPrimitiveType {
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
