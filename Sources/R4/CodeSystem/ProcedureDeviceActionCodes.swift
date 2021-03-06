//
//  ProcedureDeviceActionCodes.swift
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
 Example codes indicating the change that happened to the device during the procedure.  Note that these are in no way
 complete and might not even be appropriate for some uses.
 
 URL: http://hl7.org/fhir/device-action
 */
public enum ProcedureDeviceActionCodes: String, AsclepiusPrimitiveType {
  /// The device was implanted in the patient during the procedure.
  case implanted
  
  /// The device was explanted from the patient during the procedure.
  case explanted
  
  /// The device remains in the patient, but its location, settings, or functionality was changed.
  case manipulated
}
