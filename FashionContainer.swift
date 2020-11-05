//
//  FashionContainer.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 04/11/2020.
//

import SwiftUI

struct FashionContainer: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                ZStack{
                    Text("Seasons")
                        .font(.title)
                    HStack(spacing: 15){
                        Button(action: {
                            
                        }, label: {
                            Image("Menu").renderingMode(.original)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "magnifyingglass").foregroundColor(.black)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "alarm").foregroundColor(.black)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "cart").foregroundColor(.black)
                        })
                    }
                }
                .background(Color.white)
                .padding([.leading, .trailing, .top], 15)
                
                MainView()
                
                
            }.navigationBarHidden(true)
        }
    }
}

struct FashionContainer_Previews: PreviewProvider {
    static var previews: some View {
        FashionContainer().previewDevice("iPhone 11 Pro Max")
    }
}

struct MainView: View {
    
    @State var selected = "Dress"
    
    var body: some View {
        VStack(spacing: 15) {
            
            HStack{
                
                Button(action: {
                    
                }, label: {
                    
                    HStack{
                        Text("Casual Dress")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down").font(.title3)
                    }.padding()
                }).foregroundColor(.black)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding()
                }).foregroundColor(.black)
            }
            
            HStack{
                
                ForEach(types,id: \.self){ iValue in
                    HStack{
                        Button(action: {
                            
                            self.selected = iValue
                            
                        }) {
                            Text(iValue).padding()
                        }
                        .foregroundColor(self.selected == iValue ? .white : .black)
                        .background(self.selected == iValue ? Color.black : Color.clear)
                        .cornerRadius(10)
                        Spacer(minLength: 0)
                    }
                }
            }
            
            DetailScroll()
            
        }.padding()
        .background(Color.white)
        
    }
}


struct DetailScroll: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ForEach(datas) { iValue in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(iValue.myRows){ jValue in
                        NavigationLink(
                            destination: DetailView(data: jValue),
                            label: {
                                Cards(row: jValue)
                            }).buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct Cards: View{
    var row : Row
    var body: some View {
        VStack(spacing: 8){
            Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image("option").renderingMode(.original).foregroundColor(.black)
                }).padding(.trailing, 15)
            }
            
        }
    }
}

struct DetailView: View{
    var data: Row
    @State var size = ""
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack(alignment: .topLeading){
                    
                    Image(data.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.size.width, height: 300)
                    
                    HStack{
                        GeometryReader {proxy in
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left").foregroundColor(.black)
                            }.offset(x: 20.0, y: 10.0)
                            
                            //Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "magnifyingglass").foregroundColor(.black)
                            }).offset(x: proxy.size.width - 80, y: 10.0)
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "cart").foregroundColor(.black)
                            }).offset(x: proxy.size.width - 40, y: 10.0)
                        }
                    }
                }.edgesIgnoringSafeArea(.top)
                
                
                
                VStack(alignment: .leading, spacing: 15){
                    HStack{
                        VStack(alignment: .leading, spacing: 8){
                            Text(data.name).font(.largeTitle)
                            Text(data.price).fontWeight(.heavy)
                        }
                        Spacer()
                        HStack(spacing: 10){
                            Circle().fill(Color.green).frame(width: 20, height: 20)
                            Circle().fill(Color.blue).frame(width: 20, height: 20)
                            Circle().fill(Color.red).frame(width: 20, height: 20)
                        }
                    }
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        .font(.subheadline)
                    
                    
                    Text("Select Size")
                    
                    HStack{
                        
                        ForEach(sizes,id: \.self){ iValue in
                            Button(action: {
                                self.size = iValue
                            }) {
                                Text(iValue)
                                    .padding()
                                    .border(Color.black, width: self.size == iValue ? 1.5 : 0)
                            }.foregroundColor(.black)
                        }
                    }
                    
                    HStack{
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Add to Cart")
                                .padding()
                                .border(Color.black, width: 1.4)
                        }).foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Buy Now").padding()
                        })
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                    }.padding([.leading, .trailing, .top], 15)
                    
                    
                }
                .padding()
                .background(rounded().fill(Color.white))
                .padding(.top, -10)
                
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
        
    }
}




//MODEL
struct rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
struct type: Identifiable {
    var id : Int
    var myRows : [Row]
}

struct Row: Identifiable {
    var id: Int
    var name: String
    var image: String
    var price: String
}

var sizes = ["S", "M", "X", "XL"]
var types = ["Dress", "Pants", "Blazers", "Jackets"]
var datas = [type(id: 0, myRows: [Row(id: 0, name: "Fit And Flare", image: "p1", price: "€199"),
                                  Row(id: 1, name: "Empire Dress", image: "p12", price: "€136"),
                                  Row(id: 2, name: "Summer Vibes", image: "p21", price: "€145"),
                                  Row(id: 3, name: "Primavera Sound", image: "p22", price: "€180"),
                                  Row(id: 4, name: "Fit And Flare", image: "p1", price: "€199"),
                                  Row(id: 5, name: "Empire Dress", image: "p12", price: "€136"),
                                  Row(id: 6, name: "Summer Vibes", image: "p21", price: "€145"),
                                  Row(id: 7, name: "Primavera Sound", image: "p22", price: "€180")])]




