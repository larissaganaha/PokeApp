import SwiftUI

struct TypeModel: Identifiable {
    var id: Int

    let name: String
    let url: String
    let imageName: String
}

class TypeViewModel: ObservableObject {
    @Published var types: [PokemonType] = []
    private let service: PokemonServiceProtocol

    init(
        service: PokemonServiceProtocol = PokemonService(network: PokemonAPI())
    ) {
        self.service = service
    }

    func fetch() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/type") else { return }

        service.fetchTypes(from: url) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case let .success(types):
                    self.types = types
                case .failure:
                    print("ERROR")
                }
            }
        }
    }
}
