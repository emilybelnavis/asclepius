//
//  AccountStatus.swift
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

/**
 Indicates whether the account is available to be used.
 
 URL: http://hl7.org/fhir/account-status
 ValueSet: http://hl7.org/fhir/ValueSet/account-status
 */
public enum AccountStatus: String, FHIRKitPrimitiveType {
  /// This account is active and may be used
  case active
  
  /// This account is inactive and should not be used to track financial information
  case inactive
  
  /// This instance should not have been part of this patient's medical record
  case enteredInError = "entered-in-error"
  
  /// This account is on hold
  case onHold = "on-hold"

  /// The account status is unknown
  case unknown
}