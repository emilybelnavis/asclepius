//
//  AddressUse.swift
//  Asclepius
//  Module: STU3
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
 The use of an address.
 
 URL: http://hl7.org/fhir/address-use
 ValueSet: http://hl7.org/fhir/ValueSet/address-use
 */
public enum AddressUse: String, AsclepiusPrimitiveType {
  /// A communication address at home
  case home
  
  /// An office address, typically first choice for business related contacts during business hours
  case work
  
  /// A temporary address
  case temp
  
  /// Address no longer in use (or never correct but retained for records)
  case old
  
  /// An address used for sending bills, invoices, receipts, etc...
  case billing
}
