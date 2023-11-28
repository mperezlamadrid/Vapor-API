//
//  ProductController.swift
//  
//
//  Created by Manuel Perez on 20/11/23.
//

import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")
        products.get(use: index)
        products.post(use: create)
        products.put(use: update)
        products.group(":productID") { product in
            product.delete(use: delete)
        }
    }

    // GET Request /products route
    func index(req: Request) async throws -> [Product] {
        try await Product.query(on: req.db).all()
    }

    // POST Request /products route
    func create(req: Request) async throws -> Product {
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return product
    }
    
    // PUT Request /products route
    func update(req: Request) async throws -> HTTPStatus {
        let product = try req.content.decode(Product.self)
        
        guard let p = try await Product.find(product.id, on: req.db) else {
            throw Abort(.notFound)
        }
        
        p.name = product.name
        p.description = product.description
        p.price = product.price
        
        try await p.update(on: req.db)
        
        return .ok
    }

    // DELETE Request /products/{productID} route
    func delete(req: Request) async throws -> HTTPStatus {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await product.delete(on: req.db)
        return .noContent
    }
}
