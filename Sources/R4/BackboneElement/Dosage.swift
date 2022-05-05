//
//  Dosage.swift
//  FHIRKit
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import FHIRKitCore

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
