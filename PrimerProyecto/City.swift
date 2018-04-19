//
//  City.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 19/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class City: NSObject {

    let IDCAPITAL = "capital"
    let IDCOUNTRY = "country"
    let IDNAME = "name"
    let IDPOPULATION = "population"
    let IDSTATE = "state"
    
    var sID:String?
    var sCapital:String?
    var sCountry:String?
    var sName:String?
    var iPop:Int?
    var sState:String?
    
    
    func setMap(valores:[String:Any]) {
        sCapital = valores [IDCAPITAL] as? String
        sCountry = valores [IDCOUNTRY] as? String
        sName = valores [IDNAME] as? String
        iPop = valores[IDPOPULATION] as? Int
        sState = valores [IDSTATE] as? String
        
    }
    
    
    func getMap() -> [String:Any]{
        return[
            IDCAPITAL: sCapital as Any,
            IDCOUNTRY: sCountry as Any,
            IDNAME: sName as Any,
            IDPOPULATION: iPop as Any,
            IDSTATE: sState as Any
        ]
    }
}
