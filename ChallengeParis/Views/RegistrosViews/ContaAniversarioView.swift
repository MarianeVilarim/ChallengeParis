//
//  ContaAniversarioView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 14/09/22.
//

import UIKit

class ContaAniversarioView: UIView {
    
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let whiteView = UIView()
    let compartilharRoleButton = UIButton(configuration: .filled())
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    
    let compartilharRoleButtonContainer = UIView()
    
    let headerStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
    let precoBaratoButton = UIButton(configuration: .filled())
    let precoMedioButton = UIButton(configuration: .filled())
    let precoCaroButton = UIButton(configuration: .filled())
    // let precosContainer = UIView()
    let precosStackView = UIStackView()
    
    let nomeAutor = UITextField()
    let idadeAutor = UITextField()
    let tituloAniversario = UITextField()
    let localAniversario = UITextField()
    
    let categoriaAniversario = UIPickerView()
    let categoriaTextField = UITextField()
    
    let anexarImagemAniver = UIButton()
    let categorias = ["Restaurante", "Praia", "Bar", "Cultural", "Casa", "Parque/Ar livre"]
    
    let relatoTexto = UITextView()
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let iCloud = CloudKitViewController()

   

    
    let arrayPrecos = ["Barato", "Medio", "Caro"]
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        categoriaAniversario.dataSource = self
        categoriaAniversario.delegate = self
        categoriaTextField.inputView = categoriaAniversario
        
        tituloAniversario.delegate = self
        localAniversario.delegate = self
        categoriaTextField.delegate = self
        
        relatoTexto.delegate = self
        
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
        
        headerStackView.addArrangedSubview(titleLabelContainer)
        
        precosStackView.addArrangedSubview(precoBaratoButton)
        precosStackView.addArrangedSubview(precoMedioButton)
        precosStackView.addArrangedSubview(precoCaroButton)
        
        
        
        
        titleLabelContainer.addSubview(titleLabel)
        titleLabelContainer.addSubview(subtitleLabel)
        
        compartilharRoleButtonContainer.addSubview(anexarImagemAniver)
        compartilharRoleButtonContainer.addSubview(precosStackView)
        
        compartilharRoleButtonContainer.addSubview(nomeAutor)
        compartilharRoleButtonContainer.addSubview(idadeAutor)
        compartilharRoleButtonContainer.addSubview(tituloAniversario)
        compartilharRoleButtonContainer.addSubview(localAniversario)
        compartilharRoleButtonContainer.addSubview(categoriaTextField)
        compartilharRoleButtonContainer.addSubview(relatoTexto)
        
        compartilharRoleButtonContainer.addSubview(compartilharRoleButton)
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
        headerStackView.spacing = 1
        headerStackView.distribution = .fillProportionally
        
        precosStackView.axis = .horizontal
        precosStackView.alignment = .fill
        precosStackView.spacing = 42
        precosStackView.distribution = .fillEqually
        
        titleLabel.text = "Foi o seu aniversário"
        titleLabel.font = UIFont.customFont(type: .bold, size: 24)

        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        
        subtitleLabel.text = "Diz aí pra gente como foi tua festa"
        subtitleLabel.font = UIFont.customFont(type: .regular, size: 16)

        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 0
        subtitleLabel.sizeToFit()
        subtitleLabel.textAlignment = .left
        
        buttonsStackView.layer.masksToBounds = true
        buttonsStackView.layer.cornerRadius = 20
        
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 8
        //
        //
        compartilharRoleButton.tintColor = .onboardingPurple
        compartilharRoleButton.setTitle("Compartilhar meu rolê!", for: .normal)
        compartilharRoleButton.setTitleColor(.white, for: .normal)
        compartilharRoleButton.titleLabel?.tintColor = .white
        
        var  configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        compartilharRoleButton.configuration = configuration
        
        
        precoBaratoButton.setTitle("$", for: .normal)
        precoBaratoButton.tintColor = .onboardingPurple
        precoBaratoButton.setTitleColor(.white, for: .normal)
        precoBaratoButton.setTitleShadowColor(.lightGray, for: .selected)
        
        precoMedioButton.setTitle("$$", for: .normal)
        precoMedioButton.tintColor = .onboardingPurple
        precoMedioButton.setTitleColor(.white, for: .normal)
        
        precoCaroButton.setTitle("$$$", for: .normal)
        precoCaroButton.tintColor = .onboardingPurple
        precoCaroButton.setTitleColor(.white, for: .normal)
        
        anexarImagemAniver.setImage(UIImage(named: "Image"), for: .normal)
        
        precosStackView.distribution = .fillEqually
        precosStackView.spacing = 42
        
        tituloAniversario.placeholder = "Título do relato"
        tituloAniversario.tintColor = .onboardingPurple
        tituloAniversario.textColor = .secondaryLabel
        tituloAniversario.textAlignment = .left
        tituloAniversario.layer.masksToBounds = true
        tituloAniversario.layer.cornerRadius = 10
        tituloAniversario.font = UIFont.customFont(type: .regular, size: 15)

        
        nomeAutor.placeholder = "Seu nome"
        nomeAutor.font = UIFont.customFont(type: .regular, size: 15)

        nomeAutor.tintColor = .label
        nomeAutor.textColor = .secondaryLabel
        nomeAutor.textAlignment = .left
        nomeAutor.layer.masksToBounds = true
        nomeAutor.layer.cornerRadius = 10
//        nomeAutor.backgroundColor = .lightGray
        
        idadeAutor.placeholder = "Sua idade"
        idadeAutor.font = UIFont.customFont(type: .regular, size: 15)

        idadeAutor.tintColor = .label
        idadeAutor.textColor = .secondaryLabel
        idadeAutor.textAlignment = .left
        idadeAutor.layer.masksToBounds = true
        idadeAutor.layer.cornerRadius = 10
        
        localAniversario.placeholder = "Local"
        localAniversario.tintColor = .label
        localAniversario.textColor = .secondaryLabel
        localAniversario.textAlignment = .left
        localAniversario.layer.masksToBounds = true
        localAniversario.layer.cornerRadius = 10
        localAniversario.font = UIFont.customFont(type: .regular, size: 15)

        
        
        categoriaTextField.placeholder = "Categoria"
        categoriaTextField.tintColor = .label
        categoriaTextField.textColor = .secondaryLabel
        categoriaTextField.textAlignment = .left
        categoriaTextField.layer.masksToBounds = true
        categoriaTextField.layer.cornerRadius = 10
        categoriaTextField.font = UIFont.customFont(type: .regular, size: 15)

        
        
        //
        
        relatoTexto.tintColor = .label
        relatoTexto.textColor = .secondaryLabel
        relatoTexto.textAlignment = .left
        relatoTexto.contentMode = .scaleAspectFill
        relatoTexto.sizeToFit()
        relatoTexto.layer.masksToBounds = true
        relatoTexto.layer.cornerRadius = 10
        
        relatoTexto.text = "Comecei meu dia.../ Eu comi.../ Também me reuni com.../ Fomos a... /Mais tarde, ... "
        relatoTexto.textColor = UIColor.lightGray
        relatoTexto.font = UIFont.customFont(type: .regular, size: 15)

        
        scrollView.keyboardDismissMode = .onDrag
        
        
    }
    
    func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: topAnchor),
                                     backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -74),
            //            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: )
        ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
            
        ])
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headerStackView.heightAnchor.constraint(equalToConstant: 72),
                                     headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                     
                                    ])
        
        
        anexarImagemAniver.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([anexarImagemAniver.topAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: 24),
                                     anexarImagemAniver.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 67),
                                     anexarImagemAniver.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -67),
                                     anexarImagemAniver.heightAnchor.constraint(equalToConstant: 152)
                                    ])
        
        precosStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([precosStackView.topAnchor.constraint(equalTo: anexarImagemAniver.bottomAnchor, constant: 24),
                                     precosStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     precosStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
                                     
                                    ])
        
        nomeAutor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([nomeAutor.topAnchor.constraint(equalTo: precosStackView.bottomAnchor, constant: 24),
                                     nomeAutor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     nomeAutor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
                                     
                                    ])
        
        idadeAutor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([idadeAutor.topAnchor.constraint(equalTo: nomeAutor.bottomAnchor, constant: 24),
                                     idadeAutor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     idadeAutor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
                                     
                                    ])
        
        tituloAniversario.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tituloAniversario.topAnchor.constraint(equalTo: idadeAutor.bottomAnchor, constant: 24),
                                     tituloAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     tituloAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
                                     
                                    ])
        
        localAniversario.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([localAniversario.topAnchor.constraint(equalTo: tituloAniversario.bottomAnchor, constant: 24),
                                     localAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     localAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
                                    ])
        
        
        categoriaTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([categoriaTextField.topAnchor.constraint(equalTo: localAniversario.bottomAnchor, constant: 24),
                                     categoriaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     categoriaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
                                    ])
        
        relatoTexto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([relatoTexto.topAnchor.constraint(equalTo: categoriaTextField.bottomAnchor, constant: 24),
                                     relatoTexto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     relatoTexto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
                                     relatoTexto.heightAnchor.constraint(equalToConstant: 152),
                                     relatoTexto.bottomAnchor.constraint(equalTo: compartilharRoleButton.topAnchor, constant: 24)
                                    ])
        
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttonsStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
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
        
        compartilharRoleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compartilharRoleButton.topAnchor.constraint(equalTo: relatoTexto.bottomAnchor, constant: 24),
            compartilharRoleButton.leadingAnchor.constraint(equalTo: compartilharRoleButtonContainer.leadingAnchor),
            compartilharRoleButton.trailingAnchor.constraint(equalTo: compartilharRoleButtonContainer.trailingAnchor),
            compartilharRoleButton.heightAnchor.constraint(equalToConstant: 48),
            compartilharRoleButton.bottomAnchor.constraint(equalTo: compartilharRoleButtonContainer.bottomAnchor, constant: -52)
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
    
    private func setupAdditionalConfiguration() {
        //MARK: - Outras configurações
        compartilharRoleButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    func areFieldsEmpty() -> Bool {
        if tituloAniversario.text != "" && relatoTexto.text != "" {
            if nomeAutor.text != "" && relatoTexto.text != "Comecei meu dia.../ Eu comi.../ Também me reuni com.../ Fomos a... /Mais tarde, ... " {
                if idadeAutor.text != "" && categoriaTextField.text != "" && localAniversario.text != ""{
                    return false
                    
                }
            }
        }
        return true
    }
    
    @objc func tappedButton (sender: UIButton) {
       
        
    }
    
    func constructRelato() -> Relatos {
        var relato = Relatos()
        relato.tituloRelato = tituloAniversario.text
        relato.relatoTexto = relatoTexto.text
        relato.codigo = turnRandomNumberIntoString()
        relato.categoria = categoriaTextField.text
        buttonSelection()
        relato.preco = definePreco()
        relato.Autor = nomeAutor.text
        relato.idadeAutor = idadeAutor.text
        relato.curtidas = 0
        
        let relatosManager = RelatosManager()
        relatosManager.addRelato(relato: relato)
        
        return relato
    }
    
    func codigoRelato() -> String {
        let constructRelato = constructRelato()
        let cloud = CloudKitViewController()
        cloud.AddRelato(relato: constructRelato)
        var codigo = ""
        codigo = constructRelato.codigo
        
        return codigo
    }
    
}
// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ContaAniversarioView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ContaAniversarioView().showPreview().previewDevice("iPhone SE (3rd generation)")
            ContaAniversarioView().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
   }

}
#endif

extension ContaAniversarioView: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoriaTextField.text = categorias[row]
        categoriaTextField.resignFirstResponder()
    }
    
 
    func textViewDidBeginEditing(_ textView: UITextView) {
        if relatoTexto.textColor == UIColor.lightGray {
            relatoTexto.text = nil
            relatoTexto.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if relatoTexto.text.isEmpty {
            relatoTexto.text = "Comecei meu dia.../ Eu comi.../ Também me reuni com.../ Fomos a... /Mais tarde, ... "
            relatoTexto.textColor = UIColor.lightGray
        }
    }
    
}

