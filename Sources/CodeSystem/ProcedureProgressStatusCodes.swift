//
//  ProcedureProgressStatusCodes.swift
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
 This value set is provided as an example. The value set to instantiate this attribute should be drawn from a robust
 terminology code system that consists of or contains concepts to support the procedure performance process.
 
 URL: http://hl7.org/fhir/procedure-progress-status-code
 ValueSet: http://hl7.org/fhir/ValueSet/procedure-progress-status-codes
 */
public enum ProcedureProgressStatusCodes: String, FHIRKitPrimitiveType {
  /// A patient is in the Operating Room.
  case inOperatingRoom = "in-operating-room"
  
  /// The patient is prepared for a procedure.
  case prepared
  
  /// The patient is under anesthesia.
  case anesthesiaInduced = "anesthesia-induced"
  
  /// The patient has open incision(s).
  case openIncision = "open-incision"
  
  /// The patient has incision(s) closed.
  case closedIncision = "closed-incision"
  
  /// The patient is in the recovery room.
  case inRecoveryRoom = "in-recovery-room"
}
