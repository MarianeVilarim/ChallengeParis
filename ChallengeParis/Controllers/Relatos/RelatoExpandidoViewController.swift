//
//  RelatoExpandidoViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 20/09/22.
//

import UIKit

class RelatoExpandidoViewController: UIViewController {
    
    var nomeAutor = ""
    var idadeAutor = ""
    var relatoTexto = ""
    var preco = ""
    var local = ""
    var categoria = ""
    var titulo = ""
    

    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = .white

        super.viewDidLoad()
        let labelHomeView = UILabel()
        labelHomeView.backgroundColor = .clear
        labelHomeView.numberOfLines = 2
        labelHomeView.font = UIFont.customFont(type: .regular, size: 24)
        labelHomeView.textAlignment = .center
        labelHomeView.textColor = .white
        self.navigationItem.titleView = labelHomeView
        let primeiraView = RelatoExpandido()
        self.view = primeiraView
        primeiraView.idadeAutor.text = self.idadeAutor
        primeiraView.autorRelato.text = self.nomeAutor
        primeiraView.relatoTexto.text = self.relatoTexto
        primeiraView.localButton.setTitle(self.local, for: .normal)
        primeiraView.localButton.addTarget(self, action: #selector(didTapButtonLocal), for: .touchUpInside)
        
        primeiraView.categoriaButton.setTitle(self.categoria, for: .normal)
        primeiraView.categoriaButton.addTarget(self, action: #selector(didTapButtonCategoria), for: .touchUpInside)
        
        primeiraView.precoButton.setTitle(self.preco, for: .normal)
        primeiraView.precoButton.addTarget(self, action: #selector(didTapButtonPreco), for: .touchUpInside)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func didTapButtonLocal() {
        let exibeRelato = RelatosViewController()
        exibeRelato.local = self.local
        navigationController?.pushViewController(exibeRelato, animated: true)
                                    
    }
    
    @objc func didTapButtonCategoria() {
        let exibeRelato = RelatosViewController()
        exibeRelato.categoria = self.categoria
        navigationController?.pushViewController(exibeRelato, animated: true)
                                    
    }
    
    @objc func didTapButtonPreco() {
        let exibeRelato = RelatosViewController()
        exibeRelato.local = self.local
        navigationController?.pushViewController(exibeRelato, animated: true)
                                    
    }
}
