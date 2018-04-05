//
//  VCCollectionViewController.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 5/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class VCCollectionViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    
    @IBOutlet var colPrincipal:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "idmicelda2", for: indexPath) as! MiCelda2
        
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
        
        return celda
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
