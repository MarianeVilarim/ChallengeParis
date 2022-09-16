//
//  PedeCodigoView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 14/09/22.
//

import UIKit
import SwiftUI

class PedeCodigoView: UIView {
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let whiteView = UIView()
    let compartilharRoleButton = UIButton(configuration: .filled())
    let tenhoCodigoButton = UIButton(configuration: .plain())
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    
    let compartilharRoleButtonContainer = UIView()
    let tenhoCodigoButtonContainer = UIView()
    
    let headerStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
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
        
        compartilharRoleButtonContainer.addSubview(compartilharRoleButton)
        compartilharRoleButtonContainer.addSubview(tenhoCodigoButton)
        buttonsStackView.addArrangedSubview(compartilharRoleButtonContainer)

       
    }

    func setupViewsAttributes() {
        
        backgroundView.contentMode = .scaleAspectFill
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 50
        stackView.distribution = .fillEqually
        
        headerStackView.axis = .vertical
        headerStackView.alignment = .fill
        headerStackView.spacing = 1
        headerStackView.distribution = .fillEqually

        
        titleLabel.text = "Fala para a galera!"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        
        subtitleLabel.text = "Inspire outras pessoas contando sobre o seu dia especial e ganhe um espaço para registrar as memórias dos amigos"
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
        compartilharRoleButton.setTitle("Compartilhar meu rolê!", for: .normal)
        compartilharRoleButton.setTitleColor(.white, for: .normal)
        compartilharRoleButton.titleLabel?.tintColor = .white
    
        var  configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        compartilharRoleButton.configuration = configuration
//
        tenhoCodigoButton.tintColor = .white
        tenhoCodigoButton.setTitle("Tenho um código", for: .normal)
        tenhoCodigoButton.setTitleColor(.purple, for: .normal)
        tenhoCodigoButton.backgroundColor = .white
        
//

//

//
//        headerStackView.contentMode = .scaleAspectFit
//        buttonsStackView.contentMode = .scaleAspectFit
//

//
//        whiteView.backgroundColor = .white
//
//        compartilharRoleButton.contentMode = .scaleAspectFit
//        tenhoCodigoButton.contentMode = .scaleAspectFit
//        titleLabel.contentMode = .scaleAspectFit
//        subtitleLabel.contentMode = .scaleAspectFit



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
                                     stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
        
        compartilharRoleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compartilharRoleButton.leadingAnchor.constraint(equalTo: compartilharRoleButtonContainer.leadingAnchor),
            compartilharRoleButton.trailingAnchor.constraint(equalTo: compartilharRoleButtonContainer.trailingAnchor),
            compartilharRoleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        tenhoCodigoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tenhoCodigoButton.leadingAnchor.constraint(equalTo: compartilharRoleButtonContainer.leadingAnchor),
            tenhoCodigoButton.trailingAnchor.constraint(equalTo: compartilharRoleButtonContainer.trailingAnchor),
            tenhoCodigoButton.heightAnchor.constraint(equalToConstant: 48),
            tenhoCodigoButton.topAnchor.constraint(equalTo: compartilharRoleButton.bottomAnchor, constant: 8)
        ])
        
//
//        tenhoCodigoButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tenhoCodigoButton.widthAnchor.constraint(equalToConstant: 200),
//            tenhoCodigoButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
       


    }

}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PedeCodigoView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            PedeCodigoView().showPreview().previewDevice("iPhone SE (3rd generation)")
            PedeCodigoView().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif


