//
//  EmAltaCollectionViewCell.swift
//  ChallengeParis
//
//  Created by Mariane Vilarim on 20/09/22.
//

import UIKit

class EmAltaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "EmAltaCollectionViewCell"
    
    let logo: UIImageView = {
       let image = UIImage (named: "Caldinho")

        return UIImageView(image: image)
    }()

    let descricao: UILabel = {

        let label = UILabel()
        label.font = UIFont.customFont(type: .regular, size: 12)
        label.textColor = .white
        label.text = "testando"

        return label
    }()

    let usuario: UILabel = {

        let label = UILabel()
        label.font = UIFont.customFont(type: .regular, size: 10)
        label.textColor = .white
        label.text = "testinho"

        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        self.addSubview(descricao)
        self.addSubview(usuario)
//        self.addSubview(logo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        descricao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            descricao.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            descricao.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            descricao.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
//            descricao.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -33),
            descricao.heightAnchor.constraint(equalToConstant: 15)

        ])
//
        usuario.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            usuario.topAnchor.constraint(equalTo: descricao.topAnchor, constant: 12),
            usuario.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            usuario.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
        
        ])
        
        
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            logo.topAnchor
//
//
//        ])
        
        
    }
    
    
}
