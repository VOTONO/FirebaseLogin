//
//  ProfileFormBuilder.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import SwiftUI

final class ProfileFormBuilder: ObservableObject, FormBuilderProtocol {
    
    @Published private(set) var formState: ProfileFormState?
    @State var isUpdated: Bool = false

    private(set) var content: [FormComponent] = ProfileForm.build()
    private(set) lazy var accountInfo: [FormComponent] = {
        
        let info = content
            .filter{ $0.fieldId == .email || $0.fieldId == .password}
        return info
    }()
    private(set) lazy var userInfo: [FormComponent] = {
        let info = content
            .filter{ $0.fieldId == .firstName || $0.fieldId == .lastName || $0.fieldId == .date}
        return info
    }()

    
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
