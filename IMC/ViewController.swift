//
//  ViewController.swift
//  IMC
//
//  Created by Bruno Silva on 05/06/20.
//  Copyright © 2020 Bruno Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imc: Double = 0
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var viResult: UIView!
    @IBOutlet weak var ivResult: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func Calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / (height * height)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                    result = "Abaixo do peso"
                    image = "abaixo"
            case 18.5..<25:
                    result = "Peso Ideal"
                    image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "obesidade"
            default:
            result = "Obesidade"
            image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named:	image)
        viResult.isHidden = false
        view.endEditing(true)
    }
}

