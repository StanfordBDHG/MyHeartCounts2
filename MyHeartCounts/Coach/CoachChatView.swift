//
//  CoachChatView.swift
//  MyHeartCounts
//
//  Created by Vishnu Ravi on 10/14/24.
//

import SpeziChat
import SpeziLLM
import SpeziLLMOpenAI
import SwiftUI

struct CoachChatView: View {
    static let schema = LLMOpenAISchema(
        parameters: .init(
            modelType: .gpt4_o,
            systemPrompt: """
                You are a health coach that helps people take care of their cardiovascular health.
            """
        )
    )
    
    @LLMSessionProvider(schema: Self.schema) var llm: LLMOpenAISession
    @State var showOnboarding = false
    @State var muted = true
    
    var body: some View {
        LLMChatView(session: $llm)
            .speak(llm.context.chat, muted: muted)
            .speechToolbarButton(muted: $muted)
            .navigationTitle("Health Coach")
    }
}

#Preview {
    CoachChatView()
}
