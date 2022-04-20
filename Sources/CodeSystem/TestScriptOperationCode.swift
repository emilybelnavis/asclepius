//
//  TestScriptOperationCode.swift
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
 This value set defines a set of codes that are used to indicate the supported operations of a testing engine or tool.
 
 URL: http://terminology.hl7.org/CodeSystem/testscript-operation-codes
 ValueSet: http://hl7.org/fhir/ValueSet/testscript-operation-codes
 */
public enum TestScriptOperationCode: String, FHIRKitPrimitiveType {
  /// Read the current state of the resource.
  case read
  
  /// Read the state of a specific version of the resource.
  case vread
  
  /// Update an existing resource by its id.
  case update
  
  /// Update an existing resource by its id (or create it if it is new).
  case updateCreate
  
  /// Patch an existing resource by its id.
  case patch
  
  /// Delete a resource.
  case delete
  
  /// Conditionally delete a single resource based on search parameters.
  case deleteCondSingle
  
  /// Conditionally delete one or more resources based on search parameters.
  case deleteCondMultiple
  
  /// Retrieve the change history for a particular resource or resource type.
  case history
  
  /// Create a new resource with a server assigned id.
  case create
  
  /// Search based on some filter criteria.
  case search
  
  /// Update, create or delete a set of resources as independent actions.
  case batch
  
  /// Update, create or delete a set of resources as a single transaction.
  case transaction
  
  /// Get a capability statement for the system.
  case capabilities
  
  /// Realizes an ActivityDefinition in a specific context
  case apply
  
  /// Closure Table Maintenance
  case closure
  
  /// Finding Codes based on supplied properties
  case findMatches = "find-matches"
  
  /// Compare two systems CapabilityStatements
  case conforms
  
  /// Aggregates and returns the parameters and data requirements for a resource and all its dependencies as a single
  /// module definition
  case dataRequirements = "data-requirements"

  /// Generate a Document
  case document

  /// Request clinical decision support guidance based on a specific decision support module
  case evaluate
  
  /// Invoke an eMeasure and obtain the results
  case evaluateMeasure = "evaluate-measure"
  
  /// Return all the related information as described in the Encounter or Patient
  case everything
  
  /// Value Set Expansion
  case expand
  
  /// Find a functional list
  case find
  
  /// Invoke a GraphQL query
  case graphql
  
  /// Test if a server implements a client's required operations
  case implements
  
  /// Last N Observations Query
  case lastn
  
  /// Concept Look Up and Decomposition
  case lookup
  
  /// Find patient matches using MPI based logic
  case match
  
  /// Access a list of profiles, tags, and security labels
  case meta
  
  /// Add profiles, tags, and security labels to a resource
  case metaAdd = "meta-add"
  
  /// Delete profiles, tags, and security labels for a resource
  case metaDelete = "meta-delete"
  
  /// Populate Questionnaire
  case populate
  
  /// Generate HTML for Questionnaire
  case populatehtml
  
  /// Generate a link to a Questionnaire completion webpage
  case populatelink
  
  /// Process a message according to the defined event
  case processMessage = "process-message"
  
  /// Build Questionnaire
  case questionnaire
  
  /// Observation Statistics
  case stats
  
  /// Fetch a subset of the CapabilityStatement resource
  case subset
  
  /// CodeSystem Subsumption Testing
  case subsumes
  
  /// Model Instance Transformation
  case transform
  
  /// Concept Translation
  case translate
  
  /// Validate a resource
  case validate
  
  /// ValueSet based Validation
  case validateCode = "validate-code"
}
