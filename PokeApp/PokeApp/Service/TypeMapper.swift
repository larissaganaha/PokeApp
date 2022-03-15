//
//  TypeMapper.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 04/03/22.
//

import Foundation

struct TypeResponse: Decodable {
    let name: String
    let url: String
}

struct TypeMapper {
    struct Types: Decodable {
        let count: Int
        let results: [TypeResponse]
    }

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [TypeResponse] {
        guard response.statusCode == 200,
              let decoded = try? JSONDecoder().decode(Types.self, from: data) else {
                  throw PokemonService.Error.invalidData
              }

        return decoded.results
    }
}
