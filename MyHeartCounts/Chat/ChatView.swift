//
// This source file is part of the MyHeartCounts based on the Stanford Spezi Template Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SpeziChat
import SpeziLLM
import SpeziLLMOpenAI
import SwiftUI

struct ChatView: View {
    static let schema = LLMOpenAISchema(
        parameters: .init(
            modelType: .gpt4_o,
            systemPrompt: """
                You are a health coach that helps people take care of their cardiovascular health.
            """
        )
    )
    
    @LLMSessionProvider(schema: Self.schema) var llm: LLMOpenAISession
    @State var muted = true
    
    var body: some View {
        LLMChatView(session: $llm)
            .speak(llm.context.chat, muted: muted)
            .speechToolbarButton(muted: $muted)
            .navigationTitle("CHAT_VIEW_TITLE")
    }
}

#Preview {
    ChatView()
}
