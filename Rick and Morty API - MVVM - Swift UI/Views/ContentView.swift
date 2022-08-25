//
//  ContentView.swift
//  Rick and Morty API - MVVM - Swift UI
//
//  Created by Victor Garitskyu on 23.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel:RickAndMortyViewModel = RickAndMortyViewModel()
    var body: some View {
        NavigationView{
            VStack{
                switch viewModel.charactersState{
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let data):
                    HStack{
                    ScrollView{
                        
                        ForEach(data.results) { results in
                          
                        HStack{
                            VStack(spacing: 0){
                                
                                AsyncImage(url: URL(string: results.image)) { image in
                                    image.resizable()
                                    Text(results.species)
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity,      maxHeight: 22)
                                        .background(.black)
                                } placeholder: {
                                    ProgressView()
                                }
                               
                            }
                                .frame(width: 90, height: 120)
                            HStack{
                              
                            }
                            VStack(alignment: .leading){
                                
                                Text(results.name)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                Spacer()
                                Text(results.gender)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)

                            }
                            .padding()

                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity,
                                   alignment: .leading)
                        }
                        .background(.green)
                        .mask(RoundedRectangle(cornerRadius: 16.0))
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                        .padding(4)
                      }
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    }
                    Spacer()
                        
                }
            }

            .navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
