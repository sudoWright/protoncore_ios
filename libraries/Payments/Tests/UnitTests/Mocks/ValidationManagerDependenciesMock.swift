//
//  ValidationManagerDependenciesMock.swift
//  ProtonCore-Payments-Tests - Created on 07/09/2021.
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
import StoreKit
#if canImport(ProtonCoreTestingToolkitUnitTestsPayments)
import ProtonCoreTestingToolkitUnitTestsCore
import ProtonCoreTestingToolkitUnitTestsPayments
#else
import ProtonCoreTestingToolkit
#endif
@testable import ProtonCorePayments
import ProtonCoreUtilities

public final class ValidationManagerDependenciesMock: ValidationManagerDependencies {

    public init() {}

    @PropertyStub(\ValidationManagerDependencies.planService, initialGet: .left(ServicePlanDataServiceMock())) public var planServiceStub
    public var planService: Either<ServicePlanDataServiceProtocol, PlansDataSourceProtocol> { planServiceStub() }

    @PropertyStub(\ValidationManagerDependencies.products, initialGet: []) public var productsStub
    public var products: [SKProduct] { productsStub() }
}
