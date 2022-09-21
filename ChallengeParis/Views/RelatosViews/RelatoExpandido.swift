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
    let precoBaratoButton = UIButton(configuration: .plain())
    let precoMedioButton = UIButton(configuration: .plain())
    let precoCaroButton = UIButton(configuration: .plain())

    let scrollView = UIScrollView()
    let contentView = UIView()
        
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
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
        secondStackView.addArrangedSubview(buttonsStackView)
        
        
        buttonsStackView.addArrangedSubview(precoBaratoButton)
        buttonsStackView.addArrangedSubview(precoMedioButton)
        buttonsStackView.addArrangedSubview(precoCaroButton)

        
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
        buttonsStackView.spacing = 1
        buttonsStackView.distribution = .fillProportionally
        
        
        secondStackView.axis = .vertical
        secondStackView.alignment = .fill
        secondStackView.distribution = .fillProportionally
        secondStackView.backgroundColor = .white
        secondStackView.spacing = 10
        
        imageRelato.contentMode = .scaleAspectFill
        imageRelato.image = UIImage(named: "Image")
        
        autorRelato.contentMode = .top
        autorRelato.text = "autorRelato"
        autorRelato.textColor = .label
        autorRelato.textAlignment = .left
        autorRelato.font.withSize(14)
        
        idadeAutor.contentMode = .top
        idadeAutor.text = "idadeAutor"
        idadeAutor.textColor = .label
        idadeAutor.textAlignment = .left
        idadeAutor.font.withSize(11)
        
        relatoTexto.text = "relatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTexto"
        relatoTexto.textColor = .label
        relatoTexto.textAlignment = .justified
        relatoTexto.contentMode = .top
        relatoTexto.numberOfLines = 0
        relatoTexto.sizeToFit()
        relatoTexto.font?.withSize(12)


        
            
        
        precoBaratoButton.setTitle("Local", for: .normal)
        precoBaratoButton.tintColor = .white
        precoBaratoButton.layer.borderWidth = 1
        precoBaratoButton.layer.masksToBounds = true
        precoBaratoButton.layer.cornerRadius = 10
        precoBaratoButton.setTitleColor(.label, for: .normal)
        precoBaratoButton.setTitleShadowColor(.lightGray, for: .selected)
        precoBaratoButton.contentMode = .scaleAspectFit
        
        precoMedioButton.setTitle("Categoria", for: .normal)
        precoMedioButton.tintColor = .white
        precoMedioButton.layer.borderWidth = 1
        precoMedioButton.layer.masksToBounds = true
        precoMedioButton.layer.cornerRadius = 10
        precoMedioButton.setTitleColor(.label, for: .normal)
        precoMedioButton.setTitleShadowColor(.lightGray, for: .selected)
        precoMedioButton.contentMode = .scaleAspectFit
        
        
        precoCaroButton.setTitle("$$", for: .normal)
        precoCaroButton.tintColor = .white
        precoCaroButton.layer.borderWidth = 1
        precoCaroButton.layer.masksToBounds = true
        precoCaroButton.layer.cornerRadius = 10
        precoCaroButton.setTitleColor(.label, for: .normal)
        precoCaroButton.setTitleShadowColor(.lightGray, for: .selected)
        precoCaroButton.contentMode = .scaleAspectFit
        
  
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
        
        
        
        imageRelato.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageRelato.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            imageRelato.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            imageRelato.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            //            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: )
        ])
        
        
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headerStackView.heightAnchor.constraint(equalToConstant: 150),
                                     headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                     
                                    ])
        secondStackContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([secondStackContainer.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant:  -10),
                                     secondStackContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     secondStackContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     secondStackContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30)
        ])
        
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([secondStackView.topAnchor.constraint(equalTo: secondStackContainer.topAnchor, constant: 10),
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
        if precoBaratoButton.isSelected {
            precoMedioButton.isSelected = false
            precoCaroButton.isSelected = false
            
        } else if precoMedioButton.isSelected {
            precoBaratoButton.isSelected = false
            precoCaroButton.isSelected = false


        }else if precoCaroButton.isSelected {
            precoBaratoButton.isSelected = false
            precoMedioButton.isSelected = false


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

