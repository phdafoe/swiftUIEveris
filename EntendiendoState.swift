//
//  EntendiendoState.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//

import SwiftUI

struct EntendiendoState: View {
    
    @State private var nombre = "Pedro"
    @State private var value1 = 10 // la var ocupa mas espacio en memoria
    let value2 = 20
    let isChange = true
    
    var body: some View {
        VStack {
            Text(nombre)
            
            Button(action: {
                nombre = "Andres"
            }, label: {
                Text("Cambio de nombre")
            })
            
            Text("\(self.suma())")
            
            Button(action: {
                self.cambio()
            }, label: {
                Text("Cambio de numero")
            })
            
        }.padding(15)
    }
    
    // MARK: - Private methods
    private func suma() -> Int {
        let resultado = value1 + value2
        return resultado
    }
    
    private func cambio()  {
        if isChange {
            value1 = 50
        }
    }
    
    
}

struct EntendiendoState_Previews: PreviewProvider {
    static var previews: some View {
        EntendiendoState()
    }
}
