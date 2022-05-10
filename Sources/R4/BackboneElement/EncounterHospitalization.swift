//
//  EncounterHospitalization.swift
//  Asclepius
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

import AsclepiusCore

/// Details about the patient's admission to a healthcare service.
open class EncounterHospitalization: BackboneElement {
  /// Patient pre-admission identifier
  public var preAdmissionIdentifier: Identifier?
  
  /// Location/organization that patient arrived from before admission
  public var origin: Reference?
  
  /// Where the patient was admitted from (e.g., physician referral, transfer)
  public var admitSource: CodeableConcept?
  
  /// The type of hospital re-admission that has occurred (if any). If the value is absent, then this is not
  /// identified as a re-admission
  public var reAdmission: CodeableConcept?
  
  /// Diet preferences reported by the patient
  public var dietPreference: [CodeableConcept]?
  
  /// Special courtesies (VIP, board member)
  public var specialCourtesy: [CodeableConcept]?
  
  /// Special arrangements the patient needs (e.g., wheelchair, translator, stretcher, etc...)
  public var specialArrangement: [CodeableConcept]?
  
  /// Location/organization to which the patient is discharged
  public var destination: Reference?
  
  /// Category/kind of location after discharge
  public var dischargeDisposition: CodeableConcept?
  
}
