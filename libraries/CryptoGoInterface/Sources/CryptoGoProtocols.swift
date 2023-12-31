//
//  CryptoGoProtocols.swift
//  ProtonCore-CryptoGoInterface - Created on 24/05/2023.
//
//  Copyright (c) 2023 Proton Technologies AG
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
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ProtonCore. If not, see https://www.gnu.org/licenses/.
//

import Foundation

@objc public protocol CryptoReaderProtocol: NSObjectProtocol {
    @objc func read(_ b: Data?, n: UnsafeMutablePointer<Int>?) throws
}

@objc public protocol CryptoWriterProtocol: NSObjectProtocol {
    @objc func write(_ b: Data?, n: UnsafeMutablePointer<Int>?) throws
}

@objc public protocol CryptoWriteCloserProtocol: NSObjectProtocol {
    @objc func close() throws
    @objc func write(_ b: Data?, n: UnsafeMutablePointer<Int>?) throws
}

@objc public protocol HelperMobileReaderProtocol: NSObjectProtocol {
    @objc func read(_ max: Int) throws -> HelperMobileReadResult
}
