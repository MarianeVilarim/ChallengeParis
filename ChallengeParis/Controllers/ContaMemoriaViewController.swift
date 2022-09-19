//
//  ContaMemoriaViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 18/09/22.
//

import UIKit

class ContaMemoriaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = ContaMemoriaView()
        self.view = primeiraView
        primeiraView.cabuetarButton.addTarget(self, action: #selector(didUserTapButton), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func didUserTapButton() {
        print("chamou")
        let festinhaView = ForumFestinhaView()
        festinhaView.memoriasCollectionView.reloadData()
        navigationController?.pushViewController(ForumFestinhaViewController(), animated: true)
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
