//
//  Detalhe.swift
//  Sky
//
//  Created by Renan Silva on 18/10/23.
//

import SwiftUI

struct Detalhe: View {
    
    @State var idFilme: Int
    @State var urlFotoFilme: String
    @State var descricaoFilme: String
    @State var nomeFilme: String
    
    var body: some View {
        mainStack()
    }
    
    func mainStack() ->some View {
        	
        return	ZStack(alignment: .top) {
            
            //AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/NNxYkU70HPurnNCSiCjYAmacwm.jpg"))
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(urlFotoFilme)")) { image in
                 image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                  .overlay(
                    HStack(alignment: .bottom) {
                        VStack{
                            Text("\(nomeFilme)").foregroundColor(.black).padding(4).fontWeight( .bold)
                            Text("\(descricaoFilme)").foregroundColor(.black)
                        }
                    } .padding(8).background(.white).frame(width: .infinity , height: 200).cornerRadius(10)
                     
                  )
                
            } placeholder: {Image(systemName: "photo.fill") }
            
        }.frame(maxWidth: .infinity , maxHeight: .infinity).background(.black)
        
     }
    
    func vLista() -> some View {
        return VStack(){
            
               
        }.frame(maxWidth: .infinity , maxHeight: .infinity)
    }

    func carregarDados() -> some View{
        
        return  VStack(){
            
            //AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(urlFotoFilme)"))
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/geEjCGfdmRAA1skBPwojcdvnZ8A.jpg")) { image in
                 image
                    .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: .infinity, height: .infinity)
                  .border(.blue)
                  .overlay(
                        Text("shajdahsjhdjahsjhdjkahjkdhasjhd sdhajks a sdgahsghjdgahsghdg ahsgdhgashgdhjasg hsag hgshd gshd gjhsgdhgs hhgs ahs haghagshdgshgdahhj")
                         .padding(4)
                  )
                
            } placeholder: {Image(systemName: "photo.fill") }
            
        }.background(.red).frame(width: .infinity, height: .infinity)
        
    }
    
}


struct Detalhe_Previews: PreviewProvider {
    static var previews: some View {
        Detalhe(idFilme: 0, urlFotoFilme: "" , descricaoFilme: "" , nomeFilme:  "")
    }
}
