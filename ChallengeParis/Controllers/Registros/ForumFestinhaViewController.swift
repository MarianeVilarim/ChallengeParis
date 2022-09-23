//
//  ForumFestinhaViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 17/09/22.
//

import UIKit

class ForumFestinhaViewController: UIViewController {
    
    var codigoRelato = ""
    var arrayMemorias: [Memoria] = []
    var nomeSalinha = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = ForumFestinhaView()
        self.view = primeiraView
        
        let labelHomeView = UILabel()
        let relatosMgmt = RelatosManager()
        let relatosArray = relatosMgmt.retornaRelatos()
        for i in 0...relatosArray.count-1  {
            if relatosArray[i].codigo == codigoRelato {
                nomeSalinha = relatosArray[i].Autor
                labelHomeView.text = "Festinha de \(nomeSalinha)"
                break
                
            } else {
                labelHomeView.text = "Festinha de Mari"
                
            }
        }
        self.navigationController?.navigationBar.tintColor = .white
        
            labelHomeView.backgroundColor = .clear
            labelHomeView.numberOfLines = 2
            labelHomeView.font = UIFont.customFont(type: .regular, size: 24)
            labelHomeView.textAlignment = .center
            labelHomeView.textColor = .white
            self.navigationItem.titleView = labelHomeView
        
        primeiraView.memoriasCollectionView.delegate = self
        primeiraView.memoriasCollectionView.dataSource = self
        
        self.navigationItem.titleView?.tintColor = .white
        let attributes = [NSAttributedString.Key.font: UIFont.customFont(type: .regular, size: 24)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addTapped))
        
        if codigoRelato != ""{
            memoriasPorCodigo(codigo: codigoRelato)
            primeiraView.memoriasCollectionView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func memoriasPorCodigo(codigo: String){
        let memoriasMgmt = MemoriaManager()
        let arrayMemorias = memoriasMgmt.mandaMemorias()
        for i in 0...arrayMemorias.count-1 {
            if arrayMemorias[i].codigo == codigo {
                self.arrayMemorias.append(arrayMemorias[i])
            }
        }
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
        
        var contaMemoriaViewController = ContaMemoriaViewController()
        contaMemoriaViewController.codigoDaSalinha = self.codigoRelato
        
        navigationController?.pushViewController(contaMemoriaViewController, animated: true)
        
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
extension ForumFestinhaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMemorias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoriasCollectionViewCell.cellIdentifier, for: indexPath) as? MemoriasCollectionViewCell {
            print("passou na cel for item at")
            let array = arrayMemorias
            
            
            //            let titulo = array[indexPath.row].tituloRelato
            //            let texto = array[indexPath.row].relatoTexto
            let memoriaCompleta = array[indexPath.row]
            cell.setup(memoria: memoriaCompleta)
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    
}
