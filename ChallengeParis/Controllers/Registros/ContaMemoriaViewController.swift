//
//  ContaMemoriaViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 18/09/22.
//

import UIKit

class ContaMemoriaViewController: UIViewController {
    
    var codigoDaSalinha = ""
    let primeiraView = ContaMemoriaView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = primeiraView
        primeiraView.cabuetarButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func didUserTapButton() {
        let memoria = primeiraView.constructMemoria(codigo: codigoDaSalinha)
        print("chamou")
        let festinhaView = ForumFestinhaViewController()
        festinhaView.arrayMemorias.append(memoria)
        navigationController?.pushViewController(festinhaView, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
