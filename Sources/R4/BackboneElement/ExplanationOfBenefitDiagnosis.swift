//
//  ExplanationOfBenefitDiagnosis.swift
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

/// Pertient diagnosis information; Information about diagnoses relevant to the claim item(s)
open class ExplanationOfBenefitDiagnosis: BackboneElement {
  /// Diagnosis instance identifier
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// nature of illness/problem
  public var diagnosis: ExplanationOfBenefitDiagnosisDiagnosisX
  
  /// timing/nature of diagnosis
  public var type: [CodeableConcept]?
  
  /// present on admission
  public var onAdmission: CodeableConcept?
  
  /// package billing code
  public var packageCode: CodeableConcept?
  
  // MARK: - Class Functions
}