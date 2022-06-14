//
//  RegisterFormBuilder.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation

final class RegisterFormBuilder: ObservableObject, FormBuilderProtocol {
    
    @Published private(set) var formState: RegisterFormState?

    private(set) lazy var content: [FormComponent] = RegisterForm.build()

    
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
                    print("error in: \(component.fieldId)")
                    self.formState = .failed(error: error)
                    return
                }
            }
        }

        if let firstName = formComponents.first(where: { $0.fieldId == .firstName })?.value as? String,
           let lastName = formComponents.first(where: { $0.fieldId == .lastName })?.value as? String,
           let email = formComponents.first(where: { $0.fieldId == .email })?.value as? String,
           let password = formComponents.first(where: { $0.fieldId == .password })?.value as? String,
           let birthday = formComponents.first(where: { $0.fieldId == .date })?.value as? Date {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YY/MM/dd"
            let stringDate = dateFormatter.string(from: birthday)
            let newUser = UserDetails(firstName: firstName,
                               lastName: lastName,
                               password: password,
                               email: email,
                               birthday: stringDate)
            print("Valide form with user: \(newUser)")
            self.formState = .valid(user: newUser)
        }
    }
}
