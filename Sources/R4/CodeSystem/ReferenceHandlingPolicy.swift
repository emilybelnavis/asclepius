//
//  ReferenceHandlingPolicy.swift
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
 A set of flags that defines how references are supported.
 
 URL: http://hl7.org/fhir/reference-handling-policy
 ValueSet: http://hl7.org/fhir/ValueSet/reference-handling-policy
 */
public enum ReferenceHandlingPolicy: String, FHIRKitPrimitiveType {
  /// The server supports and populates Literal references (i.e. using Reference.reference) where they are known (this
  /// code does not guarantee that all references are literal; see 'enforced').
  case literal
  
  /// The server allows logical references (i.e. using Reference.identifier).
  case logical
  
  /// The server will attempt to resolve logical references to literal references - i.e. converting
  /// Reference.identifier to Reference.reference (if resolution fails, the server may still accept resources; see
  /// logical).
  case resolves
  
  /// The server enforces that references have integrity - e.g. it ensures that references can always be resolved.
  /// This is typically the case for clinical record systems, but often not the case for middleware/proxy systems.
  case enforced
  
  /// The server does not support references that point to other servers.
  case local
}
