//
//  RickAndMortyViewModel.swift
//  Rick and Morty API - MVVM - Swift UI
//
//  Created by Victor Garitskyu on 23.08.2022.
//

import Foundation
import Combine

class RickAndMortyViewModel: ObservableObject{
    
    @Published var charactersState: CharacterViewModelState = CharacterViewModelState.initial
    
    let rickAndMortyDataService: RickAndMortyDataServices = RickAndMortyDataServices()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getAllCharacters()
    }
    
    func getAllCharacters(){
        charactersState = CharacterViewModelState.loading
        rickAndMortyDataService.getAllCharacters()
        
        .sink { [weak self] completion in
            switch completion {
            case .finished:
                print("finish")
            case .failure(let error):
                self?.charactersState=CharacterViewModelState.error(errorMessage: "\(error)")
            }
        } receiveValue: { [weak self] Characters in
            self?.charactersState = CharacterViewModelState.loaded(characters: Characters)
        }
        .store(in: &cancellable )
    }
}
