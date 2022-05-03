//
//  UDIEntryType.swift
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
 Codes to identify how UDI data was entered.
 
 URL: http://hl7.org/fhir/udi-entry-type
 ValueSet: http://hl7.org/fhir/ValueSet/udi-entry-type
 */
public enum UDIEntryType: String, FHIRKitPrimitiveType {
  /// a barcode scanner captured the data from the device label.
  case barcode
  
  /// An RFID chip reader captured the data from the device label.
  case rfid
  
  /// The data was read from the label by a person and manually entered. (e.g.  via a keyboard).
  case manual
  
  /// The data originated from a patient's implant card and was read by an operator.
  case card
  
  /// The data originated from a patient source and was not directly scanned or read from a label or card.
  case selfReported = "self-reported"
  
  /// The method of data capture has not been determined.
  case unknown
}
