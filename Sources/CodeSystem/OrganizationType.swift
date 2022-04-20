//
//  OrganizationType.swift
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
 This example value set defines a set of codes that can be used to indicate a type of organization.
 
 URL: http://terminology.hl7.org/CodeSystem/organization-type
 ValueSet: http://hl7.org/fhir/ValueSet/organization-type
 */
public enum OrganizationType: String, FHIRKitPrimitiveType {
  /// An organization that provides healthcare services.
  case prov
  
  /// A department or ward within a hospital (Generally is not applicable to top level organizations)
  case dept
  
  /// An organizational team is usually a grouping of practitioners that perform a specific function within an
  /// organization (which could be a top level organization, or a department).
  case team
  
  /// A political body, often used when including organization records for government bodies such as a Federal
  /// Government, State or Local Government.
  case govt
  
  /// A company that provides insurance to its subscribers that may include healthcare related policies.
  case ins
  
  /// A company, charity, or governmental organization, which processes claims and/or issues payments to providers on
  /// behalf of patients or groups of patients.
  case pay
  
  /// An educational institution that provides education or research facilities.
  case edu
  
  /// An organization that is identified as a part of a religious institution.
  case reli
  
  /// An organization that is identified as a Pharmaceutical/Clinical Research Sponsor.
  case crs
  
  /// An un-incorporated community group.
  case cg
  
  /// An organization that is a registered business or corporation but not identified by other types.
  case bus
  
  /// Other type of organization not already specified.
  case other
}
