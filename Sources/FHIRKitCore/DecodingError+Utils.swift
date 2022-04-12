//
//  DecodingError+Utils.swift
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
