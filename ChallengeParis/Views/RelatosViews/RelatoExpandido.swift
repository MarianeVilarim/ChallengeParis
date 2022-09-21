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
//    let subtitleLabel = UILabel()
    let autorRelato = UILabel()
    let idadeAutor = UILabel()
    let relatoTexto = UILabel()


    
    let whiteView = UIView()
//    let compartilharRoleButton = UIButton(configuration: .filled())
    
    let imageContainer = UIView()
//    let subtitleLabelContainer = UIView()
    
    let compartilharRoleButtonContainer = UIView()
    
    let headerStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
    let precoBaratoButton = UIButton(configuration: .plain())
    let precoMedioButton = UIButton(configuration: .plain())
    let precoCaroButton = UIButton(configuration: .plain())
    // let precosContainer = UIView()
    let precosStackView = UIStackView()
//
//    let nomeAutor = UITextField()
////    let idadeAutor = UITextField()
    let tituloAniversario = UITextField()
    let localAniversario = UITextField()
    
    let categoriaAniversario = UIPickerView()
    let categoriaTextField = UITextField()
    
    let categorias = ["Restaurante", "Praia", "Bar", "Cultural", "Casa", "Parque/Ar livre"]
    
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let iCloud = CloudKitViewController()

   

    
    let arrayPrecos = ["Barato", "Medio", "Caro"]
    
    
    
    
    
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
        contentView.addSubview(buttonsStackView)
        
        
        
        buttonsStackView.backgroundColor = .white
        
        headerStackView.addArrangedSubview(imageContainer)
        
        precosStackView.addArrangedSubview(precoBaratoButton)
        precosStackView.addArrangedSubview(precoMedioButton)
        precosStackView.addArrangedSubview(precoCaroButton)
        
        
        
        
        imageContainer.addSubview(imageRelato)
//        imageContainer.addSubview(subtitleLabel)
        
        compartilharRoleButtonContainer.addSubview(autorRelato)
        compartilharRoleButtonContainer.addSubview(idadeAutor)
        
        compartilharRoleButtonContainer.addSubview(precosStackView)
        compartilharRoleButtonContainer.addSubview(relatoTexto)

        
//        compartilharRoleButtonContainer.addSubview(nomeAutor)
        compartilharRoleButtonContainer.addSubview(tituloAniversario)
        compartilharRoleButtonContainer.addSubview(localAniversario)
        compartilharRoleButtonContainer.addSubview(categoriaTextField)
        
//        compartilharRoleButtonContainer.addSubview(compartilharRoleButton)
        //compartilharRoleButtonContainer.addSubview(testView)
        
        // compartilharRoleButtonContainer.addSubview(tenhoCodigoButton)
        buttonsStackView.addArrangedSubview(compartilharRoleButtonContainer)
        
        
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
        headerStackView.contentMode = .scaleAspectFit
//        headerStackView.backgroundColor = .white
        
        
        precosStackView.axis = .horizontal
        precosStackView.alignment = .fill
        precosStackView.spacing = 1
        precosStackView.distribution = .fillProportionally
        precosStackView.contentMode = .scaleAspectFit
        
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
        

        
        buttonsStackView.layer.masksToBounds = true
        buttonsStackView.layer.cornerRadius = -20
        
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 8
        //
        //
//        compartilharRoleButton.tintColor = .purple
//        compartilharRoleButton.setTitle("Compartilhar meu rolê!", for: .normal)
//        compartilharRoleButton.setTitleColor(.white, for: .normal)
//        compartilharRoleButton.titleLabel?.tintColor = .white
        
//        var  configuration = UIButton.Configuration.filled()
//        configuration.cornerStyle = .capsule
//        compartilharRoleButton.configuration = configuration
        
        
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
        
       
        
        
        
        precosStackView.distribution = .fillProportionally
        precosStackView.contentMode = .scaleAspectFit
        precosStackView.spacing = 1
        
        tituloAniversario.placeholder = "Título do relato"
        tituloAniversario.tintColor = .label
        tituloAniversario.textColor = .secondaryLabel
        tituloAniversario.textAlignment = .left
        tituloAniversario.layer.masksToBounds = true
        tituloAniversario.layer.cornerRadius = 10
        

        
        localAniversario.placeholder = "Local"
        localAniversario.tintColor = .label
        localAniversario.textColor = .secondaryLabel
        localAniversario.textAlignment = .left
        localAniversario.layer.masksToBounds = true
        localAniversario.layer.cornerRadius = 10
        
        
        categoriaTextField.placeholder = "Categoria"
        categoriaTextField.tintColor = .label
        categoriaTextField.textColor = .secondaryLabel
        categoriaTextField.textAlignment = .left
        categoriaTextField.layer.masksToBounds = true
        categoriaTextField.layer.cornerRadius = 10
        
        
        //
        
        relatoTexto.text = "relatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTextorelatoTexto"
        relatoTexto.textColor = .label
        relatoTexto.textAlignment = .justified
        relatoTexto.contentMode = .top
        relatoTexto.numberOfLines = 0
        relatoTexto.sizeToFit()
        relatoTexto.font?.withSize(12)
        
        
        scrollView.keyboardDismissMode = .onDrag
        
        
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
        NSLayoutConstraint.activate([headerStackView.heightAnchor.constraint(equalTo: imageRelato.heightAnchor),
                                     headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                     
                                    ])
        
        
        autorRelato.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([autorRelato.topAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: 21),
                                     autorRelato.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
                                     autorRelato.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -224),
                                     autorRelato.heightAnchor.constraint(equalToConstant: 39)
                                    ])
        
        
        idadeAutor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([idadeAutor.topAnchor.constraint(equalTo: autorRelato.bottomAnchor, constant: 8.14),
                                     idadeAutor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
                                     idadeAutor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -224),
                                     idadeAutor.heightAnchor.constraint(equalToConstant: 15)

                                     
                                    ])
        
        relatoTexto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([relatoTexto.topAnchor.constraint(equalTo: idadeAutor.bottomAnchor, constant: 10),
                                     relatoTexto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
                                     relatoTexto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//                                     relatoTexto.heightAnchor.constraint(equalToConstant: 205),
                                     relatoTexto.bottomAnchor.constraint(equalTo: precosStackView.topAnchor, constant: 24)
                                    ])
        
        precosStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([precosStackView.topAnchor.constraint(equalTo: relatoTexto.bottomAnchor, constant: 30),
                                     precosStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
                                     precosStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
                                     precosStackView.heightAnchor.constraint(equalToConstant: 30),
                                     precosStackView.bottomAnchor.constraint(equalTo: compartilharRoleButtonContainer.bottomAnchor, constant: -52)

                                    ])
        
//        nomeAutor.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([nomeAutor.topAnchor.constraint(equalTo: precosStackView.bottomAnchor, constant: 24),
//                                     nomeAutor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     nomeAutor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
//
//                                    ])
        
//
//        tituloAniversario.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([tituloAniversario.topAnchor.constraint(equalTo: idadeAutor.bottomAnchor, constant: 24),
//                                     tituloAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     tituloAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
//
//                                    ])
        
//        localAniversario.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([localAniversario.topAnchor.constraint(equalTo: tituloAniversario.bottomAnchor, constant: 24),
//                                     localAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     localAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
//                                    ])
        
        
//        categoriaTextField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([categoriaTextField.topAnchor.constraint(equalTo: localAniversario.bottomAnchor, constant: 24),
//                                     categoriaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     categoriaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
//                                    ])
        
        
        
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttonsStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
                                     buttonsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     buttonsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     buttonsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                                    ])
        
        
        
        compartilharRoleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compartilharRoleButtonContainer.topAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: 52),
            compartilharRoleButtonContainer.widthAnchor.constraint(equalToConstant: 304),
            compartilharRoleButtonContainer.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 52)
        ])
        
//        compartilharRoleButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            compartilharRoleButton.topAnchor.constraint(equalTo: relatoTexto.bottomAnchor, constant: 24),
//            compartilharRoleButton.leadingAnchor.constraint(equalTo: compartilharRoleButtonContainer.leadingAnchor),
//            compartilharRoleButton.trailingAnchor.constraint(equalTo: compartilharRoleButtonContainer.trailingAnchor),
//            compartilharRoleButton.heightAnchor.constraint(equalToConstant: 48),
//            compartilharRoleButton.bottomAnchor.constraint(equalTo: compartilharRoleButtonContainer.bottomAnchor, constant: -52)
//        ])
//
        
        
        
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
    
    func definePreco() -> String {
        if precoBaratoButton.isSelected {
            return arrayPrecos[0]

        } else if precoMedioButton.isSelected {
            return arrayPrecos[1]

        }else if precoCaroButton.isSelected {
            return arrayPrecos[2]

    }
        return arrayPrecos[1]
    }
    
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

