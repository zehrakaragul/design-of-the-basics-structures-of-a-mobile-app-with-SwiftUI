import Foundation
import SwiftUI

enum SideMenuOptionModel: Int, CaseIterable, Identifiable {
    case ayarlar
    case profil
    case sifreYenile
    case hesapEkle
    case cikisYap
    
    var title: String {
        switch self {
        case .ayarlar:
            return "Ayarlar"
        case .profil:
            return "Profil"
        case .sifreYenile:
            return "Şifre Yenile"
        case .hesapEkle:
            return "Hesap Ekle"
        case .cikisYap:
            return "Çıkış Yap"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .ayarlar:
            return "gearshape"
        case .profil:
            return "person.circle"
        case .sifreYenile:
            return "arrow.2.circlepath"
        case .hesapEkle:
            return "person.crop.circle.badge.plus"
        case .cikisYap:
            return "arrow.right"
        }
    }
    
    var id: Int { return self.rawValue }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .ayarlar:
            Text("Ayarlar")
        case .profil:
            Text("Profil")
        case .sifreYenile:
            Text("Şifre Yenile")
        case .hesapEkle:
            Text("Hesap Ekle")
        case .cikisYap:
            welcomePage()
        }
    }
}


