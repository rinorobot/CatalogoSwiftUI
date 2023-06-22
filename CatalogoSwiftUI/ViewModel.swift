//
//  ViewModel.swift
//  CatalogoSwiftUI
//
//  Created by Salvador Gómez Moya on 22/06/23.
//

import Foundation
import SwiftUI


struct DataCatalog: Hashable, Codable{
    let advertencia: String
    let codigo: String
    let folio: String
    let mensaje: String
    var resultado: Resultado
    
    
}

struct Resultado: Hashable, Codable{
    let categoria: String
    let paginacion: Paginacion
    var productos: [Producto]
}

struct Paginacion: Hashable, Codable{
    let pagina: Int
    let totalPaginas: Int
    let totalRegistros: Int
    let totalRegistrosPorPagina: Int
}

struct Producto: Hashable, Codable{

    let codigoCategoria: String

    let id: String

    var nombre: String

    let precioFinal: Double

    let urlImagenes: [String]
}





class ViewModel: ObservableObject{
    
    @Published  var catalog = DataCatalog(advertencia: "", codigo: "", folio: "", mensaje: "", resultado: Resultado(categoria: "", paginacion: Paginacion(pagina: 0, totalPaginas: 0, totalRegistros: 0, totalRegistrosPorPagina: 0), productos: [Producto]()))
    
    func fetch(){
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a") else{
            return
        }
                
                let task = URLSession.shared.dataTask(with: url){[weak self]
                    data, _, error in
                    guard let data = data, error == nil else{
                        return
                    }
                    
                    do{
                        let catalogoURL = try JSONDecoder().decode(DataCatalog.self, from: data)
                        DispatchQueue.main.async {
                            self?.catalog = catalogoURL
                        }
                        
                    }
                    catch{
                        print(error)
                    }
                    
                }
        task.resume()
                
    }
    
   
}
