//
//  DepoimentoView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 12/09/22.
//

import UIKit

class ForumFestinhaView: UIView {
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    let arrayMemorias = [(titulo: "Laurinha Kpopper", texto: "foi muito legalfoi muito legalfoi muito legal"), (titulo: "Laurinha Kpopper", texto: "foi muito legalfoi muito legalfoi muito legal"), (titulo: "Laurinha Kpopper", texto:"foi muito legalfoi muito legalfoi muito legal"), (titulo: "Laurinha Kpopper", texto: "foi muito legalfoi muito legalfoi muito legal"), (titulo: "Laurinha Kpopper", texto: "foi muito legalfoi muito legalfoi muito legal")]
////
////    let titleLabel = UILabel()
////    let subtitleLabel = UILabel()
//
//    let compartilharRoleButton = UIButton(configuration: .filled())
//    //  let tenhoCodigoButton = UIButton(configuration: .plain())
//
//    let titleLabelContainer = UIView()
//    let subtitleLabelContainer = UIView()
//
    let memoriasContainer = UIView()
//    //  let tenhoCodigoButtonContainer = UIView()
//
////    let headerStackView = UIStackView()
    let memoriasStackView = UIStackView()
//
//    let precoBaratoButton = UIButton(configuration: .filled())
//    let precoMedioButton = UIButton(configuration: .filled())
//    let precoCaroButton = UIButton(configuration: .filled())
//    // let precosContainer = UIView()
//    let precosStackView = UIStackView()
//
//    let tituloAniversario = UITextField()
//    let localAniversario = UITextField()
//
//    let categoriaAniversario = UIPickerView()
//    let categoriaTextField = UITextField()
//
//    let anexarImagemAniver = UIButton()
//    let categorias = ["restaurante", "praia", "bar", "cultural", "casa"]
//
//    let relatoTexto = UITextView()
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let memoriasCollectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    let cell = UICollectionViewCell()
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        categoriaAniversario.dataSource = self
//        categoriaAniversario.delegate = self
//        categoriaTextField.inputView = categoriaAniversario
//
//        tituloAniversario.delegate = self
//        localAniversario.delegate = self
//        categoriaTextField.delegate = self
//
//        relatoTexto.delegate = self
        memoriasCollectionView.dataSource = self
        memoriasCollectionView.delegate = self
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize(width: 309, height: 145)

        memoriasCollectionView.setCollectionViewLayout(layout, animated: true)
        
        memoriasCollectionView.register(MemoriasCollectionViewCell.self, forCellWithReuseIdentifier: MemoriasCollectionViewCell.cellIdentifier)
        
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
//        contentView.addSubview(headerStackView)
        contentView.addSubview(memoriasStackView)
        memoriasStackView.addArrangedSubview(memoriasContainer)
        
        memoriasContainer.addSubview(memoriasCollectionView)
        
//        memoriasStackView.backgroundColor = .white
        
//        headerStackView.addArrangedSubview(titleLabelContainer)
        
//        precosStackView.addArrangedSubview(precoBaratoButton)
//        precosStackView.addArrangedSubview(precoMedioButton)
//        precosStackView.addArrangedSubview(precoCaroButton)
        
        
        
        
//        titleLabelContainer.addSubview(titleLabel)
//        titleLabelContainer.addSubview(subtitleLabel)
        
//        memoriasContainer.addSubview(anexarImagemAniver)
//        memoriasContainer.addSubview(precosStackView)
//
//        memoriasContainer.addSubview(tituloAniversario)
//        memoriasContainer.addSubview(localAniversario)
//        memoriasContainer.addSubview(categoriaTextField)
//        memoriasContainer.addSubview(relatoTexto)
//
//        memoriasContainer.addSubview(compartilharRoleButton)
//        //memoriasContainer.addSubview(testView)
//
//        // memoriasContainer.addSubview(tenhoCodigoButton)
//        memoriasStackView.addArrangedSubview(compartilharRoleButtonContainer)
        
        
    }
    
    func setupViewsAttributes() {
        
        backgroundView.contentMode = .scaleAspectFill
  
        
        //            stackView.axis = .vertical
        //            stackView.alignment = .fill
        //            //stackView.spacing = 50
        //            stackView.distribution = .fillEqually
        //            stackView.backgroundColor = .green
        
//        headerStackView.axis = .vertical
//        headerStackView.alignment = .fill
//        headerStackView.spacing = 1
//        headerStackView.distribution = .fillProportionally
        
//        precosStackView.axis = .horizontal
//        precosStackView.alignment = .fill
//        precosStackView.spacing = 42
//        precosStackView.distribution = .fillEqually
        
//        titleLabel.text = "Foi o seu aniversário"
//        titleLabel.textColor = UIColor.white
//        titleLabel.textAlignment = .left
        
//        subtitleLabel.text = "Diz aí pra gente como foi tua festa"
//        subtitleLabel.textColor = .white
//        subtitleLabel.numberOfLines = 0
//        subtitleLabel.sizeToFit()
//        subtitleLabel.textAlignment = .left
        
        memoriasStackView.layer.masksToBounds = true
        memoriasStackView.layer.cornerRadius = 20

        memoriasStackView.axis = .vertical
        memoriasStackView.alignment = .center
        memoriasStackView.spacing = 8
        memoriasStackView.backgroundColor = .white
        memoriasStackView.contentMode = .scaleAspectFit
        
//        memoriasCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        memoriasCollectionView.contentMode = .scaleAspectFit
        memoriasCollectionView.isScrollEnabled = true
//        compartilharRoleButton.tintColor = .purple
//        compartilharRoleButton.setTitle("Compartilhar meu rolê!", for: .normal)
//        compartilharRoleButton.setTitleColor(.white, for: .normal)
//        compartilharRoleButton.titleLabel?.tintColor = .white
//
//        var  configuration = UIButton.Configuration.filled()
//        configuration.cornerStyle = .capsule
//        compartilharRoleButton.configuration = configuration
        
        //            tenhoCodigoButton.tintColor = .white
        //            tenhoCodigoButton.setTitle("Tenho um código", for: .normal)
        //            tenhoCodigoButton.setTitleColor(.purple, for: .normal)
        //            tenhoCodigoButton.backgroundColor = .white
        
        
//        precoBaratoButton.setTitle("$", for: .normal)
//        precoBaratoButton.tintColor = .purple
//        precoBaratoButton.setTitleColor(.white, for: .normal)
//
//        precoMedioButton.setTitle("$$", for: .normal)
//        precoMedioButton.tintColor = .purple
//        precoMedioButton.setTitleColor(.white, for: .normal)
//
//        precoCaroButton.setTitle("$$$", for: .normal)
//        precoCaroButton.tintColor = .purple
//        precoCaroButton.setTitleColor(.white, for: .normal)
//
//        anexarImagemAniver.setImage(UIImage(named: "Image"), for: .normal)
//
//        precosStackView.distribution = .fillEqually
//        precosStackView.spacing = 42
//
//        tituloAniversario.placeholder = "Título"
//        tituloAniversario.tintColor = .label
//        tituloAniversario.textColor = .secondaryLabel
//        tituloAniversario.textAlignment = .left
        
        
//        localAniversario.placeholder = "Local"
//        localAniversario.tintColor = .label
//        localAniversario.textColor = .secondaryLabel
//        localAniversario.textAlignment = .left
//
//
//        categoriaTextField.placeholder = "Categoria"
//        categoriaTextField.tintColor = .label
//        categoriaTextField.textColor = .secondaryLabel
//        categoriaTextField.textAlignment = .left
//
        
        //
        
//        relatoTexto.tintColor = .label
//        relatoTexto.textColor = .secondaryLabel
//        relatoTexto.textAlignment = .left
//        relatoTexto.contentMode = .scaleAspectFill
//        relatoTexto.sizeToFit()
//        relatoTexto.text = "Comecei meu dia.../ Eu comi.../ Também me reuni com.../ Fomos a... /Mais tarde, ... "
//        relatoTexto.textColor = UIColor.lightGray
//        relatoTexto.font?.withSize(16)
//
//
//        scrollView.keyboardDismissMode = .onDrag
        
        
    }
    
    func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: topAnchor),
                                     backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
                                    ])
        
        
        memoriasStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([memoriasStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     memoriasStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     memoriasStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     memoriasStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     memoriasStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
        memoriasContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([memoriasContainer.topAnchor.constraint(equalTo: memoriasStackView.topAnchor, constant: 47),
                                     memoriasContainer.leadingAnchor.constraint(equalTo: memoriasStackView.leadingAnchor,constant: 47),
                                     memoriasContainer.trailingAnchor.constraint(equalTo: memoriasStackView.trailingAnchor, constant: -47),
                                     memoriasContainer.bottomAnchor.constraint(equalTo: memoriasStackView.bottomAnchor)
//                                     memoriasContainer.bottomAnchor.constraint(equalTo: memoriasStackView.bottomAnchor, constant: -47)
                                     
        ])
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 24),
//            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 32),
//            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -74),
//            //            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: )
//        ])
        
//        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
//
//        ])
        
//        headerStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([headerStackView.heightAnchor.constraint(equalToConstant: 72),
//                                     headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
//                                     headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                                     headerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//
//                                    ])
        
        
//        anexarImagemAniver.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([anexarImagemAniver.topAnchor.constraint(equalTo: memoriasStackView.topAnchor, constant: 24),
//                                     anexarImagemAniver.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 67),
//                                     anexarImagemAniver.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -67),
//                                     anexarImagemAniver.heightAnchor.constraint(equalToConstant: 152)
//                                    ])
//
//        precosStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([precosStackView.topAnchor.constraint(equalTo: anexarImagemAniver.bottomAnchor, constant: 24),
//                                     precosStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     precosStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
//
//                                    ])
        
//        tituloAniversario.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([tituloAniversario.topAnchor.constraint(equalTo: precosStackView.bottomAnchor, constant: 24),
//                                     tituloAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     tituloAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
//
//                                    ])
        
//        localAniversario.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([localAniversario.topAnchor.constraint(equalTo: tituloAniversario.bottomAnchor, constant: 16),
//                                     localAniversario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     localAniversario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
//                                    ])
//
//        categoriaTextField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([categoriaTextField.topAnchor.constraint(equalTo: localAniversario.bottomAnchor, constant: 16),
//                                     categoriaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     categoriaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
//                                    ])
//
//        relatoTexto.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([relatoTexto.topAnchor.constraint(equalTo: categoriaTextField.bottomAnchor, constant: 16),
//                                     relatoTexto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
//                                     relatoTexto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
//                                     relatoTexto.heightAnchor.constraint(equalToConstant: 152),
//                                     relatoTexto.bottomAnchor.constraint(equalTo: compartilharRoleButton.topAnchor, constant: 24)
//                                    ])
//
        
//        memoriasStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([memoriasStackView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
//                                     memoriasStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                                     memoriasStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//                                     memoriasStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//                                    ])
        
        
        
//        memoriasContainer.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            memoriasContainer.topAnchor.constraint(equalTo: memoriasStackView.topAnchor, constant: 52),
//            memoriasContainer.widthAnchor.constraint(equalToConstant: 304),
//            memoriasContainer.bottomAnchor.constraint(equalTo: memoriasStackView.bottomAnchor, constant: 52)
//        ])
        
//        compartilharRoleButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            compartilharRoleButton.topAnchor.constraint(equalTo: relatoTexto.bottomAnchor, constant: 24),
//            compartilharRoleButton.leadingAnchor.constraint(equalTo: memoriasContainer.leadingAnchor),
//            compartilharRoleButton.trailingAnchor.constraint(equalTo: memoriasContainer.trailingAnchor),
//            compartilharRoleButton.heightAnchor.constraint(equalToConstant: 48),
//            compartilharRoleButton.bottomAnchor.constraint(equalTo: memoriasContainer.bottomAnchor, constant: -52)
//        ])
        
        //            tenhoCodigoButton.translatesAutoresizingMaskIntoConstraints = false
        //            NSLayoutConstraint.activate([
        //                tenhoCodigoButton.leadingAnchor.constraint(equalTo: memoriasContainer.leadingAnchor),
        //                tenhoCodigoButton.trailingAnchor.constraint(equalTo: memoriasContainer.trailingAnchor),
        //                tenhoCodigoButton.heightAnchor.constraint(equalToConstant: 48),
        //                tenhoCodigoButton.topAnchor.constraint(equalTo: compartilharRoleButton.bottomAnchor, constant: 8)
        //            ])
        
        //
        //        tenhoCodigoButton.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            tenhoCodigoButton.widthAnchor.constraint(equalToConstant: 200),
        //            tenhoCodigoButton.heightAnchor.constraint(equalToConstant: 40)
        //        ])
        
        
        memoriasCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([memoriasCollectionView.topAnchor.constraint(equalTo: memoriasContainer.topAnchor),
                                     memoriasCollectionView.leadingAnchor.constraint(equalTo: memoriasContainer.leadingAnchor),
                                     memoriasCollectionView.trailingAnchor.constraint(equalTo: memoriasContainer.trailingAnchor),
                                     memoriasCollectionView.bottomAnchor.constraint(equalTo: memoriasContainer.bottomAnchor),
                                     memoriasCollectionView.heightAnchor.constraint(equalToConstant: 700)
                                     
        ])
        
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

extension ForumFestinhaView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMemorias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = memoriasCollectionView.dequeueReusableCell(withReuseIdentifier: MemoriasCollectionViewCell.cellIdentifier, for: indexPath) as? MemoriasCollectionViewCell {
            print("passou na cel for item at")
            let titulo = arrayMemorias[indexPath.row].titulo
            let memoria = arrayMemorias[indexPath.row].texto
            cell.setup(nome: titulo, memoria: memoria)
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    
}

