//
//  DepoimentoView.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 12/09/22.
//

import UIKit

class ForumView: UIView {
    
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ForumView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ForumView().showPreview().previewDevice("iPhone SE (3rd generation)")
            ForumView().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
