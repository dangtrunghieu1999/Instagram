//
//  LoginViewController.swift
//  Instagram_Clone
//
//  Created by Dang Trung Hieu on 9/4/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Varibales
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    private let logoTitleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageManager.titleLogo
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.placeholder = TextManager.signInUserNamePlaceHolder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        textField.backgroundColor = UIColor(white: 0, alpha: 0.01)
        textField.delegate = self
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = TextManager.passwordPlaceHolder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        textField.backgroundColor = UIColor(white: 0, alpha: 0.01)
        textField.delegate = self
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.forgotPasswordButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h3.rawValue, weight: .bold
        )
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.enableColor, for: .normal)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.signInButton, for: .normal)
        button.backgroundColor = UIColor.disableColor
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = false
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        button.addTarget(self, action: #selector(tapOnSignIn), for: .touchUpInside)
        return button
    }()
    
    private let titleLineLabel: UILabel = {
        let label = UILabel()
        label.text = "HOẶC"
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        label.textColor = UIColor.bodyColor
        return label
    }()
    
    private let iconFaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageManager.facebook
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let signInFaceBookButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.signInFacebook, for: .normal)
        button.setTitleColor(UIColor.enableColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue, weight: .bold)
        button.backgroundColor = UIColor.clear
        return button
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lineColor
        return view
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Bạn không có tài khoản ư?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: FontSize.h1.rawValue), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Đăng ký", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: FontSize.h1.rawValue), NSAttributedString.Key.foregroundColor: UIColor.enableColor
        ]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(tapOnSignUp), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - View LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        endEditingKeyBoard()
        setupNavigationBar()
        layoutLogoTitleImageView()
        layoutUsernameTextField()
        layoutPasswordTextField()
        layoutForgotPasswordButton()
        layoutSignInButton()
        layoutTitleLineLabel()
        layoutIconFaceImageView()
        layoutSignInFacebookButton()
        layoutLineView()
        layoutDontHaveAccountButton()
        
    }
    
    
    // MARK: - Method Helper
    
    private func setupNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    }
    
    @objc private func handleTextInputChange() {
        let isFormValid = usernameTextField.text?.isEmpty == false
            && passwordTextField.text?.isEmpty == false
        if isFormValid {
            signInButton.isEnabled = true
            signInButton.backgroundColor = UIColor.enableColor
        } else {
            signInButton.isEnabled = false
            signInButton.backgroundColor = UIColor.disableColor
        }
    }
    
    @objc private func handleTapOnView() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @objc private func tapOnSignIn() {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        usernameTextField.isEnabled = false
        passwordTextField.isEnabled = false
        signInButton.isEnabled = false
        signInButton.backgroundColor = UIColor.disableColor
        
        if username != "" && password != "" {
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func tapOnSignUp() {
        let vc = RegistrantionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func endEditingKeyBoard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnView)))
    }
    
    // MARK: - Public Method
    
    // MARK: - Layout
    
    private func layoutLogoTitleImageView() {
        view.addSubview(logoTitleImageView)
        logoTitleImageView.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide).offset(Dimension.shared.largeMargin_120)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(Dimension.shared.largeMargin_120)
            }
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    
    private func layoutUsernameTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoTitleImageView.snp.bottom).offset(Dimension.shared.largeMargin_32)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin_12)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin_12)
            make.height.equalTo(40)
            
        }
    }
    
    private func layoutPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp.bottom).offset(Dimension.shared.mediumMargin)
            make.left.right.equalTo(usernameTextField)
            make.height.equalTo(40)
            
        }
    }
    
    private func layoutForgotPasswordButton() {
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Dimension.shared.mediumMargin_12)
            make.right.equalTo(passwordTextField)
            
        }
    }
    
    private func layoutSignInButton() {
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Dimension.shared.largeMargin_56)
            make.left.right.equalTo(usernameTextField)
            make.height.equalTo(40)
        }
    }
    
    private func layoutTitleLineLabel() {
        view.addSubview(titleLineLabel)
        titleLineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(signInButton.snp.bottom).offset(Dimension.shared.largeMargin)
            make.centerX.equalToSuperview()
            
        }
    }
    
    private func layoutIconFaceImageView() {
        view.addSubview(iconFaceImageView)
        iconFaceImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.shared.largeMargin_90)
            make.height.equalTo(20)
            make.top.equalTo(titleLineLabel.snp.bottom).offset(Dimension.shared.largeMargin)
        }
    }
    
    private func layoutSignInFacebookButton() {
        view.addSubview(signInFaceBookButton)
        signInFaceBookButton.snp.makeConstraints { (make) in
            make.left.equalTo(iconFaceImageView.snp.right).offset(Dimension.shared.normalMargin)
            make.centerY.equalTo(iconFaceImageView)
        }
    }
    
    private func layoutLineView() {
        view.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(signInFaceBookButton
                .snp.bottom).offset(Dimension.shared.largeMargin_56)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
    }
    
    private func layoutDontHaveAccountButton() {
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-Dimension.shared.normalMargin)
            make.centerX.equalToSuperview()
        }
    }
    
}


// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



