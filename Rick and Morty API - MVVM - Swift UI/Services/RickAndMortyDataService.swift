//
//  RickAndMortyDataService.swift
//  Rick and Morty API - MVVM - Swift UI
//
//  Created by Victor Garitskyu on 23.08.2022.
//

import Foundation
import Combine

class RickAndMortyDataServices: RickAndMortyService{
    func getAllCharacters() -> AnyPublisher<Characters,Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map({$0.data})
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
