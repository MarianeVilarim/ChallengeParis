////
////  MinhaFonte.swift
////  ChallengeParis
////
////  Created by Mariane Vilarim on 16/09/22.
////
//
import UIKit

extension UIFont{

    enum FontType {

        case extralight
        case regular
        case bold

        func getFontName() -> String{
            switch self{
            case .extralight:
                return "Sora-ExtraLight"
            case .regular:
                return "Sora-Regular"
            case .bold:
                return "Sora-Bold"
            }

            func getWeight() -> UIFont.Weight{
                switch self {
                case .extralight:
                    return .light
                case .regular:
                    return .regular
                case .bold:
                    return .bold
                }
            }

        }
    }

    static func customFont(type: FontType, size: CGFloat) -> UIFont{
        guard let font = UIFont(name: type.getFontName(), size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .bold)
            print("fonte ok")
        }
        return font
    }
//
}
