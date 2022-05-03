//
//  MedicationKnowledgeCharacteristicCodes.swift
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
 MedicationKnowledge Characteristic Codes
 
 URL: http://terminology.hl7.org/CodeSystem/medicationknowledge-characteristic
 ValueSet: http://hl7.org/fhir/ValueSet/medicationknowledge-characteristic
 */
public enum MedicationKnowledgeCharacteristicCodes: String, FHIRKitPrimitiveType {
  /// Identyifying marks on product
  case imprintcd
  
  /// Description of size of the product
  case size
  
  /// Description of the shape of the product
  case shape
  
  /// Description of the color of the product
  case color
  
  /// Description of the coating of the product
  case coating
  
  /// Description of the scoring of the product
  case scoring
  
  /// Description of the Logo of the product
  case logo
}
