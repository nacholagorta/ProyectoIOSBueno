//
//  MiCelda2.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 5/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class MiCelda2: UICollectionViewCell, DataHolderDelegate {
    
    @IBOutlet var imgvMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    func mostrarImagen(uri:String) {
        self.imgvMain?.image = nil
        DataHolder.sharedInstance.getImg(clave: uri, delegate: self)
    }
    func DHDDescargaImg(imagen: UIImage) {
        self.imgvMain?.image = imagen
    }
}
