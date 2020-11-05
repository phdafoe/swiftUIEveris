//
//  List+State.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//

import SwiftUI

struct List_State: View {
    
    @State private var amigosEveris : [AmigosEveris] = []
    @State private var isMyFriend = false
    
    var body: some View {
        VStack{
            ZStack{
                Text("Amigos de Everis")
                    .font(.title)
                HStack{
                    Button(action: {}, label: {
                        Image("Menu").renderingMode(.original)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                    }).padding(.trailing, 5)
                    
                    Button(action: {}, label: {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                }
            }.padding(15)
            
            VStack{
                 
                Toggle(isOn: self.$isMyFriend, label: {
                    Text("is my Friend")
                })
                
                List{
                    ForEach(self.amigosEveris.filter{ $0.isFriend == self.isMyFriend }) { amigo in
                        HStack{
                            Image(amigo.image)
                                .resizable()
                                .frame(width: 140, height: 140)
                            VStack(alignment: .leading){
                                Text(amigo.name)
                                    .font(.title)
                                    .bold()
                                Text(amigo.lastName)
                                    .font(.subheadline)
                            }
                        }.contextMenu(/*@START_MENU_TOKEN@*/ContextMenu(menuItems: {
                            Text("Menu Item 1")
                            Text("Menu Item 2")
                            Text("Menu Item 3")
                        })/*@END_MENU_TOKEN@*/)
                    }
                }
            }.padding(15)
            
            
        }.onAppear(perform: {
            self.addFriend()
        })
         
    }
    
    
    private func addFriend() {
        amigosEveris.append(AmigosEveris(name: "Andres", lastName: "Ocampo", image: "user1", isFriend: true))
        amigosEveris.append(AmigosEveris(name: "Felipe", lastName: "Eljaiek", image: "user2", isFriend: false))
        amigosEveris.append(AmigosEveris(name: "Paul", lastName: "Vargas", image: "user3", isFriend: true))
        amigosEveris.append(AmigosEveris(name: "Carlos", lastName: "García", image: "user4", isFriend: true))
    }
}

struct List_State_Previews: PreviewProvider {
    static var previews: some View {
        List_State()
    }
}

struct AmigosEveris: Identifiable {
    let id = UUID()
    let name: String
    let lastName: String
    let image: String
    let isFriend: Bool
}
