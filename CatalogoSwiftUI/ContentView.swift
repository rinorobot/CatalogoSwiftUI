//
//  ContentView.swift
//  CatalogoSwiftUI
//
//  Created by Salvador Gómez Moya on 22/06/23.
//

import SwiftUI





struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        
        NavigationView{
            List{
                ForEach(viewModel.catalog.resultado.productos, id: \.self){
                    product in
                    let url = URL(string: product.urlImagenes[0])
                    NavigationLink(destination: DetailView(producto: product)){
                        HStack{
                            AsyncImage(url: url, content: {
                                image in
                                image.resizable()
                                    .scaledToFit()
                                    .padding()
                                    
                            }, placeholder: {
                                ProgressView()
                            })
                            
                            Text(product.nombre)
                                .bold()
                        }
                    }
                    
                }.onAppear{
                    viewModel.fetch()
                }
                
                
                
            }
            
            .onAppear{
                viewModel.fetch()
            }
            
        }
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
