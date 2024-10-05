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
    
    var viewModel: LoginViewModel?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func defaultSetup() {
        textFieldSetup()
    }
    
    private func textFieldSetup() {
        phoneNoTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBAction
    @IBAction func forgotPasswordBtnAction(_ sender: UIButton) {
        // TODO: - Need action
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        // TODO: - Need action
    }
    
    @IBAction func loginBtnAction(_ sender: IPayButton) {
        viewModel?.inputs.clickedLoginButton(input: .init(phoneNo: phoneNoTextField.inputValue, password: passwordTextField.inputValue))
        baseRouter()
    }
    
    private func baseRouter() {
        let vc = HomeScreenViewController.instantiate(storyboard: .home)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private func binding() {
        viewModel = LoginViewModel()
        viewModel?.outputs.isInvalid = { [weak self] errorMessage in
            if let error = errorMessage as? PhoneNoValidationError {
                self?.phoneNoErrorLabel.text = error.rawValue
                return
            }
            if let error = errorMessage as? PasswordValidationError {
                self?.passwordErrorLabel.text = error.rawValue
            }
        }
    }
    
    private func setupTextFields() {
        textFieldCollection.forEach({
            $0.delegate = self
        })
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textField = textField as? IPayTextField, let index = textFieldCollection.firstIndex(of: textField) {
            errorLabelCollection[index].text = ""
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = textField as? IPayTextField, 
              let index = textFieldCollection.firstIndex(of: textField) else {
            return true
        }
        guard index < textFieldCollection.count - 1 else {
            textFieldCollection[index].resignFirstResponder()
            return true
        }
        textFieldCollection[index + 1].becomeFirstResponder()
        return true
    }
    
}
