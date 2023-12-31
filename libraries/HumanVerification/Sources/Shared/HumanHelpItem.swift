//
//  HumanHelpItem.swift
//  ProtonCore-HumanVerification - Created on 20/01/21.
//
//  Copyright (c) 2022 Proton Technologies AG
//
//  This file is part of Proton Technologies AG and ProtonCore.
//
//  ProtonCore is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  ProtonCore is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ProtonCore.  If not, see <https://www.gnu.org/licenses/>.

import Foundation
import enum ProtonCoreDataModel.ClientApp
import ProtonCoreUIFoundations

enum HumanHelpItem: CaseIterable {
    case requestInvite
    case visitHelpCenter
}

extension HumanHelpItem {
    var title: String {
        switch self {
        case .requestInvite:
            return HVTranslation.help_request_item_title.l10n
        case .visitHelpCenter:
            return HVTranslation.help_visit_item_title.l10n
        }
    }

    var subtitle: String {
        switch self {
        case .requestInvite:
            return HVTranslation.help_request_item_message.l10n
        case .visitHelpCenter:
            return HVTranslation.help_visit_item_message.l10n
        }
    }

    var image: ImageType {
        switch self {
        case .requestInvite:
            return IconProvider.checkmarkCircle
        case .visitHelpCenter:
            return IconProvider.lightbulb
        }
    }

    func url(clientApp: ClientApp) -> URL? {
        switch self {
        case .requestInvite:
            switch clientApp {
            case .vpn:
                return URL(string: "https://protonvpn.com/support")
            default:
                return URL(string: "https://proton.me/support/contact")
            }
        case .visitHelpCenter:
            return nil
        }
    }
}
