//
//  lugar.swift
//  IntegracionWP
//
//  Created by Maestro on 04/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//




import Foundation
import UIKit
import Alamofire

class Lugar {
    var titulo : String
    var descripcion : String
    var direccion : String
    var telefono : String
    
    var urlFondo : String?
    var imgFondo : UIImage?
    
    var urlThumbnailFondo : String?
    var imgThumbnailFondo : UIImage?
    
    
    var urlDetalle : String?
    var imgDetalle : UIImage?
 
    
    var urlThumbnailDetalle : String?
    var imgThumbnailDetalle : UIImage?
    
    
    
    init(){
        titulo = ""
        descripcion = ""
        direccion = ""
        telefono = ""
    }
    
    
    
    init(diccionario : NSDictionary, callback: (() -> Void)?) {
        titulo = ""
        descripcion = ""
        direccion = ""
        telefono = ""
        
        if let titulo = diccionario.valueForKey("title_plain") as? String {
            self.titulo = titulo
        }
        
        
        
        
        
        
        if let customFields = diccionario.valueForKey("custom_fields") as? NSDictionary {
        
            if let descripcion = customFields.valueForKey("descripcion") as? NSArray {
                if let valorDescripcion = descripcion[0] as? String {
                    self.descripcion = valorDescripcion
                }
            }
            
            if let direccion = customFields.valueForKey("direccion") as? NSArray {
                if let valorDireccion = direccion[0] as? String {
                    self.direccion = valorDireccion
                }
            }
            if let telefono = customFields.valueForKey("telefono") as? NSArray {
                if let valorTelefono = telefono[0] as? String {
                    self.telefono = valorTelefono
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        
        
        
        
        
        if let attachments = diccionario.valueForKey("attachments") as? NSArray {
            if attachments.count > 0 {
                if let imagen = attachments[0] as? NSDictionary {
                    if let urlImagen = imagen.valueForKey("url") as? String {
                        self.urlFondo = urlImagen
                    }
                    
                    
                    if let imagenD = attachments[1] as? NSDictionary {
                        if let urlImagenD = imagenD.valueForKey("url") as? String {
                            self.urlDetalle = urlImagenD
                        }

                    
                    
                    
                    
                    
                    if let images = imagen.valueForKey("images") as? NSDictionary {
                        if let thumbnail = images.valueForKey("thumbnail") as? NSDictionary {
                            if let urlThumbnail = thumbnail.valueForKey("url") as? String {
                                self.urlThumbnailFondo = urlThumbnail
                            }
                            
                        }
                    }
                        
                        
                        
                        
                        if let imagesD = imagenD.valueForKey("images") as? NSDictionary {
                            if let thumbnailD = imagesD.valueForKey("thumbnail") as? NSDictionary {
                                if let urlThumbnailD = thumbnailD.valueForKey("url") as? String {
                                    self.urlThumbnailDetalle = urlThumbnailD
                                }
                                
                            }
                        }
                        
                        
                        
                        
                        
                        
                    }
                }
            }
        }
        
        
        
        if let urlFondo = self.urlFondo {
            Alamofire.request(.GET,urlFondo, parameters: [:]).responseData(completionHandler: {
                response in
                if let data = response.data {
                    self.imgFondo = UIImage(data: data)
                    if let funcionCallback = callback {
                        funcionCallback()
                    }
                } else {
                    self.imgFondo = UIImage(named: "obregon")
                }
            })
        } else {
            self.imgFondo = UIImage(named: "obregon")
        }
        
        
        
        if let urlDetalle = self.urlDetalle {
            Alamofire.request(.GET,urlDetalle, parameters: [:]).responseData(completionHandler: {
                response in
                if let data = response.data {
                    self.imgDetalle = UIImage(data: data)
                    
                } else {
                    self.imgDetalle = UIImage(named: "obregon")
                }
            })
        } else {
            self.imgDetalle = UIImage(named: "obregon")
        }
        
        
    }
    
    
}

