//
//  ContaMemoriaView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 14/09/22.
//

import UIKit

class ContaMemoriaView: UIView {
    let backgroundView =  UIImageView(image: UIImage(named: "background"))
    let headerStackView = UIStackView()
    let bodyStackView = UIStackView()
    let bodyContainer = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let stackView = UIStackView()
    let nomeTextField = UITextField()
    let memoriaTextView = UITextView()
    let cabuetarButton = UIButton(configuration: .filled())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchy()
        setViewsAttributes()
        setViewsConstraints()
        
        nomeTextField.delegate = self
        memoriaTextView.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy() {
        addSubview(backgroundView)
        addSubview(stackView)
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(bodyStackView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(subtitleLabel)
        
        bodyStackView.addArrangedSubview(bodyContainer)
        bodyContainer.addSubview(nomeTextField)
        bodyContainer.addSubview(memoriaTextView)
        bodyContainer.addSubview(cabuetarButton)
        
    }
    
    func setViewsAttributes(){
        
        backgroundView.contentMode = .scaleAspectFill
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        headerStackView.axis = .vertical
        headerStackView.spacing = 5
        headerStackView.contentMode = .left
        
        bodyStackView.axis = .vertical
        bodyStackView.backgroundColor = .white
        bodyStackView.contentMode = .scaleAspectFit
        bodyStackView.layer.masksToBounds = true
        bodyStackView.layer.cornerRadius = 20
        
        titleLabel.textColor = .white
        titleLabel.text = "Cabueta aí!"
        
        subtitleLabel.textColor = .white
        subtitleLabel.text = "Dá teu buzu do que rolou na festa"
        
        nomeTextField.placeholder = "Seu nome"
        nomeTextField.layer.masksToBounds = true
        nomeTextField.layer.cornerRadius = 10
        nomeTextField.backgroundColor = .lightGray
        nomeTextField.textColor = .secondaryLabel
        
        memoriaTextView.layer.masksToBounds = true
        memoriaTextView.layer.cornerRadius = 10
        memoriaTextView.backgroundColor = .lightGray
        memoriaTextView.text = "O que o aniversariante deveria saber? Fato engraçado que poucos viram?"
        memoriaTextView.textColor = .secondaryLabel
        
        cabuetarButton.setTitle("Cabuetar!", for: .normal)
        cabuetarButton.tintColor = .purple
        cabuetarButton.setTitleColor(.white, for: .normal)
        cabuetarButton.layer.masksToBounds = true
        cabuetarButton.layer.cornerRadius = 10
        
    }
    
    func setViewsConstraints() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: topAnchor),
                                     backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                     ])
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headerStackView.topAnchor.constraint(equalTo: stackView.topAnchor),
                                     headerStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                                     headerStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                                     headerStackView.heightAnchor.constraint(equalToConstant: 58)
                                    ])
        
        
        
        bodyContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bodyContainer.topAnchor.constraint(equalTo: bodyStackView.topAnchor),
//                                     bodyContainer.bottomAnchor.constraint(equalTo: bodyStackView.bottomAnchor),
//                                     bodyContainer.heightAnchor.constraint(equalToConstant: 400)
                                    ])
        
        nomeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([nomeTextField.topAnchor.constraint(equalTo: bodyContainer.topAnchor, constant: 24),
                                     nomeTextField.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 39),
                                     nomeTextField.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: -39),
                                     nomeTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        memoriaTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([memoriaTextView.topAnchor.constraint(equalTo: nomeTextField.bottomAnchor, constant: 16),
                                     memoriaTextView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 39),
                                     memoriaTextView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: -39),
                                     memoriaTextView.heightAnchor.constraint(equalToConstant: 184)
                                     
        ])
        
        cabuetarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cabuetarButton.topAnchor.constraint(equalTo: memoriaTextView.bottomAnchor, constant: 112),
                                     cabuetarButton.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 39),
                                     cabuetarButton.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: -39),
                                     cabuetarButton.heightAnchor.constraint(equalToConstant: 48),
//                                     cabuetarButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 96)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 32)
        ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([subtitleLabel.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 32)
        ])
    }
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ContaMemoriaView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ContaMemoriaView().showPreview().previewDevice("iPhone SE (3rd generation)")
            ContaMemoriaView().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

extension ContaMemoriaView: UITextFieldDelegate, UITextViewDelegate {
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return textField.resignFirstResponder()
    
        }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        return textView.resignFirstResponder()

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if memoriaTextView.textColor == UIColor.secondaryLabel {
            memoriaTextView.text = nil
            memoriaTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if memoriaTextView.text.isEmpty {
            memoriaTextView.text = "O que o aniversariante deveria saber? Fato engraçado que poucos viram?"
            memoriaTextView.textColor = UIColor.secondaryLabel
        }
    }
}
