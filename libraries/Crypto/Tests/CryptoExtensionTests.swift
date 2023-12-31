//
//  CryptoExtensionTests.swift
//  ProtonCore-Crypto-Tests - Created on 4/19/21.
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

import ProtonCoreCryptoGoInterface
import ProtonCoreCrypto
import XCTest

class CryptoExtensionTests: CryptoTestBase {
    private var sut: Crypto!
    private let plainText = "foo"
    private var privateKey: String!
    private var privateKey2: String!
    private let privateKeyPassphrase = "hello world"
    private var cipherText: String!

    private var validKeyAndPassphrasePairs: [(String, String)] {
        [
            (privateKey, privateKeyPassphrase)
        ]
    }

    private var invalidKeyAndPassphrasePairs: [(String, String)] {
        [
            (privateKey, "definitely not a correct password"),
            (privateKey2, "also not a correct password")
        ]
    }

    override func setUpWithError() throws {
        try super.setUpWithError()

        privateKey = content(of: "testdata_privatekey")
        privateKey2 = content(of: "testdata_privatekey2")
        sut = Crypto()

        cipherText = try sut.encryptNonOptional(
            plainText: plainText,
            publicKey: privateKey.publicKey,
            privateKey: privateKey,
            passphrase: privateKeyPassphrase
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        cipherText = nil
        privateKey = nil
        privateKey2 = nil
        testBundle = nil

        try super.tearDownWithError()
    }

    func testDecryptionWorksIfAtLeastOneKeyAndPassphrasePairIsCorrect() throws {
        let decrypted = try Crypto().decryptVerify(
            encrypted: cipherText,
            publicKeys: [],
            privateKeys: invalidKeyAndPassphrasePairs + validKeyAndPassphrasePairs,
            verifyTime: 0
        )

        XCTAssertEqual(decrypted.messageGoCrypto?.getString(), plainText)
    }

    func testDecryptionDoesntWorkIfNoneOfTheKeyAndPassphrasePairsAreCorrect() {
        XCTAssertThrowsError(
            _ = try sut.decryptVerify(
                encrypted: cipherText,
                publicKeys: [],
                privateKeys: invalidKeyAndPassphrasePairs,
                verifyTime: 0
            )
        )
    }

    func testSignatureVerificationWorksIfAtLeastOnePublicKeyMatches() throws {
        let publicKeys: [Data] = try [privateKey2, privateKey].map { try CryptoGo.CryptoKey(fromArmored: $0)!.getPublicKey() }

        let decrypted = try sut.decryptVerify(
            encrypted: cipherText,
            publicKeys: publicKeys,
            privateKeys: validKeyAndPassphrasePairs,
            verifyTime: 0
        )

        XCTAssertNil(decrypted.signatureVerificationErrorGoCrypto)
    }

    func testSignatureVerificationDoesntWorkIfNoneOfThePublicKeysMatch() throws {
        let mismatchingPublicKeys: [Data] = [ try CryptoGo.CryptoKey(fromArmored: privateKey2)!.getPublicKey()]

        let decrypted = try sut.decryptVerify(
            encrypted: cipherText,
            publicKeys: mismatchingPublicKeys,
            privateKeys: validKeyAndPassphrasePairs,
            verifyTime: 0
        )

        XCTAssertNotNil(decrypted.signatureVerificationErrorGoCrypto)
    }
}
