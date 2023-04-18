//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Tülay MAYUNCUR on 24.09.2022.
//

import Foundation


class DownloaderClient{
    
    func filmIndir(search: String, completion: @escaping
    
    (Result<[Film]?,DownloaderError>) -> Void) {
        
       guard let url = URL(string:
                            
            "https://www.omdbapi.com/?s=\(search)&apikey=5c9132b2") else{
            
        return completion(.failure(.yanlisUrl))

        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            guard let data = data, error == nil else{
                
                return completion(.failure(.veriGelmedi))
                
            }
            
            guard let filmCevabi = try? JSONDecoder( ).decode(GelenFilmler.self, from: data) else{
                
                return completion(.failure(.veriIslenemedi))
        }
            
            completion(.success(filmCevabi.filmler))
            
        }.resume()
    }
    
    
    func filmDetayiniIndir(imdbId: String, completion: @escaping
    
    (Result<FilmDetay,DownloaderError>) -> Void) {
        
       guard let url = URL(string:
                            
            "https://www.omdbapi.com/?i=\(imdbId)&apikey=5c9132b2") else{
            
        return completion(.failure(.yanlisUrl))

        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            guard let data = data, error == nil else{
                
                return completion(.failure(.veriGelmedi))
                
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data) else{
                return completion(.failure(.veriIslenemedi))
                
            }
        
            completion(.success(gelenFilmDetayi))
        
        }.resume()
    }
}

        

    
enum DownloaderError:  Error {
    
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
    
    
  }
    

