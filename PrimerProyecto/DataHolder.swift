//
//  DataHolder.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 10/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    
    var sNick:String = "QWERTY@gmail.com"
    var fireStoreDB:Firestore?
    var firStorage:Storage?
    var miPerfil:Perfil = Perfil()
    var arUsuarios:[Perfil] = []

    
    func initFireBase() {
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
   firStorage = Storage.storage()
}
    func descargarPerfiles(delegate:DataHolderDelegate){
        
        fireStoreDB?.collection("Perfiles").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaPerfilesCompleta!(blFin: false)
            } else {
                self.arUsuarios=[]
                for document in querySnapshot!.documents {
                    let nombre:Perfil = Perfil()
                    nombre.setMap(valores: document.data())
                    self.arUsuarios.append(nombre)
                    
                    print("\(document.documentID) => \(document.data())")
                }
                print("---->>>>> ",self.arUsuarios.count)
                delegate.DHDDescargaPerfilesCompleta!(blFin: true)
                //self.tbtablaCampeones?.reloadData()
               // self.refreshUI()
            }
            
        }
        
    }
    
 }



@objc protocol DataHolderDelegate {
    @objc optional func  DHDDescargaPerfilesCompleta(blFin:Bool)
}







