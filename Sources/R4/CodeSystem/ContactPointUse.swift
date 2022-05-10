//
//  ContactPointUse.swift
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

/**
 Use of contact point.
 
 URL: http://hl7.org/fhir/contact-point-use
 ValueSet: http://hl7.org/fhir/ValueSet/contact-point-use
 */
public enum ContactPointUse: String, AsclepiusPrimitiveType {
  /// A communication contact point at a home; attempted contacts for business purposes may intrude
  /// privacy and chances are one will contact family or other household members instead of the person
  /// one wishes to call. Typically used with urgent cases, or if no other contacts are available.
  case home
  
  /// An office contact point. First choice for business related contacts during business hours.
  case work
  
  /// A temporary contact point. The period can provide more detailed information.
  case temp
  
  /// This contact point is no longer in use (or was never correct, but retained for records)
  case old
  
  /// A telecommunication device that moves and stays with its owner. May have characteristics of all
  /// other use codes, suitable for urgent matters, not the first choice for routine business.
  case mobile
}
