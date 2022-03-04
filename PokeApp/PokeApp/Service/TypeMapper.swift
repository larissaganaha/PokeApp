//
//  TypeMapper.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 04/03/22.
//

import Foundation

struct TypeResponse: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

struct TypeMapper {

    private struct Types: Decodable {
        let items: [TypeResponse]
    }

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [TypeResponse] {
        guard response.statusCode == 200,
              let decoded = try? JSONDecoder().decode(Types.self, from: data) else {
                  throw PokemonService.Error.invalidData
              }

        return decoded.items
    }
}
