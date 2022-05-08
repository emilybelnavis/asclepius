//
//  DeviceDefinitionParameterGroup.swift
//  AlexandriaHRM
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
 Codes identifying groupings of parameters; e.g. Cardiovascular.
 
 URL: http://terminology.hl7.org/CodeSystem/parameter-group
 ValueSet: http://hl7.org/fhir/ValueSet/parameter-group
 */
public enum DeviceDefinitionParameterGroup: String, AlexandriaHRMPrimitiveType {
  /// Haemodynamic Parameter Group - MDC_PGRP_HEMO.
  case haemodynamic
  
  /// ECG Parameter Group - MDC_PGRP_ECG.
  case ecg
  
  /// Respiratory Parameter Group - MDC_PGRP_RESP.
  case respiratory
  
  /// Ventilation Parameter Group - MDC_PGRP_VENT.
  case ventilation
  
  /// Neurological Parameter Group - MDC_PGRP_NEURO.
  case neurological
  
  /// Drug Delivery Parameter Group - MDC_PGRP_DRUG.
  case drugDelivery = "drug-delivery"
  
  /// Fluid Chemistry Parameter Group - MDC_PGRP_FLUID.
  case fluidChemistry = "fluid-chemistry"
  
  /// Blood Chemistry Parameter Group - MDC_PGRP_BLOOD_CHEM.
  case bloodChemistry = "blood-chemistry"
  
  /// Miscellaneous Parameter Group - MDC_PGRP_MISC.
  case miscellaneous
}
