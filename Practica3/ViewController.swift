//
//  ViewController.swift
//  Practica3
//
//  Created by Joseba Iturrioz Aguirre on 3/4/23.
//

import UIKit
import MessageUI

class ViewController: UIViewController{

    var mostrado : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func miBotonMail(_ sender: Any) {
        if !mostrado {
            if MFMailComposeViewController.canSendMail() {
                print("Puedo enviar mail")
                let viewControllerMail = MFMailComposeViewController()
                
                viewControllerMail.setToRecipients(["josebaitu507@gmail.com"])
                viewControllerMail.setSubject("Prueba")
                viewControllerMail.setMessageBody("<h1>Este es un mensaje de prueba.</h1> <p> Me confundí con 2 tonterías </p>", isHTML: true)
                viewControllerMail.delegate = self
                present(viewControllerMail, animated: true)
            } else{
                print("No puedo enviar mail")
            }
            
            
        }
    }
    
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .cancelled:
            print("Se ha cancelado el envío")
        case .saved:
            print("Se ha guardado el envío")
        case .sent:
            print("Se ha mandado el envío")
        case .failed:
            print("Ha fallado el envío")
        @unknown default:
            fatalError("Ha habido un error en el mail. Caso no esperado.")
        }
    }
}

extension ViewController:  UINavigationControllerDelegate  {
    
}
