//
//  RickAndMortyPrototcol.swift
//  Rick and Morty API - MVVM - Swift UI
//
//  Created by Victor Garitskyu on 23.08.2022.
//

import Foundation
import Combine

protocol RickAndMortyService {
    func getAllCharacters() -> AnyPublisher<Characters,Error>
}
