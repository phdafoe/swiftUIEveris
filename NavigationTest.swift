//
//  NavigationTest.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//

import SwiftUI

struct NavigationTest: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                NavigationLink(
                    destination: SegundaVistaTest(name: "AQUI ANDRES"),
                    label: {
                        HStack{
                            Image(systemName: "plus")
                                .padding(5)
                                .background(Color.red)
                                .cornerRadius(5.0)
                            Text("Navegar a la Segunda vista")
                                .font(.title3)
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    }).foregroundColor(.white)
                
                Button(action: {
                    //Action
                }, label: {
                    HStack{
                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Muestra Modal")
                            .font(.title)
                            .foregroundColor(.white)
                    }.padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                })
            }
            .navigationBarTitle("everis", displayMode: .automatic)
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: SegundaVistaTest(name: "AQUI ALAN"),
                                        label: {
                                            HStack{
                                                Image(systemName: "plus")
                                                    .padding(5)
                                                    .background(Color.red)
                                                    .cornerRadius(5.0)
                                            }
                                            .padding()
                                        }).foregroundColor(.white)
                                    
            )
        }
        
    }
}

struct NavigationTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTest()
    }
}


struct SegundaVistaTest: View {
    
    var name : String
    
    var body: some View {
        Text("Segunda vista = \(name)")
    }
}
