//
//  PokemonService.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 04/03/22.
//

import Foundation

struct PokemonType: Identifiable {
    var id = UUID()

    let name: String
    let url: String
}

protocol PokemonServiceProtocol {
    typealias TypeResult = Result<[PokemonType], Error>

    func fetchTypes(from url: URL, completion: @escaping (TypeResult) -> Void)
}

final class PokemonService {
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    private let network: PokemonAPIProtocol

    init(network: PokemonAPIProtocol) {
        self.network = network
    }
}

extension PokemonService: PokemonServiceProtocol {
    func fetchTypes(from url: URL, completion: @escaping (TypeResult) -> Void) {
        network.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success((data, response)):
                completion(PokemonService.map(data, from: response))
            case .failure:
                print("Handle Error")
            }
        }
    }

    private static func map(_ data: Data, from response: HTTPURLResponse) -> PokemonServiceProtocol.TypeResult {
        do {
            let items = try TypeMapper.map(data, from: response)
            return .success(items.toModels())
        } catch {
            return .failure(error)
        }
    }
}

private extension Array where Element == TypeResponse {
    func toModels() -> [PokemonType] {
        map { PokemonType(name: $0.name, url: $0.url) }
    }
}
