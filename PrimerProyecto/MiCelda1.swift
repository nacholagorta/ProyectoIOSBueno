//
//  MiCelda1.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 5/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class MiCelda1: UITableViewCell, DataHolderDelegate {
    
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var lblPais:UILabel?
    @IBOutlet var imvImage:UIImageView?
    var imagenDescargada:UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func mostrarImagen(uri:String) {
        self.imvImage?.image = nil
        DataHolder.sharedInstance.getImg(clave: uri, delegate: self)
}
    func DHDDescargaImg(imagen: UIImage) {
        self.imvImage?.image = imagen
    }
}
