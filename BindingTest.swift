//
//  Binding.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//
import SwiftUI

class NumeroRandom: ObservableObject {
    
    @Published var numero = 0
    @Published var contador: Int = 0
    var timer = Timer()
    
    init() {
        //self.start()
    }
    
    func start(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.numero = Int.random(in: 0 ..< 5)
        })
    }
    
    func stop(){
        self.timer.invalidate()
    }
    
    func resetCounter(){
        self.contador = 0
    }
}



// MARK: - struct BindingTest:
struct BindingTest: View {
    
    //@ObservedObject private var viewModel = NumeroRandom()
    @EnvironmentObject var viewModel : NumeroRandom
    private var value = 3
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(self.viewModel.numero)")
                .font(.title)
                .bold()
            if self.viewModel.numero == self.value {
                Text("Correcto")
                    .font(.title2)
                    .foregroundColor(Color.green)
            } else {
                Text("Incorrecto")
                    .font(.title2)
                    .foregroundColor(Color.red)
            }
            
            HStack {
                
                Button(action: {
                    self.viewModel.stop()
                }, label: {
                    HStack{
                        Image(systemName: "folder.fill")
                            .foregroundColor(.white)
                        Text("Desactivar")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(8)
                })
                .background(Color.red)
                .cornerRadius(10)
                .shadow(radius: 10)
                                
                Button(action: {
                    self.viewModel.start()
                }, label: {
                    HStack{
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                        Text("Activar")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(8)
                })
                .background(Color.green)
                .cornerRadius(10)
                .shadow(radius: 10)
                
            }.padding(15)
            
            SegundaVista()
            TerceraVista()
            
        }
    }
}

struct BindingTest_Previews: PreviewProvider {
    static var previews: some View {
        BindingTest()
    }
}

struct SegundaVista: View {
    
    //@Binding var contador: Int
    @EnvironmentObject var viewModel : NumeroRandom
    
    var body: some View {
        VStack{
            Text("Segunda vista")
            Button(action: {
                self.viewModel.contador += 1
            }, label: {
                HStack{
                    Image(systemName: "play")
                        .foregroundColor(.white)
                    Text("Contador = \(self.viewModel.contador)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }.padding(.all)
            })
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct TerceraVista: View {
    
    @EnvironmentObject var viewModel : NumeroRandom
    
    var body: some View {
        VStack(spacing: 15){
            Text("Tercer Vista")
            Button(action: {
                self.viewModel.contador += 2
            }, label: {
                HStack{
                    Image(systemName: "play.fill")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Nuevo Contador = \(self.viewModel.contador)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }.padding(.all)
            })
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            Button(action: {
                self.viewModel.resetCounter()
            }, label: {
                HStack{
                    Image(systemName: "stop.fill")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Reiniciar Contador")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }.padding(.all)
            })
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}
