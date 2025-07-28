// Selah-IM-V2 Application Types
// Consciousness-serving data structures

export interface UserApplication {
  id?: string
  created_at?: string
  updated_at?: string
  
  // Sacred Intake Questions
  preferred_name: string
  email: string
  discovery_story: string
  tech_relationship: string
  
  // Claude AI Analysis
  claude_analysis?: ClaudeAnalysis
  personalization_vectors?: PersonalizationVectors
  contemplative_readiness_score?: number
  ai_insights?: string
  
  // Application Management
  beta_status: 'pending' | 'accepted' | 'waitlist' | 'declined'
  admin_notes?: string
  reviewed_at?: string
  reviewed_by?: string
  
  // Email Communication
  welcome_email_sent: boolean
  welcome_email_sent_at?: string
  email_subject_line?: string
  email_content?: string
  email_opened: boolean
  email_opened_at?: string
  
  // Contemplative Context
  contemplative_context?: Record<string, any>
  source_data?: Record<string, any>
}

export interface ClaudeAnalysis {
  contemplative_readiness_score: number
  key_themes: string[]
  personalization_insights: string[]
  communication_approach: string
  discovery_authenticity: number
  tech_awareness_level: number
  recommended_next_steps: string[]
  admin_recommendation: 'strong_accept' | 'accept' | 'waitlist' | 'decline'
  reasoning: string
}

export interface PersonalizationVectors {
  discovery_category: string
  tech_relationship_type: string
  consciousness_language: string[]
  engagement_style: string
  readiness_indicators: string[]
}

export interface SacredIntakeData {
  preferred_name: string
  email: string
  discovery_story: string
  tech_relationship: string
}

export interface EmailTemplate {
  id: string
  template_name: string
  template_type: 'welcome' | 'acceptance' | 'waitlist' | 'follow_up'
  subject_template: string
  body_template: string
  variables: Record<string, string>
  is_active: boolean
}

export interface ContemplativeAnalytics {
  event_type: string
  user_id?: string
  contemplative_context: Record<string, any>
  depth_metrics: Record<string, any>
}
