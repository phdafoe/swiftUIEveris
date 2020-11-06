//
//  NavigationTest.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//

import SwiftUI

struct NavigationTest: View {
    
    @State private var isLinkActive = false
    @State private var isModal = false
    @State private var isModalFullScreen = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                
                NavigationLink(
                    destination: SegundaVistaTest(name: "AQUI ANDRES"),
                    isActive: self.$isLinkActive,
                    label: {
                        Button(action: {
                            self.isLinkActive = true
                        }, label: {
                            HStack{
                                Image(systemName: "play.fill")
                                    .font(.title2)
                                Text("Navegar a la Segunda vista")
                                    .font(.title3)
                            }
                        }).buttonStyle(GenericCustomButtonStyle())
                })
                
                Button(action: {
                    self.isModal = true
                }, label: {
                    HStack{
                        Image(systemName: "play.fill")
                            .font(.title)
                        Text("Muestra Modal")
                            .font(.title)
                    }
                })
                .buttonStyle(GenericCustomButtonStyle())
                .sheet(isPresented: self.$isModal, content: {
                    TerceraVistaModalTest()
                })
                
                Button(action: {
                    self.isModalFullScreen = true
                }, label: {
                    HStack{
                        Image(systemName: "play.fill")
                            .font(.title)
                        Text("Muestra Modal Full Screen")
                            .font(.title)
                    }
                })
                .buttonStyle(GenericCustomButtonStyle())
                .fullScreenCover(isPresented: self.$isModalFullScreen, content: {
                    TerceraVistaModalTest()
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

struct TerceraVistaModalTest: View {
    
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Butto para ocultar la Modal")
        }).buttonStyle(GenericCustomButtonStyle())
    }
}
