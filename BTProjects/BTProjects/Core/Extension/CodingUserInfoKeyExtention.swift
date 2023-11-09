//
//  CodingUserInfoKeyExtention.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import Foundation

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

enum DecoderConfigurationError: Error {
    case missingManagedObjectContext
}
