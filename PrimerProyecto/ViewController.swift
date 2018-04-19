//
//  ViewController.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 3/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet var  txtUser:UITextField?
    @IBOutlet var  txtPass:UITextField?
    @IBOutlet var  btnLogin:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtUser?.text = DataHolder.sharedInstance.sNick
        DataHolder.sharedInstance.sNick = "123456"
        txtPass?.text = DataHolder.sharedInstance.sNick
        
    
        
        //do{
         //   try Auth.auth().signOut()
       // }catch{
            
      //  }
    
      //  Auth.auth().addStateDidChangeListener {(auth, user) in
            //...
         //   if user != nil{
          //      self.performSegue(withIdentifier: "trlogin", sender: self)
         //   }
      //  }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func eventoClickLogin(){
        print("Bienvenido " + (txtUser?.text)!)
        
        Auth.auth().signIn(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) {(user, error) in
            if(user != nil){
                let ruta =
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        print(document?.data() as Any)
                        self.performSegue(withIdentifier: "trlogin", sender: self)
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

}

