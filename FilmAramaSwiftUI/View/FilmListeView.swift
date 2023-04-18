//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Tülay MAYUNCUR on 24.09.2022.
//

import SwiftUI

struct FilmListeView: View {
    
   @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    @State var aranacakFilm = " "
    
    init(){
        
        self.filmListeViewModel = FilmListeViewModel( )
        
                
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack{
            
            TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged:{ _ in }, onCommit:{
                
                self.filmListeViewModel
                    .filmAramasiYap(filmIsmi:aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                
            }).padding().textFieldStyle(RoundedBorderTextFieldStyle()).background(Color(hue: 0.55, saturation: 0.33, brightness: 0.976))
            
           
            
        List(filmListeViewModel.filmler, id: \.imdbId) { film in
            
            NavigationLink(destination: DetayView(imdbId: film.imdbId),
                           
                label: {
                
                HStack(){
                
                OzelImage(url: film.poster)
                    .frame(width: 120, height: 150, alignment: .center)
               
                
                VStack(alignment: .leading){
                    
                    Text(film.title)
                        .font(.title3).bold()
                        .foregroundColor(.brown)
                    
                    Text(film.year)
                        .foregroundColor(Color(hue: 0.596, saturation: 0.804, brightness: 0.673))
                        
                      }
                    }
                 })
            
              }.navigationTitle(Text("Dizi&Film Imdb"))
           }
         }
       }
    }
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        FilmListeView()
            
        
    }
 }

