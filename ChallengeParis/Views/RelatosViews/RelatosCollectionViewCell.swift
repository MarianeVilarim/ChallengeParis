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
    var relatoTexto = UILabel()
    var likeButton = UIButton()
    var buttonENome = UIStackView()
    var stackETexto = UIStackView()
    static let cellIdentifier = "MemoriasCell"
    
    
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
        let relato = relato
        self.tituloLabel.text = relato.tituloRelato
        self.relatoTexto.text = relato.relatoTexto
        self.autorLabel.text = "Por \(relato.Autor)"
    }
    
    func setViewHierarchy() {
        buttonENome.addArrangedSubview(tituloLabel)
        buttonENome.addArrangedSubview(likeButton)
        stackETexto.addArrangedSubview(buttonENome)
        stackETexto.addArrangedSubview(relatoTexto)
        addSubview(stackETexto)
        
    
    }
    
    func setViewAtributes(){
        
        buttonENome.axis = .horizontal
        buttonENome.spacing = 90
        buttonENome.contentMode = .scaleAspectFit
        
        stackETexto.axis = .vertical
        stackETexto.spacing = 17
        stackETexto.contentMode = .scaleAspectFit
        
        tituloLabel.textColor = .secondaryLabel
        relatoTexto.textColor = .secondaryLabel
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        
        
    }
    
    func setConstraints(){
        buttonENome.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttonENome.topAnchor.constraint(equalTo: stackETexto.topAnchor, constant: 18),
                                     buttonENome.leadingAnchor.constraint(equalTo: stackETexto.leadingAnchor, constant: 16),
                                     buttonENome.trailingAnchor.constraint(equalTo: stackETexto.trailingAnchor, constant: -16),
                                     buttonENome.bottomAnchor.constraint(equalTo: relatoTexto.topAnchor, constant: 17)
        ])
        
        stackETexto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackETexto.topAnchor.constraint(equalTo: topAnchor),
                                     stackETexto.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stackETexto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     stackETexto.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
