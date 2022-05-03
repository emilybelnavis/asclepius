//
//  EncounterLocationStatus.swift
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
 The status of the location.
 
 URL: http://hl7.org/fhir/encounter-location-status
 ValueSet: http://hl7.org/fhir/ValueSet/encounter-location-status
 */
public enum EncounterLocationStatus: String, FHIRKitPrimitiveType {
  /// The patient is planned to be moved to this location at some point in the future.
  case planned
  
  /// The patient is currently at this location, or was between the period specified.
  ///
  /// A system may update these records when the patient leaves the location to either reserved, or completed.
  case active
  
  /// This location is held empty for this patient.
  case reserved
  
  /// The patient was at this location during the period specified.
  ///
  /// Not to be used when the patient is currently at the location.
  case completed
}
