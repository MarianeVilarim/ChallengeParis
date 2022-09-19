//
//  DigitaCodigoView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 14/09/22.
//

import UIKit

class DigitaCodigoView: UIView {
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let whiteView = UIView()
    let compartilharRoleButton = UIButton(configuration: .filled())
  
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    
    let compartilharRoleButtonContainer = UIView()
    let tenhoCodigoButtonContainer = UIView()
    
    let headerStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
    let displayCodigo = UITextField()
    let codigoEBotaoStackView = UIStackView()
    
    let fecharECodigoStackView = UIStackView()
    
    let stackView = UIStackView()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewsHierarchy() {
        addSubview(backgroundView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(buttonsStackView)
        
        buttonsStackView.backgroundColor = .white
        
        headerStackView.addArrangedSubview(titleLabelContainer)
        
        
        titleLabelContainer.addSubview(titleLabel)
        titleLabelContainer.addSubview(subtitleLabel)
        
        codigoEBotaoStackView.addArrangedSubview(displayCodigo)
//        codigoEBotaoStackView.addArrangedSubview(copiaCodigoButton)
    
        compartilharRoleButtonContainer.addSubview(fecharECodigoStackView)
        
        buttonsStackView.addArrangedSubview(compartilharRoleButtonContainer)
        
        fecharECodigoStackView.addArrangedSubview(codigoEBotaoStackView)
        
        fecharECodigoStackView.addArrangedSubview(compartilharRoleButton)
    }
    
    func setupViewsAttributes() {
        
        backgroundView.contentMode = .scaleAspectFill
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        
        headerStackView.axis = .vertical
        headerStackView.alignment = .fill
        headerStackView.spacing = 1
        headerStackView.distribution = .fillEqually
        
        
        titleLabel.text = "Digite seu código!"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        
        subtitleLabel.text = "Chegou a hora de cabuetar o rolê"
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 0
        subtitleLabel.sizeToFit()
        subtitleLabel.textAlignment = .left
        subtitleLabel.font = .preferredFont(forTextStyle: .body)
        
        buttonsStackView.layer.masksToBounds = true
        buttonsStackView.layer.cornerRadius = 20
        
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 8
        //
        //
        compartilharRoleButton.tintColor = .purple
        compartilharRoleButton.setTitle("Entrar", for: .normal)
        compartilharRoleButton.setTitleColor(.white, for: .normal)
        compartilharRoleButton.titleLabel?.tintColor = .white
//
//        var  configuration = UIButton.Configuration.filled()
//        configuration.cornerStyle = .capsule
//        compartilharRoleButton.configuration = configuration
        //
//        tenhoCodigoButton.tintColor = .white
//        tenhoCodigoButton.setTitle("Tenho um código", for: .normal)
//        tenhoCodigoButton.setTitleColor(.purple, for: .normal)
//        tenhoCodigoButton.backgroundColor = .white
        
//        displayCodigo.text = defineCodigo()
        displayCodigo.placeholder = "  Digita aqui teu código"
        displayCodigo.textColor = .secondaryLabel
        displayCodigo.textAlignment = .justified
        displayCodigo.contentMode = .scaleAspectFit
//        displayCodigo.backgroundColor = .gray
        
        
        
//
//
//        copiaCodigoButton.setImage(UIImage(named: "paste"), for: .normal)
//        copiaCodigoButton.setTitleColor(.purple, for: .normal)
//        copiaCodigoButton.contentMode = .scaleAspectFill
//        copiaCodigoButton.backgroundColor = .gray
        
        codigoEBotaoStackView.spacing = 1
        codigoEBotaoStackView.axis = .horizontal
        codigoEBotaoStackView.alignment = .center
        codigoEBotaoStackView.contentMode = .scaleAspectFit
        codigoEBotaoStackView.backgroundColor = .lightGray
        codigoEBotaoStackView.layer.masksToBounds = true
        codigoEBotaoStackView.layer.cornerRadius = 8
        
        fecharECodigoStackView.spacing = 84
        fecharECodigoStackView.axis = .vertical
        fecharECodigoStackView.alignment = .fill
        
    }
    
    func defineCodigo() -> String {
        let codigo = "aeiou123"
        return "  \(codigo)"
    }
    
    func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: topAnchor),
                                     backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                                    ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -74)
        ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
            
        ])
        
        compartilharRoleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compartilharRoleButtonContainer.topAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: 52),
            compartilharRoleButtonContainer.widthAnchor.constraint(equalToConstant: 304),
            compartilharRoleButtonContainer.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: -52)
        ])
        
        
        codigoEBotaoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([codigoEBotaoStackView.topAnchor.constraint(equalTo: compartilharRoleButtonContainer.topAnchor, constant: 16)
                                  
//                                     codigoEBotaoStackView.bottomAnchor.constraint(equalTo: compartilharRoleButton.topAnchor, constant: 104)
        ])
        
        
        fecharECodigoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([fecharECodigoStackView.topAnchor.constraint(equalTo: compartilharRoleButtonContainer.topAnchor, constant: 106),
                                     fecharECodigoStackView.leadingAnchor.constraint(equalTo: compartilharRoleButtonContainer.leadingAnchor, constant: 43),
                                     fecharECodigoStackView.trailingAnchor.constraint(equalTo: compartilharRoleButtonContainer.trailingAnchor, constant: -43)
                                     
                                    
            ])
        
        displayCodigo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([displayCodigo.heightAnchor.constraint(equalToConstant: 40)])
        

        
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DigitaCodigoView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            DigitaCodigoView().showPreview().previewDevice("iPhone SE (3rd generation)")
            DigitaCodigoView().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif





 


