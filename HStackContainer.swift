//
//  HStackContainer.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/2020.
//

import SwiftUI

struct HStackContainer: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 50, height: 200, alignment: .center)
                .cornerRadius(50)
                .shadow(radius: 10)
            
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 80, height: 200, alignment: .center)
                .cornerRadius(20)
                .shadow(radius: 5)
            
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 20, height: 200, alignment: .center)
                .cornerRadius(10)
                .shadow(radius: 3)
            
        })
        .padding()
        .border(Color.orange, width: 10)
        .cornerRadius(20)
    }
}

struct HStackContainer_Previews: PreviewProvider {
    static var previews: some View {
        HStackContainer()
    }
}


//Notas
//Esta es otra pila o Stack, esta puede organizar vistas horizontales, en swiftUI se llama HStack
