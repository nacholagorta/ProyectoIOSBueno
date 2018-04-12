//
//  Perfil.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 12/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase

class Perfil: NSObject {

    var sNombre:String?
    var iFecha:Int?
    var sApellidos:String?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores ["nombre"] as? String
        sApellidos = valores ["apellidos"] as? String
        iFecha = valores ["fecha de nacimiento"] as? Int
        
    }
    
    
    func getMap() -> [String:Any]{
        return[
            "nombre": sNombre as Any,
            "apellido": sApellidos as Any,
            "fecha de nacimiento": iFecha as Any,]
    }
}
