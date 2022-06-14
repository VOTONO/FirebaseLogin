//
//  LoginFormBuilder.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation

final class LoginFormBuilder: ObservableObject, FormBuilderProtocol {
    
    @Published private(set) var formState: LoginFormState?

    private(set) lazy var content: [FormComponent] = LoginForm.build()
        
    
    func update(_ value: Any, in component: FormComponentProtocol) {
        guard let index = content.firstIndex(where: { $0.id == component.id }) else {return}
        content[index].value = value
    }
    
    func validate() {
        
        let formComponents = content
            .filter {$0.fieldId != .submit}
        
        for component in formComponents {
            for validator in component.validations {
                if let error = validator.validate(component.value as Any) {
                    self.formState = .failed(error: error)
                    return
                }
            }
        }
        if let email = formComponents.first(where: { $0.fieldId == .email })?.value as? String,
           let password = formComponents.first(where: { $0.fieldId == .password })?.value as? String {
            
            let loginUser = UserLogin(email: email,
                                      password: password)
            self.formState = .valid(user: loginUser)
        }
    }
}
