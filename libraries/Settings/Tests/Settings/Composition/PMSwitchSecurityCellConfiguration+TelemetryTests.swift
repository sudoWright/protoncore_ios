//
//  PMSwitchSecurityCellConfiguration+TelemetryTests.swift
//  ProtonCore-Settings - Created on 16.11.22.
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

#if os(iOS)

import XCTest
@testable import ProtonCoreSettings

@available(iOS 13.0, *)
final class PMSwitchSecurityCellConfigurationTelemetryTests: XCTestCase {
    private var delegate: TelemetrySettingsDelegateMock!
    private var service: TelemetrySettingsServiceMock!
    
    override func setUp() {
        super.setUp()
        delegate = TelemetrySettingsDelegateMock()
        service = TelemetrySettingsServiceMock()
    }
    
    func test_telemetry_retursCorrectConfiguration() {
        let result = PMSwitchSecurityCellConfiguration.telemetry(
            delegate: delegate,
            telemetrySettingsService: service
        )
        
        XCTAssertEqual(result.title, "Telemetry")
        XCTAssertTrue(result.switcher.isActive)
    }
    
    class TelemetrySettingsDelegateMock: TelemetrySettingsDelegate {
        func didSetTelemetry(isEnabled: Bool) {}
    }
    
    class TelemetrySettingsServiceMock: TelemetrySettingsServiceProtocol {
        func setIsTelemetryEnabled(state: Bool) {}
        var isTelemetryEnabled: Bool = true
    }
}

#endif
