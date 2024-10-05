//
//  LoginViewModel.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 03/10/2024.
//

import Foundation

protocol LoginViewModelInputs: AnyObject {
    func clickedLoginButton(input: LoginInput)
    func clickedRegisterButton()
}

protocol LoginViewModelOutputs: AnyObject {
    var isInvalid: ((Error) -> Void)? { get set }
}

protocol LoginViewModelType {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

final class LoginViewModel: LoginViewModelInputs, LoginViewModelOutputs, LoginViewModelType {
    
    // MARK: - LoginViewModelType
    var inputs: LoginViewModelInputs { return self }
    var outputs: LoginViewModelOutputs { return self }
    
    // MARK: - Custom Initializers
    let validationService = ValidationService.shared
    
    /// Validation Flag
    var isInvalidInputs: Bool = false
    
    var dbService = DBService()
    
    // MARK: - LoginViewModelInputs
    func clickedLoginButton(input: LoginInput) {
        inputValidation(input: input)
    }
    
    func clickedRegisterButton() {
        // TODO: need action
    }
    
    // MARK: - LoginViewModelInputs
    var isInvalid: ((any Error) -> Void)?
    
    func inputValidation(input: LoginInput) {
        isInvalidInputs = false
        /// Validation Check
        validatePhoneNo(input.phoneNo)
        validatePassword(input.password)
        
        guard !isInvalidInputs else { return }
        
        /// User Login
        userLogin(input: input)
    }
    
    private func validatePhoneNo(_ phoneNo: String?) {
        switch validationService.isValidPhoneNo(phoneNo: phoneNo) {
        case .failure(let error):
            validateFail(error: error)
        default:
            break
        }
    }
    
    private func validatePassword(_ password: String?) {
        switch validationService.isValidPassword(passwordType: .normalPassword, password: password) {
        case .failure(let error):
            validateFail(error: error)
        default:
            break
        }
    }
    
    private func validateFail(error: Error) {
        isInvalidInputs = true
        self.isInvalid?(error)
    }
    
    private func userLogin(input: LoginInput) {
        /*
         - demo login account: 9764374935, password: password
         */
        let loginRequest = LoginRequest(phone: input.phoneNo, password: input.password)
        if dbService.userLogin(request: loginRequest) != nil {
            
        }
    }
    
}
