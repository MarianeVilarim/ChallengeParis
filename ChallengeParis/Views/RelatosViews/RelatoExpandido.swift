//
//  RelatoExpandido.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 20/09/22.
//

import UIKit

class RelatoExpandido: UIView {
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    
    let imageRelato = UIImageView()
    let imageContainer = UIView()
    let headerStackView = UIStackView()
    
    let secondStackView = UIStackView()
    
    let secondStackContainer = UIView()

    
    let autorRelato = UILabel()
    let idadeAutor = UILabel()
    let relatoTexto = UILabel()
    let buttonsStackView = UIStackView()
    let localButton = UIButton(configuration: .filled())
    let categoriaButton = UIButton(configuration: .filled())
    let precoButton = UIButton(configuration: .filled())

    let scrollView = UIScrollView()
    let contentView = UIView()
    let buttonsContainer = UIView()
        
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        categoriaButton.titleLabel?.font = UIFont.customFont(type: .regular, size: 12)
        localButton.titleLabel?.font = UIFont.customFont(type: .regular, size: 12)
        precoButton.titleLabel?.font = UIFont.customFont(type: .regular, size: 12)
        
//        relatoTexto.delegate = self
        
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewsHierarchy() {
        addSubview(backgroundView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerStackView)
        contentView.addSubview(secondStackContainer)
        
        secondStackContainer.addSubview(secondStackView)
       
        headerStackView.addArrangedSubview(imageContainer)
        imageContainer.addSubview(imageRelato)
        
        
        secondStackView.addArrangedSubview(autorRelato)
        secondStackView.addArrangedSubview(idadeAutor)
        secondStackView.addArrangedSubview(relatoTexto)
        secondStackView.addArrangedSubview(buttonsContainer)
        
        
        buttonsStackView.addArrangedSubview(localButton)
        buttonsStackView.addArrangedSubview(categoriaButton)
        buttonsStackView.addArrangedSubview(precoButton)
        
        buttonsContainer.addSubview(buttonsStackView)
        
//        compartilharRoleButtonContainer.addSubview(nomeAutor)
//        relatoContainer.addSubview(tituloAniversario)
//        relatoContainer.addSubview(localAniversario)
//        relatoContainer.addSubview(categoriaTextField)
        
//        compartilharRoleButtonContainer.addSubview(compartilharRoleButton)
        //compartilharRoleButtonContainer.addSubview(testView)
        
        // compartilharRoleButtonContainer.addSubview(tenhoCodigoButton)
        
        
    }
    
    func setupViewsAttributes() {

        backgroundView.contentMode = .scaleAspectFill
        
        //            stackView.axis = .vertical
        //            stackView.alignment = .fill
        //            //stackView.spacing = 50
        //            stackView.distribution = .fillEqually
        //            stackView.backgroundColor = .green
        
        headerStackView.axis = .vertical
        headerStackView.alignment = .fill
        headerStackView.spacing = 0
        headerStackView.distribution = .fillProportionally
        headerStackView.layer.masksToBounds = true
        headerStackView.layer.cornerRadius = -20
        headerStackView.contentMode = .bottomLeft
//        headerStackView.backgroundColor = .white
        
        
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 5
        buttonsStackView.distribution = .fillProportionally
        
        
        secondStackView.axis = .vertical
        secondStackView.alignment = .leading
        secondStackView.distribution = .fillProportionally
        secondStackView.backgroundColor = .white
        secondStackView.spacing = 10
        
        imageRelato.contentMode = .scaleAspectFit
        imageRelato.image = UIImage(named: "Tres")
        
        autorRelato.contentMode = .top
        autorRelato.text = "autorRelato"
        autorRelato.font = UIFont.customFont(type: .bold, size: 14)

        autorRelato.textColor = .label
        autorRelato.textAlignment = .left
        autorRelato.font.withSize(14)
        
        idadeAutor.contentMode = .top
        idadeAutor.font = UIFont.customFont(type: .bold, size: 11)

        idadeAutor.text = "idadeAutor"
        idadeAutor.textColor = .label
        idadeAutor.textAlignment = .left
        idadeAutor.font.withSize(11)
        
        relatoTexto.text = "relatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTexto"
        relatoTexto.textColor = .label
        relatoTexto.textAlignment = .natural
        relatoTexto.font = UIFont.customFont(type: .regular, size: 12)
        relatoTexto.contentMode = .top
        relatoTexto.numberOfLines = 0
        relatoTexto.sizeToFit()
        relatoTexto.font?.withSize(12)


        
            
        
        localButton.setTitle("Local", for: .normal)
        localButton.titleLabel?.font = UIFont.customFont(type: .bold, size: 10)
        localButton.backgroundColor = .clear
        localButton.layer.borderColor = UIColor(red: 74/255, green: 218/255, blue: 163/225, alpha: 1).cgColor
        localButton.layer.borderWidth = 1
        

        localButton.tintColor = .clear
        localButton.layer.borderWidth = 1
        localButton.layer.masksToBounds = true
        localButton.layer.cornerRadius = 10
        localButton.setTitleColor(.label, for: .normal)
        localButton.setTitleShadowColor(.lightGray, for: .selected)
        localButton.contentMode = .scaleAspectFit
        
        categoriaButton.setTitle("Categoria", for: .normal)
        categoriaButton.titleLabel?.font = UIFont.customFont(type: .bold, size: 10)
        categoriaButton.layer.borderColor = UIColor(red: 74/255, green: 218/255, blue: 163/225, alpha: 1).cgColor
        categoriaButton.backgroundColor = .clear
        categoriaButton.tintColor = .white
        categoriaButton.layer.borderWidth = 1
        categoriaButton.layer.masksToBounds = true
        categoriaButton.layer.cornerRadius = 10
        categoriaButton.setTitleColor(.label, for: .normal)
        categoriaButton.contentMode = .scaleAspectFit
        categoriaButton.titleLabel?.font = UIFont.customFont(type: .regular, size: 12)
        
        
        precoButton.setTitle("$$", for: .normal)
        precoButton.titleLabel?.font = UIFont.customFont(type: .bold, size: 10)
        precoButton.layer.borderColor = UIColor(red: 74/255, green: 218/255, blue: 163/225, alpha: 1).cgColor

        precoButton.tintColor = .clear
        precoButton.layer.borderWidth = 1
        precoButton.layer.masksToBounds = true
        precoButton.layer.cornerRadius = 10
        precoButton.setTitleColor(.label, for: .normal)
        precoButton.setTitleShadowColor(.lightGray, for: .selected)
        precoButton.contentMode = .scaleAspectFit
        
  
        scrollView.keyboardDismissMode = .onDrag
        
        secondStackContainer.backgroundColor = .white
        secondStackContainer.layer.masksToBounds = true
        secondStackContainer.layer.cornerRadius = 10
        
        
    }
    
    func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: topAnchor),
                                     backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                     buttonsStackView.heightAnchor.constraint(equalToConstant: 30),
                                     buttonsStackView.bottomAnchor.constraint(equalTo: buttonsContainer.bottomAnchor, constant: -40),
                                     buttonsStackView.topAnchor.constraint(equalTo: buttonsContainer.topAnchor, constant: 40)
        
        ])
        imageRelato.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageRelato.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            imageRelato.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            imageRelato.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            //            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: )
        ])
        
        
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headerStackView.heightAnchor.constraint(equalToConstant: 300),
                                     headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                     
                                    ])
        secondStackContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([secondStackContainer.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant:  -30),
                                     secondStackContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     secondStackContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     secondStackContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([secondStackView.topAnchor.constraint(equalTo: secondStackContainer.topAnchor, constant: 30),
                                     secondStackView.trailingAnchor.constraint(equalTo: secondStackContainer.trailingAnchor, constant: -28),
                                     secondStackView.leadingAnchor.constraint(equalTo: secondStackContainer.leadingAnchor, constant: 28),
                                     secondStackView.bottomAnchor.constraint(equalTo: secondStackContainer.bottomAnchor)
        ])
        
 
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     scrollView.widthAnchor.constraint(equalTo: widthAnchor),
                                     scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                                    ])
        
        NSLayoutConstraint.activate([contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
                                    ])
        
        
    
    }
    
    func generateRandomNumber() -> Int {
        let randomInt = Int.random(in: 0..<100000)
        return randomInt
        

    }
    
    func turnRandomNumberIntoString() -> String {
        let randomNumber = generateRandomNumber()
        return String(randomNumber)
    }
    
    func buttonSelection() {
        if localButton.isSelected {
            categoriaButton.isSelected = false
            precoButton.isSelected = false
            
        } else if categoriaButton.isSelected {
            localButton.isSelected = false
            precoButton.isSelected = false


        }else if precoButton.isSelected {
            localButton.isSelected = false
            categoriaButton.isSelected = false


    }
    }
    
//    func definePreco() -> String {
//        if precoBaratoButton.isSelected {
//            return arrayPrecos[0]
//
//        } else if precoMedioButton.isSelected {
//            return arrayPrecos[1]
//
//        }else if precoCaroButton.isSelected {
//            return arrayPrecos[2]
//
//    }
//        return arrayPrecos[1]
//    }
    
//    private func setupAdditionalConfiguration() {
//        //MARK: - Outras configurações
//        compartilharRoleButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
//    }
//
    @objc func tappedButton (sender: UIButton) {
        print("apertou o botão")
//        constructRelato()
    }
    
//    func constructRelato(){
//        var relato = Relatos()
//        relato.tituloRelato = tituloAniversario.text
//        relato.relatoTexto = relatoTexto.text
//        relato.codigo = turnRandomNumberIntoString()
//        relato.categoria = categoriaTextField.text
//        buttonSelection()
//        relato.preco = definePreco()
//        relato.Autor = nomeAutor.text
//        relato.idadeAutor = idadeAutor.text
//        relato.curtidas = 0
//        iCloud.AddRelato(relato: relato)
//
//
//    }
}
// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct RelatoExpandido_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            RelatoExpandido().showPreview().previewDevice("iPhone SE (3rd generation)")
            RelatoExpandido().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
   }

}
#endif

