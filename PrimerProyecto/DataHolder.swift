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
    var imagenDescargada:[String:UIImage]? = [:]
    var firStorageRef:StorageReference?
    
    func initFireBase() {
       FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
}
   
    
    func confirmarLogin(user:String, password:String, delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: (user), password: (password)) {(user, error) in
            if(user != nil){
                let ruta =
                    DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        delegate.DHDDescargaLoginCompleta!(blFin: true)
                        print(document?.data() as Any)
                        
                    }
                    else{
                        print(error!)
                    }
                }
                
                
            }
            else {
                print("NO SE HA LOGEADO")
                print(error!)
            }
            //self.performSegue(withIdentifier: "trlogin", sender: self)
            
            
        }
        
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
    
    func registrarse(user: String, password:String, delegate: DataHolderDelegate){
        Auth.auth().createUser(withEmail:user, password:password){ (user, error) in
            if(user != nil){
                print("registrado")
        DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
                 delegate.DHDregistro!(blFin: true)
            }
            else{
                print(error!)
            }
        print("Wolas")
    }
 }
    func getImg(clave: String, delegate:DataHolderDelegate){
        if self.imagenDescargada![clave]==nil{
            let gsReference = self.firStorage?.reference(forURL: clave)
       
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                let imgDescargada = UIImage(data: data!)
                self.imagenDescargada?[clave] = imgDescargada
                delegate.DHDDescargaImg!(imagen : imgDescargada!)
            }
            // }
        }
    }
        else {
            delegate.DHDDescargaImg!(imagen: self.imagenDescargada![clave]!)
        }
    }
    
    
    
}
@objc protocol DataHolderDelegate {
    @objc optional func DHDDescargaPerfilesCompleta(blFin:Bool)
    @objc optional func DHDDescargaLoginCompleta(blFin:Bool)
    @objc optional func DHDregistro(blFin:Bool)
    @objc optional func DHDDescargaImg(imagen:UIImage)
   
}

