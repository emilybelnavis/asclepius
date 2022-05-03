//
//  ContactEntityType.swift
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
 This example value set defines a set of codes that can be used to indicate the purpose for which you would contact a
 contact party.
 
 URL: http://terminology.hl7.org/CodeSystem/contactentity-type
 ValueSet: http://hl7.org/fhir/ValueSet/contactentity-type
 */
public enum ContactEntityType: String, FHIRKitPrimitiveType {
  /// Contact details for information regarding to billing/general finance inquiries
  case BILL
  
  /// Contact details for administrative inquiries
  case ADMIN
  
  /// Contact details for issues related to Human Resources, such as staff matters, OH&S, etc...
  case HR
  
  /// Contact details for dealing with issues related to insurance claism/adjudication/payment
  case PAYOR
  
  /// Generic information contact for patients
  case PATINF
  
  /// Dedicated contact point for matters relating to press inquiries
  case PRESS
}
