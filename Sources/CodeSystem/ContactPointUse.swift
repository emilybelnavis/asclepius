//
//  ContactPointUse.swift
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
 Use of contact point.
 
 URL: http://hl7.org/fhir/contact-point-use
 ValueSet: http://hl7.org/fhir/ValueSet/contact-point-use
 */
public enum ContactPointUse: String, FHIRKitPrimitiveType {
  /// A communication contact point at a home; attempted contacts for business purposes may intrude
  /// privacy and chances are one will contact family or other household members instead of the person
  /// one wishes to call. Typically used with urgent cases, or if no other contacts are available.
  case home
  
  /// An office contact point. First choice for business related contacts during business hours.
  case work
  
  /// A temporary contact point. The period can provide more detailed information.
  case temp
  
  /// This contact point is no longer in use (or was never correct, but retained for records)
  case old
  
  /// A telecommunication device that moves and stays with its owner. May have characteristics of all
  /// other use codes, suitable for urgent matters, not the first choice for routine business.
  case mobile
}
