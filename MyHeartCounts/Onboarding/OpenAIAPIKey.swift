//
//  OpenAIAPIKey.swift
//  MyHeartCounts
//
//  Created by Vishnu Ravi on 10/14/24.
//

import SpeziLLM
import SpeziLLMOpenAI
import SpeziOnboarding
import SwiftUI


struct OpenAIAPIKey: View {
    @Environment(OnboardingNavigationPath.self) private var onboardingNavigationPath
    
    var body: some View {
        LLMOpenAIAPITokenOnboardingStep {
            onboardingNavigationPath.nextStep()
        }
    }
}
#Preview {
    OpenAIAPIKey()
}
