//
//  IdentifierUsee.swift
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
 Identifies the purpose for this identifier, if known .
 
 URL: http://hl7.org/fhir/identifier-use
 ValueSet: http://hl7.org/fhir/ValueSet/identifier-use
 */
public enum IdentifierUse: String, FHIRKitPrimitiveType {
  /// The identifier recommended for display and use in real-world interactions.
  case usual
  
  /// The identifier considered to be most trusted for the identification of this item. Sometimes also known as
  /// "primary" and "main". The determination of "official" is subjective and implementation guides often provide
  /// additional guidelines for use.
  case official
  
  /// A temporary identifier.
  case temp
  
    /// An identifier that was assigned in secondary use - it serves to identify the object in a relative context, but
    /// cannot be consistently assigned to the same object again in a different context.
  case secondary
  
    /// The identifier id no longer considered valid, but may be relevant for search purposes.  E.g. Changes to
    /// identifier schemes, account merges, etc.
  case old
}
