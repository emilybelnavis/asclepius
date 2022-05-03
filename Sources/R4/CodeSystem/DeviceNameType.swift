//
//  DeviceNameType.swift
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
 The type of name the device is referred by.
 
 URL: http://hl7.org/fhir/device-nametype
 ValueSet: http://hl7.org/fhir/ValueSet/device-nametype
 */
public enum DeviceNameType: String, FHIRKitPrimitiveType {
  /// UDI Label name.
  case udiLabelName = "udi-label-name"
  
  /// User Friendly name.
  case userFriendlyName = "user-friendly-name"
  
  /// Patient Reported name.
  case patientReportedName = "patient-reported-name"
  
  /// Manufacturer name.
  case manufacturerName = "manufacturer-name"
  
  /// Model name.
  case modelName = "model-name"
  
  /// other.
  case other
}
