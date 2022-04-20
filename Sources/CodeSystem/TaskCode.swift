//
//  TaskCode.swift
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
 Codes indicating the type of action that is expected to be performed
 
 URL: http://hl7.org/fhir/CodeSystem/task-code
 ValueSet: http://hl7.org/fhir/ValueSet/task-code
 */
public enum TaskCode: String, FHIRKitPrimitiveType {
  /// Take what actions are needed to transition the focus resource from 'draft' to 'active' or 'in-progress', as
  /// appropriate for the resource type.  This may involve additing additional content, approval, validation, etc.
  case approve
  
  /// Act to perform the actions defined in the focus request.  This might result in a 'more assertive' request (order
  /// for a plan or proposal, filler order for a placer order), but is intend to eventually result in events.  The
  /// degree of fulfillment requested might be limited by Task.restriction.
  case fulfill
  
  /// Abort, cancel or withdraw the focal resource, as appropriate for the type of resource.
  case abort
  
  /// Replace the focal resource with the specified input resource
  case replace
  
  /// Update the focal resource of the owning system to reflect the content specified as the Task.focus
  case change
  
  /// Transition the focal resource from 'active' or 'in-progress' to 'suspended'
  case suspend
  
  /// Transition the focal resource from 'suspended' to 'active' or 'in-progress' as appropriate for the resource
  /// type.
  case resume
}
