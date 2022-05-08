//
//  DeviceProperty.swift
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

import AlexandriaHRMCore
/**
 The actual configuration settings of a device as it actually operates (e.g. regulation status, time properties)
 */
open class DeviceProperty: BackboneElement {
  /// Code that specifies the property `DeviceDefinitionPropertyCode` (Extensible)
  public var type: CodeableConcept
  
  /// Property value as a quantity
  public var valueQuantity: [Quantity]?
  
  /// Property value as a code (e.g. NTP4 (synced to NTP))
  public var valueCode: [CodeableConcept]?
  
}
