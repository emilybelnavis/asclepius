//
//  DeviceUseStatementStatus.swift
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
 A coded concept indicating the current status of the Device Usage.
 
 URL: http://hl7.org/fhir/device-statement-status
 ValueSet: http://hl7.org/fhir/ValueSet/device-statement-status
 */
public enum DeviceUseStatementStatus: String, FHIRKitPrimitiveType {
  /// The device is still being used.
  case active
  
  /// The device is no longer being used.
  case completed
  
  /// The statement was recorded incorrectly.
  case enteredInError = "entered-in-error"
  
  /// The device may be used at some time in the future.
  case intended
  
  /// Actions implied by the statement have been permanently halted, before all of them occurred.
  case stopped
  
  /// Actions implied by the statement have been temporarily halted, but are expected to continue later. May also be
  /// called "suspended".
  case onHold = "on-hold"
}
