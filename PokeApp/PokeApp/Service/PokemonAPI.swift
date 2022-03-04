//
//  PokemonAPI.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 04/03/22.
//

import Foundation
import SwiftUI

protocol PokemonAPIProtocol {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping (Result) -> Void)
}

final class PokemonAPI {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension PokemonAPI: PokemonAPIProtocol {
    private struct UnexpectedValuesRepresentation: Error {}

    func get(from url: URL, completion: @escaping (PokemonAPIProtocol.Result) -> Void) {
        session.dataTask(with: url) { data, response, error in
            completion(
                Result {
                    if let error = error {
                        throw error
                    } else if let data = data, let response = response as? HTTPURLResponse {
                        return (data, response)
                    } else {
                        throw UnexpectedValuesRepresentation()
                    }
                }
            )
        }.resume()
    }
}
