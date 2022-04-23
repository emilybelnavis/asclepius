//
//  SurfaceCodes.swift
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
 This value set includes a smattering of FDI tooth surface codes.
 
 URL: http://terminology.hl7.org/CodeSystem/FDI-surface
 ValueSet: http://hl7.org/fhir/ValueSet/surface
 */
public enum SurfaceCodes: String, FHIRKitPrimitiveType {
  /// The surface of a tooth that is closest to the midline (middle) of the face.
  case M // swiftlint:disable:this identifier_name
  
  /// The chewing surface of posterior teeth.
  case O // swiftlint:disable:this identifier_name
  
  /// The biting edge of anterior teeth.
  case I // swiftlint:disable:this identifier_name
  
  /// The surface of a tooth that faces away from the midline of the face.
  case D // swiftlint:disable:this identifier_name
  
  /// The surface of a posterior tooth facing the cheeks.
  case B // swiftlint:disable:this identifier_name
  
  /// The surface of a tooth facing the lips.
  case V // swiftlint:disable:this identifier_name
  
  /// The surface of a tooth facing the tongue.
  case L // swiftlint:disable:this identifier_name
  
  /// The Mesioclusal surfaces of a tooth.
  case MO 
  
  /// The Distoclusal surfaces of a tooth.
  case DO
  
  /// The Distoincisal surfaces of a tooth.
  case DI
  
  /// The Mesioclusodistal surfaces of a tooth.
  case MOD
}
