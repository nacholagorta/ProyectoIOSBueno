//
//  MiCelda1.swift
//  PrimerProyecto
//
//  Created by IGNACIO OLAGORTA VERA on 5/4/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class MiCelda1: UITableViewCell {
    
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
        // Create a reference to the file you want to download
        self.imvImage?.image = nil
        //if imagenDescargada == nil{
            
        
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                //let image = UIImage(data: data!)
                    self.imagenDescargada = UIImage(data: data!)
                    self.imvImage?.image = self.imagenDescargada
            }
       // }
        }
    }
    
}
