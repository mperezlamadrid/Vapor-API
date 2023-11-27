//
//  File.swift
//  
//
//  Created by Manuel Perez on 20/11/23.
//

import Fluent

struct CreateProducts: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("products")
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("price", .int, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("products").delete()
    }
}
