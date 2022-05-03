//
//  ResourceValidationMode.swift
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
 Codes indicating the type of validation to perform.
 
 URL: http://hl7.org/fhir/resource-validation-mode
 ValueSet: http://hl7.org/fhir/ValueSet/resource-validation-mode
 */
public enum ResourceValidationMode: String, FHIRKitPrimitiveType {
  /// The server checks the content, and then checks that the content would be acceptable as a create (e.g. that the
  /// content would not violate any uniqueness constraints).
  case create
  
  /// The server checks the content, and then checks that it would accept it as an update against the nominated
  /// specific resource (e.g. that there are no changes to immutable fields the server does not allow to change and
  /// checking version integrity if appropriate).
  case update
  
  /// The server ignores the content and checks that the nominated resource is allowed to be deleted (e.g. checking
  /// referential integrity rules).
  case delete
  
  /// The server checks an existing resource (must be nominated by id, not provided as a parameter) as valid against
  /// the nominated profile.
  case profile
}
