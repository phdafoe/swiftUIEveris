//
//  ZStackContainer.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/2020.
//

import SwiftUI

struct ZStackContainer: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
            Rectangle()
                .foregroundColor(.orange)
                .cornerRadius(20)
                .frame(width: 150, height: 200, alignment: .trailing)
                .shadow(radius: 10)
            
            Rectangle()
                .offset(x: 20, y: 20)
                .foregroundColor(.orange)
                .cornerRadius(20)
                .frame(width: 150, height: 200, alignment: .trailing)
                .shadow(radius:10)

            Rectangle()
                .offset(x: 40, y: 40)
                .foregroundColor(.orange)
                .cornerRadius(20)
                .frame(width: 150, height: 200, alignment: .trailing)
                .shadow(radius:10)

            Rectangle()
                .offset(x: 60, y: 60)
                .foregroundColor(.orange)
                .cornerRadius(20)
                .frame(width: 150, height: 200, alignment: .trailing)
                .shadow(radius:10)
        })
        .padding()
        .border(Color.orange, width: 2)
        .cornerRadius(10)
    }
}

struct ZStackContainer_Previews: PreviewProvider {
    static var previews: some View {
        ZStackContainer()
    }
}


//Notas
//La Ultima vista Stack organizará las vistas una encima de la otra, se le llama Pila de profundidad o ZStack
// Es comun programar con cierta jerarquia de objetos tal como una relacion de padre - hijo
