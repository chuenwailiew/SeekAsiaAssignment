//
//  LoginViewController.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 24/04/2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    private let textFieldContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        
        return stack
    }()
    
    private lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.BackgroundSecondary
        tf.textContentType = .username
        tf.placeholder = "Username"
        tf.addTarget(self, action: #selector(self.textDidChange(_:)), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.BackgroundSecondary
        tf.textContentType = .password
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(self.textDidChange(_:)), for: .editingChanged)
        
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.Button
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.TextReversed, for: .normal)
        button.setTitleColor(UIColor.TextPrimary, for: .disabled)
        button.isEnabled = false
        
        return button
    }()
    
    private let disposeBag = DisposeBag()
    
    private lazy var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.buttonEnabled
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.buttonEnabled
            .subscribe(onNext: { [weak self] isEnabled in
                self?.loginButton.backgroundColor = isEnabled ? UIColor.Button : UIColor.lightGray
            })
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.bind { [weak self] in
            guard let self else { return }
            self.view.endEditing(true)
            let vc = JobListTableViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        .disposed(by: disposeBag)
    }
    
    // To add the subviews accordingly
    private func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(textFieldContainerStackView)
        view.addSubview(loginButton)
        textFieldContainerStackView.addArrangedSubview(usernameTextField)
        textFieldContainerStackView.addArrangedSubview(passwordTextField)
    }
    
    // To set the subview's layout respectively
    private func setupLayout() {
        textFieldContainerStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(textFieldContainerStackView.snp.bottom).offset(16)
            $0.centerX.equalTo(textFieldContainerStackView.snp.centerX)
            $0.width.equalTo(textFieldContainerStackView.snp.width)
            $0.height.equalTo(40)
        }
        // Setting the login button to have the capsule layout
        loginButton.layer.cornerRadius = loginButton.frame.height > 0 ? loginButton.frame.height/2 : 20
        loginButton.layer.masksToBounds = true
    }

    @objc private func textDidChange(_ textfield: UITextField) {
        if textfield == usernameTextField {
            viewModel.validateUsername(textfield.text)
        } else if textfield == passwordTextField {
            viewModel.validatePassword(textfield.text)
        } else {
            assertionFailure("No Valid Text Field found")
        }
    }
}
