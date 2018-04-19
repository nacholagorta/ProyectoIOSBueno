//
//  DataHolder.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 10/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    
    var sNick:String = "QWERTY@gmail.com"
    
    var fireStoreDB:Firestore?
    
    var miPerfil:Perfil = Perfil()
    
    func initFireBase() {
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
   
        let citiesRef = fireStoreDB?.collection("cities")
        
        citiesRef?.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000
            ])
        citiesRef?.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000
            ])
        citiesRef?.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000
            ])
        citiesRef?.document("TOK").setData([
            "name": "Tokyo",
            "country": "Japan",
            "capital": true,
            "population": 9000000
            ])
        citiesRef?.document("BJ").setData([
            "name": "Beijing",
            "country": "China",
            "capital": true,
            "population": 21500000
            ])
}
 }
