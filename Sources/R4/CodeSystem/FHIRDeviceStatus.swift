//
//  FHIRDeviceStatus.swift
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
 The availability status of the device.
 
 URL: http://hl7.org/fhir/device-status
 ValueSet: http://hl7.org/fhir/ValueSet/device-status
 */
public enum FHIRDeviceStatus: String, FHIRKitPrimitiveType {
  /// The device is available for use.  Note: For *implanted devices*  this means that the device is implanted in the
  /// patient.
  case active
  
  /// The device is no longer available for use (e.g. lost, expired, damaged).  Note: For *implanted devices*  this
  /// means that the device has been removed from the patient.
  case inactive
  
  /// The device was entered in error and voided.
  case enteredInError = "entered-in-error"
  
  /// The status of the device has not been determined.
  case unknown
}
