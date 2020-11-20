//
//  ViewModifiersTest.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 10/11/2020.
//

import SwiftUI

struct ViewModifiersTest: View {
    
    @State private var showingAlert = false
    @State private var showingAction = false
    @State private var showCustomAlert = false
    
    @State private var backgroundColor = Color.white
    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                VStack(spacing: 15){
                    Button(action: {
                        self.showingAlert = true
                    }, label: {
                        HStack(spacing: 10) {
                            Image(systemName: "folder.fill").modifier(PrimaryLabel())
                            Text("Pulsa en el folder").modifier(PrimaryLabel())
                        }
                    }).alert(isPresented: self.$showingAlert, content: {
                        Utils().myAlertView(myTitle: "Alerta", myMessage: "Esta es una alerta")
                    }).buttonStyle(GenericCustomButtonStyle())
                    
                    
                    Button(action: {
                        self.showingAction = true
                    }, label: {
                        HStack(spacing: 10) {
                            Image(systemName: "play.fill").modifier(ThirdLabel())
                            Text("Pulsa en el folder").modifier(SecondLabel())
                        }
                    }).actionSheet(isPresented: self.$showingAction, content: {
                        Utils().myActionSheet(myTitle: "Action sheet", myMessage: "Hoja de opciones", myArray: [
                            .default(Text("Red")) { self.backgroundColor = Color.red },
                            .default(Text("gren")) { self.backgroundColor = Color.green },
                            .default(Text("blue")) { self.backgroundColor = Color.blue },
                            .cancel()
                        ])
                    }).buttonStyle(GenericCustomButtonStyle())
                    
                    Button(action: {
                        self.showCustomAlert.toggle()
                    }, label: {
                        HStack(spacing: 10) {
                            Image(systemName: "play").modifier(ThirdLabel())
                            Text("Pulsa en el play vacío").modifier(SecondLabel())
                        }
                    }).buttonStyle(GenericCustomButtonStyle())
                    
                }.animation(.spring())
                .blur(radius: showCustomAlert ? 30 : 0)
                
                if self.showCustomAlert {
                    CustomAlertView(showCustomAlert: self.$showCustomAlert,
                                    title: "Custom Title",
                                    message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                }
                 
            }.frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
        }
    }
    
}

struct ViewModifiersTest_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifiersTest().previewDevice("iPhone 11 Pro Max")
    }
}

struct CustomAlertView: View {
    
    @Binding var showCustomAlert: Bool
    var title: String
    var message: String
    
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Text(title).font(.title2)
                    Spacer()
                    Button(action: {
                        self.showCustomAlert.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(8)
                    })
                    .background(Color.gray)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                }.padding(8)
                .animation(.spring())
                
                VStack(spacing: 15){
                   
                    Text(message).font(.title2)
                }.padding(8)
            }
            
            
        }
        .frame(width: UIScreen.main.bounds.size.width - 40, height: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
    
    
}

//struct CustomAlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomAlertView(showCustomAlert: .constant(true), title: "", message: "").previewDevice("iPhone 11 Pro Max")
//    }
//}



