//
//  ContentView.swift
//  Sky
//
//  Created by Renan Silva on 16/10/23.
//

import SwiftUI

//https://ashishkakkad.com/2022/08/how-to-populate-json-response-in-swiftui-list/
//https://medium.com/@dicmandilan/how-do-you-resize-an-internet-image-fetched-using-a-url-in-swiftui-ios-development-bbd6d3c50a42
// https://www.themoviedb.org/talk/63c28a22df857c0089281174

var apiKey           = "?api_key=Minha_API_KEY"
var baseURL        = "https://api.themoviedb.org/3"
var endPoint      =  "/movie/popular"
var filmesLista = [Filmes] ()

var pessoa = [
        Pessoa(nome: "Renan 1"),
        Pessoa(nome: "Renan 2"),
        Pessoa(nome: "Renan 3"),
        Pessoa(nome: "Renan 4")
    ]

struct ContentView: View {
    
    @State var filmesLista = [Filmes] ()
    @ObservedObject var api = ApiHelper()
    
   // @State var filme: String = ""
    @State private var pessoa = [
            Pessoa(nome: "Renan 1"),
            Pessoa(nome: "Renan 2"),
            Pessoa(nome: "Renan 3"),
            Pessoa(nome: "Renan 4")
        ]

    var body: some View {
         mainStack()
    }
    
    func mainStack() ->some View {
        return ZStack(){
            VStack(alignment: .leading){
                vTexto()
                //vListaGrid()
                navegacao()
            }
        }
        .background(.black)
        .frame( maxWidth:  .infinity , maxHeight:  .infinity)
        
    }

    func vTexto() -> some View {
        return Text("Uma seleção de filmes imperdíveis")
            .foregroundStyle(.white)
            .padding(.leading, 10.0)
            .font(.system(size:  14))
    }
    
    func vListaImagem() -> some View {
        return VStack(){
                    Table(filmesLista){
                        TableColumn("Imagem"){ foto in
                            //AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(foto.posterPath)"))
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(foto.posterPath)")){ phase in
                                switch phase {
                                      case .empty:
                                          Image(systemName: "photo")
                                              .frame(width: 250, height: 250)
                                      case .success(let image):
                                          image.resizable()
                                              .aspectRatio(contentMode: .fit)
                                              .frame(maxWidth: 250, maxHeight: 250)
                                      case .failure:
                                          Image(systemName: "photo")
                                              .frame(width: 250, height: 250)
                                      @unknown default:
                                          EmptyView()
                                              .frame(width: 250, height: 250)
                                      }
                                  }.frame(width: 150, height: 150)
                        }
                        TableColumn("Nome" , value:  \.title)
                    }.onAppear(){
                        ApiHelper().loadData { (result) in
                            filmesLista = result.movies
                     }
             }
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
    
    func vLista() -> some View {
        return VStack(alignment: .leading){
            Table(filmesLista){
                TableColumn("Nome"){ titulo in
                    HStack{
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(titulo.posterPath)")){ phase in
                            switch phase {
                                  case .empty:
                                      Image(systemName: "photo")
                                          .frame(width: 100, height: 100)
                                  case .success(let image):
                                      image.resizable()
                                          .aspectRatio(contentMode: .fit)
                                          .frame(maxWidth: .infinity, maxHeight: 100)
                                  case .failure:
                                      Image(systemName: "photo")
                                          .frame(width: 100, height: 100)
                                  @unknown default:
                                      EmptyView()
                                    .frame(width: .infinity, height: 100)
                                  }
                              }
                               .frame(width: 100, height: 100)
                        
                        Text("\(titulo.title)") .frame(maxWidth:  .infinity)
                        
                    }.frame(maxWidth: .infinity)
                }
         }
            .onAppear(){
                ApiHelper().loadData { (result) in
                    filmesLista = result.movies
               }
       }
         
     }.frame(maxWidth: .infinity , maxHeight: .infinity)
        
    }
    
    func navegacao() -> some View {
            return NavigationView {
                
                        VStack {
                            
                         ScrollView {
                             
                             LazyVGrid(columns: [
                                 
                                 GridItem(.flexible(minimum:  100, maximum: 200)),
                                 GridItem(.flexible(minimum:  100, maximum: 200))
                                 
                             ], spacing:  12 , content: {
                                 
                                 ForEach(filmesLista){ filme in
                                     
                                     VStack(){
                                     
                                         NavigationLink(destination: Detalhe(idFilme: filme.id , urlFotoFilme: filme.posterPath , descricaoFilme: filme.overview, nomeFilme:  filme.title) ){
                                             
                                             VStack(alignment: .leading, spacing: 4.0){
                                                 AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(filme.posterPath)")){ phase in
                                                     switch phase {
                                                           case .empty:
                                                         Image(systemName: "photo")
                                                             .resizable()
                                                               .frame(width: 150, height: 200)
                                                           case .success(let image):
                                                               image.resizable()
                                                                   .aspectRatio(contentMode: .fit)
                                                                   .frame(width: .infinity, height: .infinity)
                                                           case .failure:
                                                               Image(systemName: "photo")
                                                               .frame(width: 150, height: 200)
                                                           @unknown default:
                                                               EmptyView()
                                                               .frame(width: 150, height: 200)
                                                           }
                                                 }.padding(.leading)
                                                  .frame(width: .infinity, height: .infinity)
                                                  .border(.black , width: 3)
                                                 
                                                 Text("\(filme.title)")
                                                     .font(.system(size: 10 , weight:  .semibold))
                                                     .fontWeight(.semibold)
                                                     .padding([.top, .trailing], 1.0)
                                                     .frame(maxWidth: .infinity, alignment: .center)
                                                     .foregroundColor(.white)
                                                     .lineLimit(1)
                                                 
                                             }.padding(4)
                                                 .onAppear(){
                                                     ApiHelper().loadData { (result) in
                                                         filmesLista = result.movies
                                                    }
                                                     
                                               }
                                             
                                         }.border(.black , width: 3)
                                         
                                     }.padding(.top, 1)
                                 }
                             }).padding(4)
                                 .onAppear(){
                                     ApiHelper().loadData { (result) in
                                         filmesLista = result.movies
                                    }
                                     
                               }
                             
                         }.background(.black)
                            
                     }
                
            }
        
    }
    
    func vListaGrid() -> some View {

        return ScrollView {
            
            LazyVGrid(columns: [
                
                GridItem(.flexible(minimum:  100, maximum: 200)),
                GridItem(.flexible(minimum:  100, maximum: 200))
                
            ], spacing:  12 , content: {
                
                ForEach(filmesLista){ filme in
                    
                    VStack(alignment: .leading, spacing: 4.0){
                    
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(filme.posterPath)")){ phase in
                            switch phase {
                                  case .empty:
                                Image(systemName: "photo")
                                    .resizable()
                                      .frame(width: 150, height: 200)
                                  case .success(let image):
                                      image.resizable()
                                          .aspectRatio(contentMode: .fit)
                                          .frame(width: 150, height: 200)
                                  case .failure:
                                      Image(systemName: "photo")
                                      .frame(width: 150, height: 200)
                                  @unknown default:
                                      EmptyView()
                                      .frame(width: 150, height: 200)
                                  }
                        }.padding(.leading) .frame(width: .infinity, height: 200)
                        
                        Text("\(filme.title)")
                            .font(.system(size: 10 , weight:  .semibold))
                            .fontWeight(.semibold)
                            .padding([.top, .trailing], 1.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        
                    }.padding(.top, 1).border(.white , width: 2)
                        .onTapGesture {
                            print("\(filme.title)")
                       }
                    
                }
            }).padding(4)
                .onAppear(){
                    ApiHelper().loadData { (result) in
                        filmesLista = result.movies
                   }
           }
            
         }
        
    }
    
}




func textoInicial() -> some View {
    return  Text("Uma seleção de filmes imperdíveis")
                 .foregroundStyle(.white)
                 .font(.system(size:  14))
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
