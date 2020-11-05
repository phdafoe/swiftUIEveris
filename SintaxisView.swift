//
//  SintaxisView.swift
//  swiftUIEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/2020.
//

import SwiftUI

struct SintaxisView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Match this color"/*@END_MENU_TOKEN@*/)
    }
}

struct SintaxisView_Previews: PreviewProvider {
    static var previews: some View {
        SintaxisView()
    }
}

struct Person {
    //Computed read-only (no hay set, el valor nose almacena)
    var personType: String {
        get{
            return "human"
        }
    }
}

struct Person1 {
    //se quita el return
    var personType: String {
        get{
             "human"
        }
    }
}

struct Person2 {
    //se quita el get
    var personType: String {
        "human"
    }
}


//Notas
/*Las vistas en SwiftUI son structuras (struct) estas conforman el protocolo View, e implementa simplemente una propiedad var "body"
¿ si "body" es una propiedad entonces donde esta el "get" y el "return" ? segun la sintaxis?

Las propiedades pueden tener getter y setter, pero cuando la propiedad no tiene setter es llamada "read-only", y cuando la propiedad no almacena un valor esta es llamada "computed", esto es por que el valor es computado y generado cada vez que la propiedad es leida.

En este ejemplo "personType" es una propiedad computed read-only
 
Se puede simplificar aun mas la propiedad de dos maneras

1. Cuando el codigo dentro el "get" es una unica expresion, el getter se retornara automaticamente asi que se puede eliminar el return
2. Cuando la propiedad es read-only(no setter) podemos remover aun mas el "get", esto es opcional
 
*/
