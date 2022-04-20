//
//  FHIRRestfulInteractions.swift
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
 The set of interactions defined by the RESTful part of the FHIR specification.
 
 URL: http://hl7.org/fhir/restful-interaction
 ValueSet: http://hl7.org/fhir/ValueSet/restful-interaction
 */
public enum FHIRRestfulInteractions: String, FHIRKitPrimitiveType {
  /// Read the current state of the resource.
  case read
  
  /// Read the state of a specific version of the resource.
  case vread
  
  /// Update an existing resource by its id (or create it if it is new).
  case update
  
  /// Update an existing resource by posting a set of changes to it.
  case patch
  
  /// Delete a resource.
  case delete
  
  /// Retrieve the change history for a particular resource, type of resource, or the entire system.
  case history
  
  /// Retrieve the change history for a particular resource.
  case historyInstance = "history-instance"
  
  /// Retrieve the change history for all resources of a particular type.
  case historyType = "history-type"
  
  /// Retrieve the change history for all resources on a system.
  case historySystem = "history-system"
  
  /// Create a new resource with a server assigned id.
  case create
  
  /// Search a resource type or all resources based on some filter criteria.
  case search
  
  /// Search all resources of the specified type based on some filter criteria.
  case searchType = "search-type"
  
  /// Search all resources based on some filter criteria.
  case searchSystem = "search-system"
  
  /// Get a Capability Statement for the system.
  case capabilities
  
  /// Update, create or delete a set of resources as a single transaction.
  case transaction
  
  /// perform a set of a separate interactions in a single http operation
  case batch
  
  /// Perform an operation as defined by an OperationDefinition.
  case operation
}
