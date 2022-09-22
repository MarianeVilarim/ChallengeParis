//
//  MemoriasCollectionViewCell.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 18/09/22.
//

import UIKit

class RelatosCollectionViewCell: UICollectionViewCell {
    var tituloLabel = UILabel()
    var autorLabel = UILabel()
    var likeButton = UIButton(configuration: .plain())
    var buttonENome = UIStackView()
    var stackETexto = UIStackView()
    var imagemRelato = UIImageView()
    var imagemStack = UIStackView()
    var stackView = UIStackView()
    static let cellIdentifier = "MemoriasCell"
    
//    var nomeAutor = ""
    var idadeAutor = ""
    var relatoTexto = ""
    var preco = ""
    var local = ""
    var categoria = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        setViewHierarchy()
        setViewAtributes()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(relato: Relatos){
//        let relato = relato
        self.tituloLabel.text = relato.tituloRelato
        self.autorLabel.text = "Por \(relato.Autor ?? "autor desconhecido")"
        self.relatoTexto = relato.relatoTexto
        self.local = relato.local
        self.idadeAutor = relato.idadeAutor
        self.preco = relato.preco
        self.categoria = relato.categoria
        
        
    }
    
    func setViewHierarchy() {
        buttonENome.addArrangedSubview(tituloLabel)
        buttonENome.addArrangedSubview(likeButton)
        stackETexto.addArrangedSubview(buttonENome)
        stackETexto.addArrangedSubview(autorLabel)
        stackView.addArrangedSubview(stackETexto)
        stackView.addArrangedSubview(imagemStack)
        addSubview(stackView)
        
        imagemStack.addArrangedSubview(imagemRelato)
        
        
    
    }
    
    func setViewAtributes(){
        
        stackView.axis = .vertical
        stackETexto.spacing = 0
        stackView.distribution = .equalSpacing
        
        buttonENome.axis = .horizontal
        buttonENome.spacing = 80
        buttonENome.contentMode = .scaleAspectFit
        
        stackETexto.axis = .vertical
        stackETexto.spacing = 17
        stackETexto.contentMode = .scaleAspectFit
        
        tituloLabel.textColor = .secondaryLabel
        autorLabel.textColor = .secondaryLabel
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        
        imagemRelato.image = UIImage(named: "Image")
//        imagemRelato.contentMode = .scaleAspectFit
        
        imagemStack.distribution = .fillProportionally
        
        
    }
    
    func setConstraints(){
        buttonENome.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttonENome.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 18),
                                     buttonENome.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
                                     buttonENome.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
//                                     buttonENome.bottomAnchor.constraint(equalTo: imagemStack.topAnchor, constant: 17)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                                     stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
//        imagemStack.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([imagemStack.topAnchor.constraint(equalTo: centerYAnchor),
//                                     imagemStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//                                     imagemStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)])
    }
}
