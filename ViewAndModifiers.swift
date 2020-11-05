//
//  ContentView.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/2020.
//

import SwiftUI

//Notas
//En swiftUI se construye una UI con VISTAS y luego se cambia esas vistas con los MODIFICADORES

struct ViewAndModifiers: View {
    var body: some View {
        VStack{
            Text("Views & Modifiers")
                .font(.largeTitle)
                .padding(.bottom, 5)
            
            Text("Concepts")
                .font(.title)
                .foregroundColor(.gray)
                .padding(.bottom, 5)
            
            Text("Contruir una UI en SwiftUI consiste en usaar vistas y modificadores. metodos tradicionales usados con controles y propiedades. Con SWiftUI, tu añads una vista y luego le asignas propiedades con modificadores")
                .font(.title)
                .background(Color.orange)
                .padding(.bottom, 5)
            
            Button(action: {}, label: {
                Text("Button with shadow")
            })
            .padding()
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.orange)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAndModifiers()
    }
}

//Notas
//En swiftUI se construye una UI con VISTAS y luego se cambia esas vistas con los MODIFICADORES
