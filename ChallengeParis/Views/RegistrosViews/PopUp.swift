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
    let closeButton = UIButton(configuration: .filled())
    let closeButtonContainer = UIView()
    let gerarCodigoButton = UIButton(configuration: .filled())
    let gerarCodigoContainer = UIView()
    
    let stackView = UIStackView()

    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.frame = UIScreen.main.bounds
        
        setViewHierarchy()
        setViewsAttributes()
        setConstraints()
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
        
    }
    
    func setViewsAttributes(){
        
        stackView.axis = .vertical
        stackView.contentMode = .scaleAspectFit
        stackView.spacing = 50
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 20
        
        titleLabel.contentMode = .left
        titleLabel.text = "Obrigade por compartilhar!"
        titleLabel.textColor = .label
        
        subtitleLabel.contentMode = .left
        subtitleLabel.text = "Você desbloqueou uma salinha secreta para fofocar sobre seu aniversário. Gere seu código e compartilhe com seus amigos."
        subtitleLabel.textColor = .label
        subtitleLabel.numberOfLines = 0
        subtitleLabel.sizeToFit()
        
        closeButton.contentMode = .topRight
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        gerarCodigoButton.contentMode = .center
        gerarCodigoButton.setTitle("Gerar código", for: .normal)
        gerarCodigoButton.tintColor = .purple
        gerarCodigoButton.setTitleColor(.white, for: .normal)
        
        titleLabelContainer.contentMode = .scaleAspectFit
        subtitleLabelContainer.contentMode = .scaleAspectFit
        closeButtonContainer.contentMode = .scaleAspectFit
        gerarCodigoContainer.contentMode = .scaleAspectFit
    }
    
    func setConstraints(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     stackView.heightAnchor.constraint(equalToConstant: 392),
                                     stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                                     stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([titleLabelContainer.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 40)
//                                    
//        ])
//        
//        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([subtitleLabelContainer.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 40)
//                                    
//        ])
//        
//        gerarCodigoButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([gerarCodigoContainer.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 40)
//                                    
//        ])
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
