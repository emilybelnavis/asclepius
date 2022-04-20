//
//  NameUse.swift
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
 The use of a human name.
 
 URL: http://hl7.org/fhir/name-use
 ValueSet: http://hl7.org/fhir/ValueSet/name-use
 */
public enum NameUse: String, FHIRKitPrimitiveType {
  /// Known as/conventional/the one you normally use.
  case usual

  /// The formal name as registered in an official (government) registry, but which name might not be commonly used.
  /// May be called "legal name".
  case official
  
  /// A temporary name. Name.period can provide more detailed information. This may also be used for temporary names
  /// assigned at birth or in emergency situations.
  case temp
  
  /// A name that is used to address the person in an informal manner, but is not part of their formal or usual name.
  case nickname
  
  /// Anonymous assigned name, alias, or pseudonym (used to protect a person's identity for privacy reasons).
  case anonymous
  
  /// This name is no longer in use (or was never correct, but retained for records).
  case old
  
  /// A name used prior to changing name because of marriage. This name use is for use by applications that collect
  /// and store names that were used prior to a marriage. Marriage naming customs vary greatly around the world, and
  /// are constantly changing. This term is not gender specific. The use of this term does not imply any particular
  /// history for a person's name.
  case maiden
}
