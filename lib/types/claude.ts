// Claude AI Integration Types
// Stone-like AI serving consciousness

export interface ClaudeApplicationAnalysisRequest {
  application: SacredIntakeData
  analysis_type: 'initial' | 'detailed' | 'personalization'
}

export interface ClaudeApplicationAnalysisResponse {
  contemplative_readiness_score: number
  key_themes: string[]
  personalization_insights: PersonalizationInsight[]
  communication_approach: CommunicationApproach
  discovery_analysis: DiscoveryAnalysis
  tech_relationship_analysis: TechRelationshipAnalysis
  admin_recommendation: AdminRecommendation
  email_personalization: EmailPersonalization
}

export interface PersonalizationInsight {
  category: string
  insight: string
  confidence: number
  application_areas: string[]
}

export interface CommunicationApproach {
  tone: 'contemplative' | 'warm' | 'professional' | 'deep'
  language_style: string[]
  topics_to_emphasize: string[]
  topics_to_avoid: string[]
}

export interface DiscoveryAnalysis {
  discovery_category: string
  authenticity_score: number
  depth_indicators: string[]
  community_fit_score: number
}

export interface TechRelationshipAnalysis {
  awareness_level: 'surface' | 'developing' | 'deep' | 'profound'
  pain_points: string[]
  readiness_indicators: string[]
  optimization_vs_serving_understanding: number
}

export interface AdminRecommendation {
  decision: 'strong_accept' | 'accept' | 'waitlist' | 'decline'
  confidence: number
  reasoning: string
  suggested_follow_up: string
  community_contribution_potential: number
}

export interface EmailPersonalization {
  subject_line: string
  opening_approach: string
  personal_reflection_points: string[]
  next_steps: string[]
  tone_adjustments: string[]
}

export interface ClaudeEmailGenerationRequest {
  application: SacredIntakeData
  analysis: ClaudeApplicationAnalysisResponse
  template_type: 'welcome' | 'acceptance' | 'waitlist'
}

export interface ClaudeEmailGenerationResponse {
  subject_line: string
  email_content: string
  personalization_points: string[]
  send_timing_recommendation: string
}

export interface SacredIntakeData {
  preferred_name: string
  email: string
  discovery_story: string
  tech_relationship: string
}
