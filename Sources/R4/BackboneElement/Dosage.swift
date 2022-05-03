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
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitInteger>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>? = nil,
    additionalInstruction: [CodableConcept]? = nil,
    patientInstruction: FHIRKitPrimitive<FHIRKitString>? = nil,
    timing: Timing? = nil,
    asNeeded: AsNeeded? = nil,
    site: CodableConcept? = nil,
    route: CodableConcept? = nil,
    method: CodableConcept? = nil,
    doseAndRate: [DosageDoseAndRate]? = nil,
    maxDosePerPeriod: Ratio? = nil,
    maxDosePerAdministration: Quantity? = nil,
    maxDosePerLifetime: Quantity? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.sequence = sequence
    self.text = text
    self.additionalInstruction = additionalInstruction
    self.patientInstruction = patientInstruction
    self.timing = timing
    self.asNeeded = asNeeded
    self.site = site
    self.route = route
    self.method = method
    self.doseAndRate = doseAndRate
    self.maxDosePerPeriod = maxDosePerPeriod
    self.maxDosePerAdministration = maxDosePerAdministration
    self.maxDosePerLifetime = maxDosePerLifetime
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case text; case _text
    case additionalInstruction
    case patientInstruction; case _patientInstruction
    case timing
    case asNeededBoolean; case _asNeededBoolean
    case asNeededCodableConcept
    case site
    case route
    case method
    case doseAndRate
    case maxDosePerPeriod
    case maxDosePerAdministration
    case maxDosePerLifetime
  }
}
