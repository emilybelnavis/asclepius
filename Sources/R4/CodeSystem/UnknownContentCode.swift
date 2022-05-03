//
//  UnknownContentCode.swift
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
 A code that indicates whether an application accepts unknown elements or extensions when reading resources.
 
 URL: http://hl7.org/fhir/unknown-content-code
 ValueSet: http://hl7.org/fhir/ValueSet/unknown-content-code
 */
public enum UnknownContentCode: String, FHIRKitPrimitiveType {
  /// The application does not accept either unknown elements or extensions.
  case no
  
  /// The application accepts unknown extensions, but not unknown elements.
  case extensions
  
  /// The application accepts unknown elements, but not unknown extensions.
  case elements
  
  /// The application accepts unknown elements and extensions.
  case both
}
