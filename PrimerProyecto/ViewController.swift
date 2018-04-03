//
//  ViewController.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 3/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var  txtUser:UITextField?
    @IBOutlet var  txtPass:UITextField?
    @IBOutlet var  btnLogin:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func eventoClickLogin(){
        print("Bienvenido " + (txtUser?.text)!)
        
        if txtUser?.text == "Nacho" && txtPass?.text == ":DDD"{
            self.performSegue(withIdentifier: "trlogin", sender: self)
        }
        
    }

}

