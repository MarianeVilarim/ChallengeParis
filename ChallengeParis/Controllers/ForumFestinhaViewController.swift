//
//  ForumFestinhaViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 17/09/22.
//

import UIKit

class ForumFestinhaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let primeiraView = ForumFestinhaView()
        self.view = primeiraView
        
        let labelForumFestinhaView = UILabel()
        labelForumFestinhaView.text = "Festinha de Fulana"
        labelForumFestinhaView.textColor = .white
        labelForumFestinhaView.font = UIFont(name: "Sora-SemiBold", size: 16)

        //subtitleLabel.font = UIFont(name: "Sora-Regular", size: 16)

        
        self.navigationItem.titleView = labelForumFestinhaView
        self.navigationController?.navigationBar.tintColor = .white
        
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
