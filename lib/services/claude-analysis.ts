// Claude AI Analysis Service
// Stone-like AI for consciousness recognition

import Anthropic from '@anthropic-ai/sdk'
import { 
  ClaudeApplicationAnalysisRequest, 
  ClaudeApplicationAnalysisResponse,
  ClaudeEmailGenerationRequest,
  ClaudeEmailGenerationResponse 
} from '@/types/claude'

const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY,
})

export class ClaudeAnalysisService {
  /**
   * Analyze user application for contemplative readiness and personalization
   */
  static async analyzeApplication(
    request: ClaudeApplicationAnalysisRequest
  ): Promise<ClaudeApplicationAnalysisResponse> {
    try {
      const prompt = this.buildAnalysisPrompt(request.application)
      
      const response = await anthropic.messages.create({
        model: 'claude-3-sonnet-20240229',
        max_tokens: 1500,
        temperature: 0.3, // Consistent, thoughtful analysis
        messages: [
          {
            role: 'user',
            content: prompt
          }
        ]
      })
      
      const analysisText = response.content[0].text
      return this.parseAnalysisResponse(analysisText)
      
    } catch (error) {
      console.error('Claude analysis failed:', error)
      throw new Error('Failed to analyze application with Claude')
    }
  }

  /**
   * Generate personalized welcome email using Claude
   */
  static async generatePersonalizedEmail(
    request: ClaudeEmailGenerationRequest
  ): Promise<ClaudeEmailGenerationResponse> {
    try {
      const prompt = this.buildEmailPrompt(request)
      
      const response = await anthropic.messages.create({
        model: 'claude-3-sonnet-20240229',
        max_tokens: 1000,
        temperature: 0.4, // Slightly more creative for personalization
        messages: [
          {
            role: 'user',
            content: prompt
          }
        ]
      })
      
      const emailText = response.content[0].text
      return this.parseEmailResponse(emailText)
      
    } catch (error) {
      console.error('Claude email generation failed:', error)
      throw new Error('Failed to generate personalized email')
    }
  }

  /**
   * Build contemplative analysis prompt
   */
  private static buildAnalysisPrompt(application: any): string {
    return `You are analyzing an application for Selah, a contemplative technology platform that serves consciousness rather than consuming it.

This person has shared their relationship with technology and their discovery story. Analyze their readiness for consciousness-serving technology.

Application Context:
- Name: ${application.preferred_name}
- Discovery Story: ${application.discovery_story}
- Technology Relationship: ${application.tech_relationship}

Provide contemplative analysis focusing on:
1. Readiness for consciousness-serving technology (1-10 score)
2. Key themes in their language reflecting contemplative openness
3. Personalization insights for communication
4. Communication approach recommendations
5. Discovery authenticity assessment
6. Technology relationship depth analysis
7. Admin recommendation for beta access
8. Email personalization suggestions

Respond as JSON with the structure matching ClaudeApplicationAnalysisResponse interface.
Focus on recognition rather than optimization, consciousness rather than productivity.`
  }

  /**
   * Build personalized email generation prompt
   */
  private static buildEmailPrompt(request: ClaudeEmailGenerationRequest): string {
    return `Generate a personalized welcome email for ${request.application.preferred_name} applying to Selah contemplative technology beta.

Their Context:
- Discovery: ${request.application.discovery_story}
- Tech Relationship: ${request.application.tech_relationship}

Analysis Insights: ${JSON.stringify(request.analysis)}

Create:
1. Subject line reflecting their specific discovery story
2. Email content that mirrors their exact language back to them
3. Recognition of their contemplative readiness
4. Custom next steps based on their individual context

Tone: Consciousness recognizing consciousness, not corporate outreach.
Length: 200-300 words that feel personally crafted.
Style: Warm, contemplative, professional but not corporate.

Respond as JSON with subject_line and email_content fields.`
  }

  /**
   * Parse Claude analysis response into structured data
   */
  private static parseAnalysisResponse(text: string): ClaudeApplicationAnalysisResponse {
    try {
      return JSON.parse(text)
    } catch (error) {
      // Fallback parsing if JSON fails
      console.error('Failed to parse Claude analysis:', error)
      return {
        contemplative_readiness_score: 5,
        key_themes: ['general contemplative interest'],
        personalization_insights: [],
        communication_approach: {
          tone: 'contemplative',
          language_style: ['warm', 'thoughtful'],
          topics_to_emphasize: ['presence', 'awareness'],
          topics_to_avoid: ['optimization', 'productivity']
        },
        discovery_analysis: {
          discovery_category: 'general',
          authenticity_score: 5,
          depth_indicators: [],
          community_fit_score: 5
        },
        tech_relationship_analysis: {
          awareness_level: 'developing',
          pain_points: ['digital overwhelm'],
          readiness_indicators: [],
          optimization_vs_serving_understanding: 5
        },
        admin_recommendation: {
          decision: 'waitlist',
          confidence: 5,
          reasoning: 'Analysis parsing failed, manual review needed',
          suggested_follow_up: 'Manual review required',
          community_contribution_potential: 5
        },
        email_personalization: {
          subject_line: `Welcome to Selah, ${text.split('"preferred_name"')[1]?.split('"')[1] || 'friend'}`,
          opening_approach: 'warm and contemplative',
          personal_reflection_points: [],
          next_steps: ['Manual follow-up'],
          tone_adjustments: []
        }
      }
    }
  }

  /**
   * Parse Claude email response
   */
  private static parseEmailResponse(text: string): ClaudeEmailGenerationResponse {
    try {
      return JSON.parse(text)
    } catch (error) {
      console.error('Failed to parse Claude email:', error)
      return {
        subject_line: 'Welcome to Selah - Your contemplative journey begins',
        email_content: 'Thank you for your interest in contemplative technology. We will be in touch soon.',
        personalization_points: [],
        send_timing_recommendation: 'immediate'
      }
    }
  }
}
