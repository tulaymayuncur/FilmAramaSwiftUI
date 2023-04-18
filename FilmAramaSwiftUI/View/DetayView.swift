//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Tülay MAYUNCUR on 27.09.2022.
//

import SwiftUI

struct DetayView : View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 5){
            
            HStack{
                
                Spacer()
                
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center).padding()
                
                Spacer()
                
            }
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film İsmi Gösterilecek").foregroundColor(Color(hue: 0.649, saturation: 0.82, brightness: 0.461)).bold().font(.title2).padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu gösterilecek").italic().padding()
            
            Text("Yıl:  \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")").padding()
            
            Text("Yönetmen:  \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
            
            Text("Yazar:  \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
            
            Text("Ödüller:  \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
            
            
            
            Spacer()
            
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        
        DetayView(imdbId: "detay")
    }
}
