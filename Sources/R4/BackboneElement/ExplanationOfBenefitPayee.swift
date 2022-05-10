//
//  ExplanationOfBenefitPayee.swift
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

/// Recipient of benefits payable; The party to be reimbursed for the cost of the product(s)/service(s) according
/// to the terms of the policy
open class ExplanationOfBenefitPayee: BackboneElement {
  /// Category of recipient
  public var type: CodeableConcept?
  
  /// Recipient reference
  public var party: Reference?
  
  // MARK: - Class Functions
}
