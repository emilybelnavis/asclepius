//
//  GenderIdentity.swift
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
 This example value set defines a set of codes that can be used to indicate a patient's gender identity.
 
 URL: http://hl7.org/fhir/gender-identity
 */
public enum GenderIdentity: String, FHIRKitPrimitiveType {
  /// the patient identifies as transgender male-to-female
  case transgenderFemale = "transgender-female"
  
  /// the patient identifies as transgender female-to-male
  case transgenderMale = "transgender-male"
  
  /// the patient identifies with neither/both female and male
  case nonBinary = "non-binary"
  
  /// the patient identifies as male
  case male
  
  /// the patient identifies as female
  case female
  
  /// other gender identity
  case other
  
  /// the patient does not wish to disclose their gender identity
  case nonDisclose = "non-disclose"
}
