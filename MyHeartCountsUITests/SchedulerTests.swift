//
// This source file is part of the MyHeartCounts based on the Stanford Spezi Template Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import XCTest
import XCTestExtensions


class SchedulerTests: XCTestCase {
    @MainActor
    override func setUp() async throws {
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["--skipOnboarding", "--testSchedule"]
        app.deleteAndLaunch(withSpringboardAppName: "MyHeartCounts")
    }
    

    @MainActor
    func testScheduler() throws {
        let app = XCUIApplication()

        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 2.0))

        XCTAssertTrue(app.tabBars["Tab Bar"].buttons["Schedule"].exists)
        app.tabBars["Tab Bar"].buttons["Schedule"].tap()
        
        XCTAssertTrue(app.staticTexts["Start Questionnaire"].waitForExistence(timeout: 2))
        app.staticTexts["Start Questionnaire"].tap()
        
        XCTAssertTrue(app.staticTexts["Social Support"].waitForExistence(timeout: 2))
    }
}
