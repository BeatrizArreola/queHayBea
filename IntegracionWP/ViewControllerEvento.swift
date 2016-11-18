//
//  ViewControllerEvento.swift
//  IntegracionWP
//
//  Created by Maestro on 15/11/16.
//  Copyright © 2016 Maestro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire



class ViewControllerEvento : UIViewController, UITableViewDataSource, UITableViewDelegate{

    var eventos : [Evento] = []
    
    
    @IBOutlet weak var tvEventos: UITableView!



    override func viewDidLoad() {
        Alamofire.request(.GET, "https://quehaybea.azurewebsites.net/api/get_posts/", parameters: ["post_type" : "eventos"]).responseJSON{ response in
            
            
           if let diccionarioRespuesta = response.result.value as? NSDictionary{
            
            
            if let posts = diccionarioRespuesta.valueForKey("posts") as? NSArray{
            
                
                for post in posts {
                
                    if let diccionarioPost = post as? NSDictionary{
                    
                        self.eventos.append(Evento(diccionario: diccionarioPost, callback : self.actualizarTableViewEventos))
                        
                    
                    
                    }
                
                
                }
                self.tvEventos.reloadData()
            
            }
            
            
            }
        
        
        
        
        }
}


    func actualizarTableViewEventos(){

        tvEventos.reloadData()

    }




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        
        let celda = tableView.dequeueReusableCellWithIdentifier("celdaEvento") as! EventoCelda //tienes una celda de lugar tipocELDA
        
        celda.lblNombreE.text = eventos[indexPath.row].titulo
        
        
      if let imagen = eventos[indexPath.row].imgFondo {celda.imgFondo.image = imagen
            
        
        
        
        
        
        }

        return celda

}
    
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToDetallesE" {
            let detallesController = segue.destinationViewController as! DetallesControllerEvento
            detallesController.evento = eventos[(tvEventos.indexPathForSelectedRow?.row)!]
            
            
            
            
        }
    }
    
}










