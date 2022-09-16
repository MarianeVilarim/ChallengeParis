//
//  UIView+UIViewRepresentable.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 11/08/22.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIView {
    @available(iOS 13, *)
    private struct Preview: UIViewRepresentable {
        let whiteView: UIView
        
        func makeUIView(context: Context) -> UIView { whiteView }
        func updateUIView(_ uiView: UIView, context: Context) { }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(whiteView: self)
    }
}
#endif
