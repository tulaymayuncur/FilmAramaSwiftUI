//
//  ImageDownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Tülay MAYUNCUR on 27.09.2022.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var indirilenGorsel : Data?
    
    func gorselIndir(url: String){
        
        guard let imageUrl = URL(string: url) else{
            
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl){ (data,response, error) in
            
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                
                self.indirilenGorsel = data

            }
        
            
        }.resume()
    
    }

}
