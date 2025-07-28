-- Selah-IM-V2 Database Schema
-- Contemplative Technology User Applications

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- User Applications Table
CREATE TABLE user_applications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Personal Recognition (Sacred Intake Question 1)
  preferred_name TEXT NOT NULL,
  
  -- Email Connection (Sacred Intake Question 2)
  email TEXT NOT NULL UNIQUE,
  
  -- Discovery Story (Sacred Intake Question 3)
  discovery_story TEXT NOT NULL,
  
  -- Technology Relationship (Sacred Intake Question 4)
  tech_relationship TEXT NOT NULL,
  
  -- Claude AI Analysis Results
  claude_analysis JSONB,
  personalization_vectors JSONB,
  contemplative_readiness_score INTEGER CHECK (contemplative_readiness_score >= 1 AND contemplative_readiness_score <= 10),
  ai_insights TEXT,
  
  -- Application Status Management
  beta_status TEXT DEFAULT 'pending' CHECK (beta_status IN ('pending', 'accepted', 'waitlist', 'declined')),
  admin_notes TEXT,
  reviewed_at TIMESTAMP WITH TIME ZONE,
  reviewed_by TEXT,
  
  -- Email Communication Tracking
  welcome_email_sent BOOLEAN DEFAULT FALSE,
  welcome_email_sent_at TIMESTAMP WITH TIME ZONE,
  email_subject_line TEXT,
  email_content TEXT,
  email_opened BOOLEAN DEFAULT FALSE,
  email_opened_at TIMESTAMP WITH TIME ZONE,
  
  -- Contemplative Analytics (Depth, not surveillance)
  contemplative_context JSONB,
  source_data JSONB
);

-- Email Templates Table
CREATE TABLE email_templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  template_name TEXT NOT NULL UNIQUE,
  template_type TEXT NOT NULL CHECK (template_type IN ('welcome', 'acceptance', 'waitlist', 'follow_up')),
  subject_template TEXT NOT NULL,
  body_template TEXT NOT NULL,
  variables JSONB, -- Dynamic personalization variables
  is_active BOOLEAN DEFAULT TRUE,
  
  created_by TEXT,
  version INTEGER DEFAULT 1
);

-- Contemplative Analytics Table
CREATE TABLE contemplative_analytics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  event_type TEXT NOT NULL, -- 'application_submitted', 'email_opened', 'admin_reviewed', etc.
  user_id UUID REFERENCES user_applications(id) ON DELETE CASCADE,
  
  -- Consciousness-focused metrics, not surveillance
  contemplative_context JSONB,
  depth_metrics JSONB,
  
  -- Technical context
  user_agent TEXT,
  ip_address INET,
  session_data JSONB
);

-- Row Level Security for Sacred Data Protection
ALTER TABLE user_applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE email_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE contemplative_analytics ENABLE ROW LEVEL SECURITY;

-- Admin Access Policy
CREATE POLICY "Admin full access" ON user_applications
  FOR ALL USING (
    current_setting('app.current_user_email', true) = 'ahiya@selah.im' OR
    current_setting('app.current_user_role', true) = 'admin'
  );

CREATE POLICY "Admin template access" ON email_templates
  FOR ALL USING (
    current_setting('app.current_user_email', true) = 'ahiya@selah.im' OR
    current_setting('app.current_user_role', true) = 'admin'
  );

-- User can view their own application status (future feature)
CREATE POLICY "User own application" ON user_applications
  FOR SELECT USING (
    email = current_setting('app.current_user_email', true)
  );

-- Indexes for Performance
CREATE INDEX idx_user_applications_email ON user_applications(email);
CREATE INDEX idx_user_applications_status ON user_applications(beta_status);
CREATE INDEX idx_user_applications_created ON user_applications(created_at DESC);
CREATE INDEX idx_contemplative_analytics_user ON contemplative_analytics(user_id);
CREATE INDEX idx_contemplative_analytics_event ON contemplative_analytics(event_type);

-- Updated timestamp triggers
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_user_applications_updated_at
  BEFORE UPDATE ON user_applications
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_email_templates_updated_at
  BEFORE UPDATE ON email_templates
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Insert default email templates
INSERT INTO email_templates (template_name, template_type, subject_template, body_template, variables) VALUES
('welcome_personalized', 'welcome', 'Welcome to Selah, {{preferred_name}} - Your contemplative journey begins', 
'Hello {{preferred_name}},

Thank you for sharing your relationship with technology and your discovery of contemplative approaches. 

Based on your response about {{discovery_context}}, we recognize you are ready for technology that serves consciousness rather than consuming it.

Your application is being thoughtfully reviewed. We are building a sacred community of contemplative practitioners who understand that recognition, not optimization, is the path.

We will be in touch soon.

In stillness,
The Selah Team

Built with reverence by Ahiya & Professor Oded Maimon', 
'{"preferred_name": "string", "discovery_context": "string", "tech_awareness": "string"}');
