//
//  DetailView.swift
//  CatalogoSwiftUI
//
//  Created by Salvador Gómez Moya on 22/06/23.
//

import SwiftUI

struct DetailView: View {
    
  
    
   var producto: Producto
   
    @State private var triggerNavigation = false
    
    
    var body: some View {
        let url = URL(string: producto.urlImagenes[0])
        VStack{
            AsyncImage(url: url, content: {
                image in
                image.resizable()
                    .scaledToFit()
                    .padding()
                    
            }, placeholder: {
                ProgressView()
            })
           
            Text(producto.nombre).font(.largeTitle)
            Text("$"+String(format: "%.2f$", "\(producto.precioFinal)")).font(.title)
            Text("Categoría:"+producto.codigoCategoria).font(.title)
            
                           
                        
           
            }
            
        }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(producto: Producto(codigoCategoria: "", id: "", nombre: "", precioFinal: 0.0, urlImagenes: []))
    }
}
