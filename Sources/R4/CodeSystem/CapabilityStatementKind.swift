//
//  CapabilityStatementKind.swift
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
 How a capability statement is intended to be used.
 
 URL: http://hl7.org/fhir/capability-statement-kind
 ValueSet: http://hl7.org/fhir/ValueSet/capability-statement-kind
 */
public enum CapabilityStatementKind: String, FHIRKitPrimitiveType {
  /// The CapabilityStatement instance represents the present capabilities of a specific system instance.
  /// This is the kind returned by /metadata for a FHIR server end-point
  case instance
  
  /// The CapabilityStatement isntance represents the capabilities of a system of piece of software,
  /// independent of a particular installation.
  case capability
  
  /// The CapabilityStatement instance represents a set of requirements for other systems to meet;
  /// e.g. as part of an implementation guide of "request for proposal"
  case requirements
}
