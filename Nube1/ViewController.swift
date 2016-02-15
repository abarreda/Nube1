//
//  ViewController.swift
//  Nube1
//
//  Created by Arturo Barreda on 14/02/16.
//  Copyright © 2016 Arturo Roberto Barreda Westphal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtRespuesta: UITextView!
    @IBOutlet weak var txtBuscar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSearch(sender: AnyObject) {
        if self.txtBuscar.text != "" {
            
            let url = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + self.txtBuscar.text!)
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                dispatch_async(dispatch_get_main_queue()) {
                    if let err = error {
                        self.txtRespuesta.text = "Error de Comunicación: \(err)"
                    } else {
                        self.txtRespuesta.text = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                }
            }
            task.resume()
        }
    }
}

