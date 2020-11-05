//
//  ObserverObject.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//

import SwiftUI

// MARK: - VideosModel
struct VideosModel: Codable {
    let iCoMusicResponse: ICoMusicResponse
    let aPIError: APIError
}

// MARK: - APIError
struct APIError: Codable {
    let code: Int
    let error: Error
}

// MARK: - Error
struct Error: Codable {
    let message: String
}

// MARK: - ICoMusicResponse
struct ICoMusicResponse: Codable {
    let videosFitnessTop, videosFitnessBody: [VideosFitness]

    enum CodingKeys: String, CodingKey {
        case videosFitnessTop = "VideosFitnessTop"
        case videosFitnessBody = "VideosFitnessBody"
    }
}

// MARK: - VideosFitness
struct VideosFitness: Codable, Identifiable {
    var id = UUID()
    let workout: String
    let frameImageVideo: String?
    let urlYoutube, descripcionData: String

    enum CodingKeys: String, CodingKey {
        case workout = "Workout"
        case frameImageVideo, urlYoutube, descripcionData
    }
    
    var imagenEjercicioURL: URL {
        return URL(string: "\(frameImageVideo ?? "")")!
    }
}

// MARK: - class ObserverObjectPresenter
class ObserverObjectPresenter: ObservableObject {
    
    @Published var fitness : VideosModel?
    
    func sendRequest() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        guard let urlDes = URL(string: "http://www.andresocampo.com/pruebas/iCoSpartanAPI/iCoMusicVideos.json") else {return}
        var request = URLRequest(url: urlDes)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        session.dataTask(with: urlDes) { (data, response, error) in
            guard let dataDes = data else { return }
            if (error == nil && !dataDes.isEmpty) {
                DispatchQueue.main.async {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                    do{
                        let videosModel = try JSONDecoder().decode(VideosModel.self, from: dataDes)
                        self.fitness = videosModel
                    }catch let error {
                        print(error.localizedDescription)
                    }
                }
            } else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        }.resume()
        session.finishTasksAndInvalidate()
    }
    
    func myArray() -> [VideosFitness] {
        return self.fitness?.iCoMusicResponse.videosFitnessTop ?? []
    }
    
}

// MARK: - struct ObserverObject: View
struct ObserverObject: View {
    
    @ObservedObject private var presenter = ObserverObjectPresenter()
   
    
    var body: some View {
        VStack{
            ZStack{
                Text("Fitness")
                    .font(.title)
                    .bold()
                
                HStack{
                    Button(action: {}, label: {
                        Image("Menu").renderingMode(.original)
                    })
                    Spacer()
                }
            }.padding(15)
            
            List{
                ForEach(self.presenter.myArray()){ fitnessTop in
                    Card(myModelData: fitnessTop)
                }
            }
            
        }.onAppear(perform: {
            self.presenter.sendRequest()
        })
    }
}

// MARK: - struct Card: View
struct Card: View {
    
    var myModelData : VideosFitness
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: UnitPoint.bottom, endPoint: UnitPoint.top))
                .cornerRadius(8)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Text(myModelData.descripcionData)
                .font(.title2)
                .foregroundColor(Color.white)
                .padding(8)
            
        }.onAppear(perform: {
            self.imageLoader.loadImage(whit: self.myModelData.imagenEjercicioURL)
        })
    }
}



struct ObserverObject_Previews: PreviewProvider {
    static var previews: some View {
        ObserverObject()
    }
}

