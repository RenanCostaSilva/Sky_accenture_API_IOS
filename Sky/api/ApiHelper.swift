//
//  ApiHelper.swift
//  Sky
//
//  Created by Renan Silva on 16/10/23.
//

import Foundation

class ApiHelper: ObservableObject{
    
    var apiKey           = "?api_key=4a41cd7bc92b603d034f1fa964940240"
    var baseURL        = "https://api.themoviedb.org/3"
    var endPoint      =  "/movie/popular"
    
    @Published var lista = [Filmes]()
    
    func loadData(completion:@escaping (MovieList) -> ()) {
            guard let url = URL(string: "\(baseURL)\(endPoint)\(apiKey)&language=en-US&page=1") else {
                print("Invalid url…")
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                let result = try! JSONDecoder().decode(MovieList.self, from: data!)
                self.lista = result.movies
                
                //print(result)
                result.movies.forEach{
                    item in print("foto: \(item.posterPath)")
                }
                
                DispatchQueue.main.async {
                    completion(result)
                }
                
            }.resume()
        }
    
    func loadDataSingle(completion:@escaping (Filmes) -> ()) {
            guard let url = URL(string: "\(baseURL)\(endPoint)\(apiKey)&language=en-US&page=1") else {
                print("Invalid url…")
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                let result = try! JSONDecoder().decode(Filmes.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(result)
                }
                
            }.resume()
        }
    
    func loadDataFilme(movieId: Int , completion:@escaping (FilmeDetalhe) -> ()) {
        
            let apiKey           = "?api_key=4a41cd7bc92b603d034f1fa964940240"
            let baseURL        = "https://api.themoviedb.org/3"
            let endPoint      =  "/movie/575264"
            //https://api.themoviedb.org/3/movie/575264?api_key=4a41cd7bc92b603d034f1fa964940240&language=en-US&append_to_response=release_dates
        
            guard let url = URL(string: "\(baseURL)\(endPoint)\(apiKey)&language=en-US&append_to_response=release_dates") else {
                print("Invalid url…")
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                let result = try! JSONDecoder().decode(FilmeDetalhe.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(result)
                }
                
            }.resume()
        }
    
}
