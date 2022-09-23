//
//  PopUpErro.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 18/09/22.
//

import UIKit

class PopUp: UIView {
    
    let titleLabel = UILabel()
    let titleLabelContainer = UIView()
    let subtitleLabel = UILabel()
    let subtitleLabelContainer = UIView()
    let closeButton = UIButton(configuration: .plain())
    let closeButtonContainer = UIView()
    let gerarCodigoButton = UIButton(configuration: .filled())
    let gerarCodigoContainer = UIView()
    
    let stackView = UIStackView()

    
    @objc fileprivate func animatedOut() {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.stackView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
                self.alpha = 0
            }) { (complete) in
                if complete {
                    self.removeFromSuperview()
                }
            
        }
    }
    
    @objc fileprivate func animatedIn() {
        self.stackView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.stackView.transform = .identity
                self.alpha = 1
            })
            
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animatedOut)))
//        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        
        setViewHierarchy()
        setViewsAttributes()
        setConstraints()
        
        animatedIn()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy(){
        closeButtonContainer.addSubview(closeButton)
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subtitleLabel)
        gerarCodigoContainer.addSubview(gerarCodigoButton)
        
        stackView.addArrangedSubview(closeButtonContainer)
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(subtitleLabelContainer)
        stackView.addArrangedSubview(gerarCodigoContainer)
        
        addSubview(stackView)
    }
    
    func setViewsAttributes(){
        
        stackView.axis = .vertical
        stackView.contentMode = .center
        stackView.spacing = 30
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 20
        stackView.distribution = .fill
        stackView.backgroundColor = .white
        self.backgroundColor = .onboardingPurple
        
        titleLabel.contentMode = .left
        titleLabel.text = "Obrigade por /n compartilhar!"
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        titleLabel.font = UIFont.customFont(type: .bold, size: 24)
        
        
        subtitleLabel.contentMode = .left
        subtitleLabel.text = "Você desbloqueou uma salinha secreta para fofocar sobre seu aniversário. Gere seu código e compartilhe com seus amigos."
        subtitleLabel.textColor = .label
        subtitleLabel.numberOfLines = 0
        subtitleLabel.sizeToFit()
        subtitleLabel.font = UIFont.customFont(type: .regular, size: 16)
        
        
        
        
        closeButton.contentMode = .topRight
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        gerarCodigoButton.contentMode = .center
        gerarCodigoButton.setTitle("Gerar código", for: .normal)
        gerarCodigoButton.tintColor = .purple
        gerarCodigoButton.setTitleColor(.white, for: .normal)
        gerarCodigoButton.titleLabel?.font = UIFont.customFont(type: .regular, size: 12)
        
        titleLabelContainer.contentMode = .left
        subtitleLabelContainer.contentMode = .scaleAspectFill
        closeButtonContainer.contentMode = .topRight
        gerarCodigoContainer.contentMode = .center
    }
    
    func setConstraints(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8 ),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45)

        ])
        

        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([closeButton.trailingAnchor.constraint(equalTo: closeButtonContainer.trailingAnchor)])
        
        subtitleLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([subtitleLabelContainer.heightAnchor.constraint(equalTo: subtitleLabel.heightAnchor, constant: 10),
                                     subtitleLabelContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
                                     subtitleLabelContainer.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10)
                                    ])
        
        titleLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleLabelContainer.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, constant: 10),
                                     titleLabelContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
                                     titleLabelContainer.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10)
                                    ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor),
                                     subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor),
                                     subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor),
                                     subtitleLabel.bottomAnchor.constraint(equalTo: gerarCodigoButton.topAnchor, constant: -30)
                                    ])
        
        gerarCodigoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([gerarCodigoButton.centerXAnchor.constraint(equalTo: gerarCodigoContainer.centerXAnchor),
                                     gerarCodigoButton.bottomAnchor.constraint(equalTo: gerarCodigoContainer.bottomAnchor, constant: -50)
                                     
        ])
}
}
// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PopUpView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            PopUp().showPreview().previewDevice("iPhone SE (3rd generation)")
            PopUp().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
