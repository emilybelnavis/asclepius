//
//  ExplanationOfBenefitProcedure.swift
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

/// Clinical procedures performed on the patient relevant to the billing items with the claim
open class ExplanationOfBenefitProcedure: BackboneElement {
  /// procedure instance identifier
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// category of procedure
  public var type: [CodeableConcept]?
  
  /// when the procedure was performed
  public var date: AsclepiusPrimitive<AsclepiusDateTime>
  
  /// specific clinical procedure
  public var procedure: ExplanationOfBenefitProcedureX
  
  /// unique device identifier
  public var udi: [Reference]?
  
}
