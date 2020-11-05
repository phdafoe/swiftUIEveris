//
//  VStackContainer.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/2020.
//

import SwiftUI

struct VStackContainer: View {
    var body: some View {
        VStack(spacing: 40){
        
           Rectangle()
            .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
            .foregroundColor(Color.orange)
            .cornerRadius(10)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            
            Rectangle()
             .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
             .foregroundColor(Color.orange)
             .cornerRadius(10)
             .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Rectangle()
             .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
             .foregroundColor(Color.orange)
             .cornerRadius(10)
             .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Rectangle()
             .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
             .foregroundColor(Color.orange)
             .cornerRadius(10)
             .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .border(Color.orange, width: 4)
        .cornerRadius(20)
        
    }
}

struct VStackContainer_Previews: PreviewProvider {
    static var previews: some View {
        VStackContainer()
    }
}

//Notas
//Las Vistas pueden organizarse en CONTENEDORES, algunos contenedores organizar las vistas en una direccion
//Esta es la vista VStack a su vez estas vista pueden modificarse con independencia una de la otra
