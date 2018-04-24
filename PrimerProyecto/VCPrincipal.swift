//
//  VCPrincipal.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 4/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase
class VCPrincipal: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    
    @IBOutlet var tbtablaCampeones:UITableView?
    var arUsuarios:[Perfil] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.arUsuarios=[]
                    for document in querySnapshot!.documents {
                        let nombre:Perfil = Perfil()
                        nombre.setMap(valores: document.data())
                        self.arUsuarios.append(nombre)
                        
                        //print("\(document.documentID) => \(document.data())")
                    }
                    //print("---->>>>> ",self.arUsuarios.count)
                    //self.tbtablaCampeones?.reloadData()
                    self.refreshUI()
                }
           
        }
    }
        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("SSOO CONSULTA CANTIDAD DE FILAS PARA PINTAR", self.arUsuarios.count)
        return self.arUsuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "idmicelda") as! MiCelda1
        celda.lblNombre?.text = self.arUsuarios[indexPath.row].sNombre
        celda.lblPais?.text = self.arUsuarios[indexPath.row].sApellidos
       
        /*
        if indexPath.row == 0 {
             celda.lblNombre?.text="LeeSin"
        }
        else if indexPath.row == 1 {
            celda.lblNombre?.text="Yasuo"
        }
        else if indexPath.row == 2{
            celda.lblNombre?.text="Riven"
        }
        else if indexPath.row == 3 {
            celda.lblNombre?.text="Kayn"
        }
        else if indexPath.row == 4 {
            celda.lblNombre?.text="Brand"
        }
       */
        return celda
    }
 
    func refreshUI(){
        
        DispatchQueue.main.async(execute: {
            self.tbtablaCampeones?.reloadData()
        })
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
