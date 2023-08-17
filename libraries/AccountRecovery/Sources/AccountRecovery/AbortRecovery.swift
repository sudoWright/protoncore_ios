//
//  AbortRecovery.swift
//  Pods - Created on 10/7/23.
//
//  Copyright (c) 2023 Proton AG
//
//  This file is part of ProtonCore.
//
//  ProtonCore is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  ProtonCore is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ProtonCore. If not, see https://www.gnu.org/licenses/.
//

import Foundation
import ProtonCoreNetworking
import ProtonCoreServices

/// Endpoint for aborting an Account Recovery process
public final class AbortRecoveryEndpoint: Request {
    public var path: String {
        "/account/v1/recovery/session/abort"
    }

    public var method: HTTPMethod { .post }
}

