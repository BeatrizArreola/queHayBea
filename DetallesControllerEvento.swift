//
//  detallesControllerEvento.swift
//  IntegracionWP
//
//  Created by Maestro on 16/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit




class DetallesControllerEvento : UIViewController{
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var lblFecha: UILabel!
 
    @IBOutlet weak var lblHorario: UILabel!
    
    
    @IBOutlet weak var lblDireccion: UILabel!
    
    @IBOutlet weak var lblDescripcion: UILabel!
    
    @IBOutlet weak var lblCosto: UILabel!
    
    @IBOutlet weak var imgFondo: UIImageView!
    
    @IBOutlet weak var imgDetalle: UIImageView!
    
    
    
    
    var evento : Evento?
    
    override func viewDidLoad() {
        
        
        
        lblDireccion.lineBreakMode = NSLineBreakMode.ByWordWrapping
        lblDireccion.numberOfLines = 0
        lblDireccion.sizeToFit()
        
        
       lblDescripcion.lineBreakMode = NSLineBreakMode.ByWordWrapping
        lblDescripcion.numberOfLines = 0
        lblDescripcion.sizeToFit()
        
        
        if let evento = self.evento{
        
        lblTitulo.text = evento.titulo
        lblFecha.text = evento.fecha
        lblHorario.text = evento.horario
        lblDireccion.text = evento.direccion
        lblDescripcion.text = evento.descripcion
        lblCosto.text = evento.costo
        imgFondo.image = evento.imgFondo
       imgDetalle.image = evento.imgDetalle
        
        
        }
    }
    
    
}