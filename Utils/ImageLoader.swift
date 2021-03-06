//
//  ImageLoader.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 05/11/2020.
//

import SwiftUI
import UIKit

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader : ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    
    func loadImage(whit url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct GenericCustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .accentColor(.black)
            .padding(20)
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(radius:10)
            .animation(.spring())
    }
}

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.clear)
            .foregroundColor(.black)
            .font(.title)
    }
}

struct SecondLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.clear)
            .foregroundColor(.black)
            .font(.title2)
    }
}

struct ThirdLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.clear)
            .foregroundColor(.black)
            .font(.title3)
    }
}

class Utils {
    
    func myAlertView(myTitle: String, myMessage: String) -> Alert {
        let alert = Alert(title: Text(myTitle),
                          message: Text(myMessage),
                          primaryButton: .default(Text("OK")),
                          secondaryButton: .cancel())
        return alert
    }

    func myActionSheet(myTitle: String, myMessage: String, myArray: [ActionSheet.Button]) -> ActionSheet {
        let actionSheet = ActionSheet(title: Text(myTitle),
                                      message: Text(myMessage),
                                      buttons: myArray)
        return actionSheet
    }
    
}

