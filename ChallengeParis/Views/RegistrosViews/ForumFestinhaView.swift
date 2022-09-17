//
//  DepoimentoView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 12/09/22.
//

import UIKit

class ForumFestinhaView: UIView {
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let whiteView = UIView()
    let compartilharRoleButton = UIButton(configuration: .filled())
    //  let tenhoCodigoButton = UIButton(configuration: .plain())
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    
    let compartilharRoleButtonContainer = UIView()
    //  let tenhoCodigoButtonContainer = UIView()
    
    let headerStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
    let precoBaratoButton = UIButton(configuration: .filled())
    let precoMedioButton = UIButton(configuration: .filled())
    let precoCaroButton = UIButton(configuration: .filled())
    // let precosContainer = UIView()
    let precosStackView = UIStackView()
    
    let tituloAniversario = UITextField()
    let localAniversario = UITextField()
    
    let categoriaAniversario = UIPickerView()
    let categoriaTextField = UITextField()
    
    let anexarImagemAniver = UIButton()
    let categorias = ["restaurante", "praia", "bar", "cultural", "casa"]
    
    let relatoTexto = UITextView()
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    // let testView = UIView()
    
    
    
    
    
    
    
    
    
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
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        
        subtitleLabel.text = "Diz aí pra gente como foi tua festa"
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
        compartilharRoleButton.tintColor = .purple
        compartilharRoleButton.setTitle("Compartilhar meu rolê!", for: .normal)
        compartilharRoleButton.setTitleColor(.white, for: .normal)
        compartilharRoleButton.titleLabel?.tintColor = .white
        
        var  configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        compartilharRoleButton.configuration = configuration
        
        //            tenhoCodigoButton.tintColor = .white
        //            tenhoCodigoButton.setTitle("Tenho um código", for: .normal)
        //            tenhoCodigoButton.setTitleColor(.purple, for: .normal)
        //            tenhoCodigoButton.backgroundColor = .white
        
        
        precoBaratoButton.setTitle("$", for: .normal)
        precoBaratoButton.tintColor = .purple
        precoBaratoButton.setTitleColor(.white, for: .normal)
        
        precoMedioButton.setTitle("$$", for: .normal)
        precoMedioButton.tintColor = .purple
        precoMedioButton.setTitleColor(.white, for: .normal)
        
        precoCaroButton.setTitle("$$$", for: .normal)
        precoCaroButton.tintColor = .purple
        precoCaroButton.setTitleColor(.white, for: .normal)
        
        anexarImagemAniver.setImage(UIImage(named: "Image"), for: .normal)
        
        precosStackView.distribution = .fillEqually
        precosStackView.spacing = 42
        
        tituloAniversario.placeholder = "Título"
        tituloAniversario.tintColor = .label
        tituloAniversario.textColor = .secondaryLabel
        tituloAniversario.textAlignment = .left
        
        
        localAniversario.placeholder = "Local"
        localAniversario.tintColor = .label
        localAniversario.textColor = .secondaryLabel
        localAniversario.textAlignment = .left
        
        
        categoriaTextField.placeholder = "Categoria"
        categoriaTextField.tintColor = .label
        categoriaTextField.textColor = .secondaryLabel
        categoriaTextField.textAlignment = .left
        
        
        //
        
        relatoTexto.tintColor = .label
        relatoTexto.textColor = .secondaryLabel
        relatoTexto.textAlignment = .left
        relatoTexto.contentMode = .scaleAspectFill
        relatoTexto.sizeToFit()
        relatoTexto.text = "Comecei meu dia.../ Eu comi.../ Também me reuni com.../ Fomos a... /Mais tarde, ... "
        relatoTexto.textColor = UIColor.lightGray
        relatoTexto.font?.withSize(16)
        
        
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
        
        tituloAniversario.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tituloAniversario.topAnchor.constraint(equalTo: precosStackView.bottomAnchor, constant: 24),
                                     tituloAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     tituloAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
                                     
                                    ])
        
        localAniversario.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([localAniversario.topAnchor.constraint(equalTo: tituloAniversario.bottomAnchor, constant: 16),
                                     localAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     localAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
                                    ])
        
        categoriaTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([categoriaTextField.topAnchor.constraint(equalTo: localAniversario.bottomAnchor, constant: 16),
                                     categoriaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
                                     categoriaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
                                    ])
        
        relatoTexto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([relatoTexto.topAnchor.constraint(equalTo: categoriaTextField.bottomAnchor, constant: 16),
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
        
        //            tenhoCodigoButton.translatesAutoresizingMaskIntoConstraints = false
        //            NSLayoutConstraint.activate([
        //                tenhoCodigoButton.leadingAnchor.constraint(equalTo: compartilharRoleButtonContainer.leadingAnchor),
        //                tenhoCodigoButton.trailingAnchor.constraint(equalTo: compartilharRoleButtonContainer.trailingAnchor),
        //                tenhoCodigoButton.heightAnchor.constraint(equalToConstant: 48),
        //                tenhoCodigoButton.topAnchor.constraint(equalTo: compartilharRoleButton.bottomAnchor, constant: 8)
        //            ])
        
        //
        //        tenhoCodigoButton.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            tenhoCodigoButton.widthAnchor.constraint(equalToConstant: 200),
        //            tenhoCodigoButton.heightAnchor.constraint(equalToConstant: 40)
        //        ])
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     scrollView.widthAnchor.constraint(equalTo: widthAnchor),
                                     scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                                    ])
        //            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //                    scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        //                    scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //                    scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        NSLayoutConstraint.activate([contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
                                    ])
        //                    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        //                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        //                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        //                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
        //        testView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([testView.heightAnchor.constraint(equalToConstant: 60),
        //                                     testView.topAnchor.constraint(equalTo: compartilharRoleButton.bottomAnchor, constant: 1)])
        //
    }
}
// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ForumFestinhaView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ForumFestinhaView().showPreview().previewDevice("iPhone SE (3rd generation)")
            ForumFestinhaView().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

extension ForumFestinhaView: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    
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
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        return textField.resignFirstResponder()
    //
    //    }
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

