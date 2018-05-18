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
    

    
    var sUrlImage:String?
    var sNombre:String?
    var iFecha:Int?
    var sApellidos:String?
    var iLatitude:Double?
    var iLongitude:Double?
    
    
    func setMap(valores:[String:Any]) {
        sNombre = valores ["nombre"] as? String
        sApellidos = valores ["apellido"] as? String
        iFecha = valores ["fecha de nacimiento"] as? Int
        sUrlImage = valores ["image"] as? String
        iLatitude = valores ["latitud"] as? Double
        iLongitude = valores ["longitud"] as? Double
        //if sUrlImage == nil{
          //  sUrlImage="gs://primerproyecto-79dc7.appspot.com/perros/perro4.jpg"
        //}
    }
    
    
    func getMap() -> [String:Any]{
        return[
            "nombre": sNombre as Any,
            "apellido": sApellidos as Any,
            "fecha de nacimiento": iFecha as Any,
            "image": sUrlImage as Any,
            "latitud": iLatitude as Any,
            "longitud": iLongitude as Any]
        
    }
}
