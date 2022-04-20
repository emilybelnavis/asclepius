//
//  CompositionStatus.swift
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
 The workflow/clinical status of the composition.
 
 URL: http://hl7.org/fhir/composition-status
 ValueSet: http://hl7.org/fhir/ValueSet/composition-status
 */
public enum CompositionStatus: String, FHIRKitPrimitiveType {
  /// This is a preliminary composition or document (also known as initial or interim. The content
  /// may be incomplete or unverified
  case preliminary
  
  /// This version of the composition is complete and verified by an appropriate person and no further work
  /// is planned. Any subsequent updates would be on a new version of the composition
  case final
  
  /// The composition content or referenced resources have been modified (edited or added to) subsequent to
  /// being released as "final" and the composition is compelte and verified by an authorized person.
  case amended
  
  /// The composition or document was originally created/issued in error, and this is an amendment that
  /// marks that the entire series should not be considered as valid.
  case enteredInError
}
