//
//  ViewController.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 3/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController, DataHolderDelegate {

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
        DataHolder.sharedInstance.confirmarLogin(user: (txtUser?.text)!, password: (txtPass?.text)!, delegate: self)
        
    }

    func DHDDescargaLoginCompleta(blFin: Bool) {
        if blFin{
    self.performSegue(withIdentifier: "trlogin", sender: self)
    }
}

}
