//
//  TestScriptProfileDestinationType.swift
//  AlexandriaHRM
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
 This value set defines a set of codes that are used to indicate the profile type of a test system when acting as the
 destination within a TestScript.
 
 URL: http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types
 ValueSet: http://hl7.org/fhir/ValueSet/testscript-profile-destination-types
 */
public enum TestScriptProfileDestinationType: String, AlexandriaHRMPrimitiveType {
  /// General FHIR server used to respond to operations sent from a FHIR client.
  case fHIRServer = "FHIR-Server"
  
  /// A FHIR server acting as a Structured Data Capture Form Manager.
  case fHIRSDCFormManager = "FHIR-SDC-FormManager"
  
  /// A FHIR server acting as a Structured Data Capture Form Processor.
  case fHIRSDCFormProcessor = "FHIR-SDC-FormProcessor"
  
  /// A FHIR server acting as a Structured Data Capture Form Receiver.
  case fHIRSDCFormReceiver = "FHIR-SDC-FormReceiver"
}
