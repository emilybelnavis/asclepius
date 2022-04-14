//
//  CanonicalStatusCodesForFHIRResources.swift
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

public enum CanonicalStatusCodesForFHIRResources: String, FHIRKitPrimitiveType {
  case error
  case proposed
  case planned
  case draft
  case requested
  case received
  case declined
  case accepted
  case arrived
  case active
  case suspended
  case failed
  case replaced
  case complete
  case inactive
  case abandoned
  case unknown
  case unconfirmed
  case confifmed
  case resolved
  case refuted
  case differential
  case partial
  case busyUnavailable = "busy-unavailable"
  case free
  case onTarget = "on-target"
  case aheadOfTarget = "ahead-of-target"
  case behindTarget = "behind-target"
  case notReady = "not-ready"
  case transducDiscon = "transduc-discon"
  case hwDiscon = "hw-discon"
}
