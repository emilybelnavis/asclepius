//
//  Dosage.swift
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
 Indicates how the medication is/was taken or should be taken by the patient.
 */
open class Dosage: BackboneElement {
  /// All possible types for `asNeeded`
  public enum AsNeeded: Hashable {
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case codableConcept(CodableConcept)
  }
  
  /// The order of the dosage instructiions
  public var sequence: FHIRKitPrimitive<FHIRKitInteger>?
  
  /// Free text dosage instructions
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  /// Supplemental instructions or warnings to the patient
  public var additionalInstruction: [CodableConcept]?
  
  /// Patient or consumer oriented instructions
  public var patientInstruction: FHIRKitPrimitive<FHIRKitString>?
  
  /// When medication should be administered
  public var timing: Timing?
  
  /// Take "as needed"
  public var asNeeded: AsNeeded?
  
  /// Body site to administer to
  public var site: CodableConcept?
  
  /// How the drug should enter the body
  public var route: CodableConcept?
  
  /// Technique for adminstering medication
  public var method: CodableConcept?
  
  /// Amount of medication administered
  public var doseAndRate: [DosageDoseAndRate]?
  
  /// Upper limit on medication per unit of time
  public var maxDosePerPeriod: Ratio?
  
  /// Upper limit on medication per administration
  public var maxDosePerAdministration: Quantity?
  
  /// Upper limit on medication per lifetime of the patient
  public var maxDosePerLifetime: Quantity?
  
}
