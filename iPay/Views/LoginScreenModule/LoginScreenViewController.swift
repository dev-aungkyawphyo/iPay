//
//  LoginScreenViewController.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 30/09/2024.
//

import UIKit

class LoginScreenViewController: IPayViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var textFieldCollection: [IPayTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var phoneNoTextField: IPayTextField!
    @IBOutlet weak var passwordTextField: IPayTextField!
    
    @IBOutlet weak var phoneNoErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
