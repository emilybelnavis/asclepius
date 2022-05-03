//
//  PerformerRolesCodes.swift
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
 This value set includes sample Performer Role codes.
 
 URL: http://hl7.org/fhir/consentperformer
 ValueSet: http://hl7.org/fhir/ValueSet/consent-performer
 */
public enum PerformerRoleCodes: String, FHIRKitPrimitiveType {
  /// An entity or an entity's delegatee who is the grantee in an agreement such as a consent for services, advanced
  /// directive, or a privacy consent directive in accordance with jurisdictional, organizational, or patient policy.
  case consenter
  
  /// An entity which accepts certain rights or authority from a grantor.
  case grantee
  
  /// An entity which agrees to confer certain rights or authority to a grantee.
  case grantor
  
  /// A party to whom some right or authority is granted by a delegator.
  case delegatee
  
  /// A party that grants all or some portion its right or authority to another party.
  case delegator
}
