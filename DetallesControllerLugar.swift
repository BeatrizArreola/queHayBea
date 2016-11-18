//
//  DetallesControllerLugar.swift
//  IntegracionWP
//
//  Created by Maestro on 15/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit

class DetalleControllerLugar : UIViewController{


    @IBOutlet weak var lblTitulo: UILabel!

    @IBOutlet weak var lblDireccion: UILabel!

    @IBOutlet weak var lblTelefono: UILabel!

    @IBOutlet weak var lblDescripcion: UILabel!
    
    @IBOutlet weak var imgDetalle: UIImageView!
    
    @IBOutlet weak var imgFondo: UIImageView!
    
    var lugar : Lugar?
    override func viewDidLoad() {
        
        
        
        
        lblDireccion.lineBreakMode = NSLineBreakMode.ByWordWrapping
        lblDireccion.numberOfLines = 0
        lblDireccion.sizeToFit()
        
        
        lblDescripcion.lineBreakMode = NSLineBreakMode.ByWordWrapping
        lblDescripcion.numberOfLines = 0
        lblDescripcion.sizeToFit()
        
        
        
        
        if let lugar = self.lugar{
        
            lblTitulo.text = lugar.titulo
            lblDireccion.text = lugar.direccion
            lblTelefono.text = lugar.telefono
            lblDescripcion.text = lugar.descripcion
            imgDetalle.image = lugar.imgDetalle
            imgFondo.image = lugar.imgFondo
            
            
            
        }
    }
    
    
}

