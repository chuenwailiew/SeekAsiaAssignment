//
//  LoginViewModel.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 24/04/2023.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel {
    var username: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    var password: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    lazy var buttonEnabled: Observable<Bool> = {
        let usernameIsEmpty = username.asObservable().map({ $0 != nil && $0!.count > 0 })
        let passwordIsEmpty = password.asObservable().map({ $0 != nil && $0!.count > 0 })
        return Observable.combineLatest(usernameIsEmpty, passwordIsEmpty) { $0 && $1 }
    }()
    
    func validateUsername(_ text: String?) {
        self.username.accept(text)
    }
    
    func validatePassword(_ text: String?) {
        self.password.accept(text)
    }
}
