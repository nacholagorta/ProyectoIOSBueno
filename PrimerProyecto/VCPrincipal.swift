//
//  VCPrincipal.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 4/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Firebase
class VCPrincipal: UIViewController,UITableViewDelegate,UITableViewDataSource, DataHolderDelegate {
  
    
    
    @IBOutlet var tbtablaCampeones:UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataHolder.sharedInstance.descargarPerfiles(delegate:self)
        
    }
        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaPerfilesCompleta(blFin: Bool) {
        if blFin {
            self.refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("SSOO CONSULTA CANTIDAD DE FILAS PARA PINTAR", DataHolder.sharedInstance.arUsuarios.count)
        return DataHolder.sharedInstance.arUsuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "idmicelda") as! MiCelda1
        celda.lblNombre?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sNombre
        celda.lblPais?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sApellidos
        if (DataHolder.sharedInstance.arUsuarios[indexPath.row].sUrlImage != nil){
        celda.mostrarImagen(uri: DataHolder.sharedInstance.arUsuarios[indexPath.row].sUrlImage!)
        }
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
