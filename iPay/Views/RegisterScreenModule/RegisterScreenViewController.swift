//
//  RegisterScreenViewController.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 30/09/2024.
//

import UIKit

class RegisterScreenViewController: IPayViewController {

    // MARK: IBOutlets
    @IBOutlet var textFieldCollection: [IPayTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var nameTextField: IPayTextField!
    @IBOutlet weak var phoneNoTextField: IPayTextField!
    @IBOutlet weak var passwordTextField: IPayTextField!
    @IBOutlet weak var confirmPasswordTextField: IPayTextField!
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var phoneNoErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    @IBOutlet weak var profileImageView: IPayImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    



}
