//
//  DecodingError+Utils.swift
//  FHIRKit
//  Module: FHIRKitCore
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

public extension CodingKey {
    var fhirkit_keyPathRepresentation: String {
        if let intValue = intValue {
            return String(intValue)
        }
        return stringValue
    }
}

public extension DecodingError.Context {
    var fhirkit_keyPathRepresentation: String {
        return codingPath.map { $0.fhirkit_keyPathRepresentation }.joined(separator: ".")
    }
}

public extension DecodingError {
    var errorDescription: String? {
        switch self {
        case .typeMismatch(let dataType, let errorContext):
            return errorContext.fhirkit_keyPathRepresentation.appending(" [not \(dataType)]")
        case .dataCorrupted(let errorContext):
            if !errorContext.debugDescription.isEmpty {
                return errorContext.fhirkit_keyPathRepresentation.appending(" [\(errorContext.debugDescription)]")
            }
                return errorContext.fhirkit_keyPathRepresentation.appending(" [data corrupted]")
            
        case .keyNotFound(let keyName, let errorContext):
            return errorContext.fhirkit_keyPathRepresentation.appending(".\(keyName.fhirkit_keyPathRepresentation) [is missing]")
            
        case .valueNotFound(let dataType, let errorContext):
            return errorContext.fhirkit_keyPathRepresentation.appending(" [not found; \(dataType)]")
            
        @unknown default:
            return nil
        }
    }
}
