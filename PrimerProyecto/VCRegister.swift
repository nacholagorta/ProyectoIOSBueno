//
//  VCRegister.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 3/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase

class VCRegister: UIViewController, DataHolderDelegate {

    
    @IBOutlet var  btnAceptar:UIButton?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtEmail:UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.sNombre = txtUser?.text
        DataHolder.sharedInstance.miPerfil.sApellidos = txtEmail?.text
        DataHolder.sharedInstance.miPerfil.iFecha = 1900
        DataHolder.sharedInstance.registrarse(user: (txtEmail?.text)!, password: (txtPass?.text)!, delegate: self)

        
    }
    func DHDregistro(blFin: Bool) {
        if blFin{
            self.performSegue(withIdentifier: "trregister", sender: self)
        }
    }
}
