//
//  ForumFestinhaViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 17/09/22.
//

import UIKit

class ForumFestinhaViewController: UIViewController {
    
    var codigoRelato = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = ForumFestinhaView()
        self.view = primeiraView
        self.navigationItem.title = "Festinha de Fulana"
        self.navigationController?.navigationBar.tintColor = .white
        
        primeiraView.memoriasCollectionView.delegate = self
        
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addTapped))
      
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func addTapped(){
        
        navigationController?.pushViewController(ContaMemoriaViewController(), animated: true)
        
    }
}

extension ForumFestinhaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MemoriasCollectionViewCell {
            print("entrou aqui")
            
            var memoriaTelaCheia = MemoriaExpandidaViewController()
            memoriaTelaCheia.titlelabel = cell.nomeLabel.text!
            memoriaTelaCheia.memoriaTexto = cell.memoriaTexto.text!
            
            navigationController?.showDetailViewController(memoriaTelaCheia, sender: self)
            
//            relatoExpandidoViewController.local = cell.local
//            relatoExpandidoViewController.preco = cell.preco
//            relatoExpandidoViewController.nomeAutor = cell.autorLabel.text!
//            relatoExpandidoViewController.relatoTexto = cell.relatoTexto
//            relatoExpandidoViewController.idadeAutor = cell.idadeAutor
//            relatoExpandidoViewController.categoria = cell.categoria
//            relatoExpandidoViewController.local = cell.local
        
    }
}
}
