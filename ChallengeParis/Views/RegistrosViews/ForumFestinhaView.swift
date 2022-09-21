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

        memoriasCollectionView.dataSource = self
        memoriasCollectionView.delegate = self
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize(width: 280, height: 145)

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
        

        
        
    }
    
    func setupViewsAttributes() {
        
        backgroundView.contentMode = .scaleAspectFill
        
        memoriasStackView.layer.masksToBounds = true
        memoriasStackView.layer.cornerRadius = 20

        memoriasStackView.axis = .vertical
        memoriasStackView.alignment = .center
        memoriasStackView.spacing = 8
        memoriasStackView.backgroundColor = .white
        memoriasStackView.contentMode = .scaleAspectFit
        

        layout.scrollDirection = .vertical
        memoriasCollectionView.contentMode = .scaleAspectFit
        memoriasCollectionView.isScrollEnabled = true

        
        
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
//            cell.setup(nome: titulo, memoria: memoria)
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    
}

