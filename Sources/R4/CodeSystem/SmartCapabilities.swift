//
//  SmartCapabilities.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 Codes that define what the server is capable of.
 
 URL: http://terminology.hl7.org/CodeSystem/smart-capabilities
 ValueSet: http://hl7.org/fhir/ValueSet/smart-capabilities
 */
public enum SmartCapabilities: String, FHIRKitPrimitiveType {
  /// support for SMART’s EHR Launch mode.
  case launchEhr = "launch-ehr"
  
  /// support for SMART’s Standalone Launch mode.
  case launchStandalone = "launch-standalone"
  
  /// support for SMART’s public client profile (no client authentication).
  case clientPublic = "client-public"
  
  /// support for SMART’s confidential client profile (symmetric client secret authentication).
  case clientConfidentialSymmetric = "client-confidential-symmetric"
  
  /// support for SMART’s OpenID Connect profile.
  case ssoOpenidConnect = "sso-openid-connect"
  
  /// support for “need patient banner” launch context (conveyed via need_patient_banner token parameter).
  case contextPassthroughBanner = "context-passthrough-banner"
  
  /// support for “SMART style URL” launch context (conveyed via smart_style_url token parameter).
  case contextPassthroughStyle = "context-passthrough-style"
  
  /// support for patient-level launch context (requested by launch/patient scope, conveyed via patient token
  /// parameter).
  case contextEhrPatient = "context-ehr-patient"
  
  /// support for encounter-level launch context (requested by launch/encounter scope, conveyed via encounter token
  /// parameter).
  case contextEhrEncounter = "context-ehr-encounter"
  
  /// support for patient-level launch context (requested by launch/patient scope, conveyed via patient token
  /// parameter).
  case contextStandalonePatient = "context-standalone-patient"
  
  /// support for encounter-level launch context (requested by launch/encounter scope, conveyed via encounter token
  /// parameter).
  case contextStandaloneEncounter = "context-standalone-encounter"
  
  /// support for refresh tokens (requested by offline_access scope).
  case permissionOffline = "permission-offline"
  
  /// support for patient-level scopes (e.g. patient/Observation.read).
  case permissionPatient = "permission-patient"
  
  /// support for user-level scopes (e.g. user/Appointment.read).
  case permissionUser = "permission-user"
}
