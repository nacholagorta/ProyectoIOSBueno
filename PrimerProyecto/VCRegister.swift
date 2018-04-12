//
//  VCRegister.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 3/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase

class VCRegister: UIViewController {

    
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
        DataHolder.sharedInstance.miPerfil.sNombre = "Yony"
        DataHolder.sharedInstance.miPerfil.sApellidos = "BM"
        DataHolder.sharedInstance.miPerfil.iFecha = 1600
        
        Auth.auth().createUser(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) { (user, error) in
            if user != nil{
                print("TE REGISTRASTES")
               self.performSegue(withIdentifier: "trregister", sender: self)
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
                    /*[
                    "Nombre": self.txtUser?.text as Any,
                    "Contraseña": self.txtPass?.text as Any,
                    "Email": self.txtEmail?.text as Any,
                    ])*/
            }
            else{
                print(error!)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
