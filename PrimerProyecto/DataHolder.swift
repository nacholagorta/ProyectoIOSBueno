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
    
    var sNick:String = "Nacho"
    
    var fireStoreDB:Firestore?
    
    var miPerfil:Perfil = Perfil()
    
    func initFireBase() {
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
    }
    
}
