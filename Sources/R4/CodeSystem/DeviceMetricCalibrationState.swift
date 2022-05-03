//
//  DeviceMetricCalibrartionState.swift
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
 Describes the state of a metric calibration.
 
 URL: http://hl7.org/fhir/metric-calibration-state
 ValueSet: http://hl7.org/fhir/ValueSet/metric-calibration-state
 */
public enum DeviceMetricCalibrationState: String, FHIRKitPrimitiveType {
  /// The metric has not been calibrated.
  case notCalibrated = "not-calibrated"
  
  /// The metric needs to be calibrated.
  case calibrationRequired = "calibration-required"
  
  /// The metric has been calibrated.
  case calibrated
  
  /// The state of calibration of this metric is unspecified.
  case unspecified
}
