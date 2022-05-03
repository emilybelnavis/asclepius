//
//  OrganizationAffiliationRole.swift
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
 This example value set defines a set of codes that can be used to indicate the role of one Organization in relation to
 another.
 
 URL: http://hl7.org/fhir/organization-role
 ValueSet: http://hl7.org/fhir/ValueSet/organization-role
 */
public enum OrganizationAffiliationRole: String, FHIRKitPrimitiveType {
  /// provider
  case provider
  
  /// An organization such as a public health agency, community/social services provider, etc.
  case agency
  
  /// An organization providing research-related services such as conducting research, recruiting research
  /// participants, analyzing data, etc.
  case research
  
  /// An organization providing reimbursement, payment, or related services
  case payer
  
  /// An organization providing diagnostic testing/laboratory services
  case diagnostics
  
  /// An organization that provides medical supplies (e.g. medical devices, equipment, pharmaceutical products, etc.)
  case supplier
  
  /// An organization that facilitates electronic clinical data exchange between entities
  case HIEHIO = "HIE/HIO"
  
  /// A type of non-ownership relationship between entities (encompasses partnerships, collaboration, joint ventures,
  /// etc.)
  case member
}
