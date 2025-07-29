#!/bin/bash

# SELAH-IM-V2 Foundation Setup Script
# Consciousness-First Technology Architecture
# Built with reverence by Ahiya

set -e

echo "🪨 Setting up SELAH-IM-V2: Contemplative Landing Page Foundation"
echo "======================================================================================"

# Colors for contemplative output
STONE_GREY='\033[0;37m'
BREATHING_GREEN='\033[0;32m'
BREATHING_BLUE='\033[0;34m'
BREATHING_GOLD='\033[0;33m'
CONTEMPLATIVE_WHITE='\033[0;97m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -d ".git" ]; then
    echo -e "${BREATHING_BLUE}🔄 Cloning Selah-IM-V2 repository...${NC}"
    git clone git@github.com:Ahiya1/selah-im-v2.git
    cd selah-im-v2
fi

echo -e "${BREATHING_GREEN}🧘 Creating contemplative project structure...${NC}"

# Create main directory structure
mkdir -p app/{api/{applications/{submit,[id]},claude/{analyze,personalize},emails/{send,templates},admin/{applications,auth}},admin/{applications/[id]}}
mkdir -p components/{sacred-intake,journey,contemplative,admin,email-templates,mobile}
mkdir -p lib/{services,email,types,utils,prompts}
mkdir -p styles
mkdir -p public/{email-assets,app-screenshots}
mkdir -p supabase/{migrations,types}

echo -e "${STONE_GREY}📱 Setting up mobile-first Next.js 14 foundation...${NC}"

# Create package.json with contemplative dependencies
cat > package.json << 'EOF'
{
  "name": "selah-im-v2",
  "version": "0.1.0",
  "private": true,
  "description": "Contemplative technology landing page - consciousness serving consciousness",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit",
    "db:generate-types": "supabase gen types typescript --project-id $(cat .env.local | grep NEXT_PUBLIC_SUPABASE_URL | cut -d'=' -f2 | cut -d'/' -f3 | cut -d'.' -f1) > supabase/types.ts"
  },
  "dependencies": {
    "next": "^14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "typescript": "^5.0.0",
    "@types/node": "^20.0.0",
    "@types/react": "^18.3.0",
    "@types/react-dom": "^18.3.0",
    "@supabase/supabase-js": "^2.39.0",
    "@anthropic-ai/sdk": "^0.20.0",
    "resend": "^3.2.0",
    "tailwindcss": "^3.4.0",
    "autoprefixer": "^10.4.0",
    "postcss": "^8.4.0",
    "zod": "^3.22.0",
    "react-hook-form": "^7.51.0",
    "@hookform/resolvers": "^3.3.0",
    "clsx": "^2.1.0",
    "framer-motion": "^11.0.0",
    "date-fns": "^3.6.0"
  },
  "devDependencies": {
    "eslint": "^8.57.0",
    "eslint-config-next": "14.2.0",
    "@tailwindcss/typography": "^0.5.0"
  }
}
EOF

# Create TypeScript configuration
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "lib": ["dom", "dom.iterable", "es6"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "baseUrl": ".",
    "paths": {
      "@/*": ["./*"],
      "@/components/*": ["./components/*"],
      "@/lib/*": ["./lib/*"],
      "@/styles/*": ["./styles/*"],
      "@/types/*": ["./lib/types/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
EOF

# Create Next.js configuration
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    typedRoutes: true
  },
  images: {
    domains: ['via.placeholder.com'],
    formats: ['image/webp', 'image/avif']
  },
  env: {
    SITE_URL: process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : 'http://localhost:3000'
  }
}

module.exports = nextConfig
EOF

# Create Tailwind configuration with contemplative design system
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'stone-black': '#0a0a0a',
        'stone-grey': '#6b7280',
        'stone-white': '#e5e7eb',
        'breathing-green': '#22c55e',
        'breathing-blue': '#3b82f6',
        'breathing-gold': '#f59e0b',
        'contemplative-white': '#fafafa',
      },
      animation: {
        'breathe': 'breathe 4s ease-in-out infinite',
        'sacred-pulse': 'sacred-pulse 6s ease-in-out infinite',
        'contemplative-fade': 'contemplative-fade 0.8s ease-out',
      },
      keyframes: {
        breathe: {
          '0%, 100%': { transform: 'scale(1)' },
          '50%': { transform: 'scale(1.02)' },
        },
        'sacred-pulse': {
          '0%, 100%': { opacity: '0.8' },
          '50%': { opacity: '1' },
        },
        'contemplative-fade': {
          '0%': { opacity: '0', transform: 'translateY(10px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
      spacing: {
        'contemplative': '1.618rem', // Golden ratio spacing
        'sacred': '2.618rem',
      },
      fontFamily: {
        'contemplative': ['Inter', 'system-ui', 'sans-serif'],
      },
      screens: {
        'mobile-contemplative': '375px',
        'tablet-contemplative': '768px',
        'desktop-contemplative': '1024px',
        'large-contemplative': '1280px',
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
EOF

# Create PostCSS configuration
cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Create Vercel deployment configuration
cat > vercel.json << 'EOF'
{
  "buildCommand": "npm run build",
  "outputDirectory": ".next",
  "framework": "nextjs",
  "functions": {
    "app/api/applications/submit/route.ts": {
      "maxDuration": 30
    },
    "app/api/claude/analyze/route.ts": {
      "maxDuration": 20
    },
    "app/api/emails/send/route.ts": {
      "maxDuration": 15
    }
  },
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        }
      ]
    }
  ]
}
EOF

echo -e "${BREATHING_GOLD}🎨 Creating contemplative styles foundation...${NC}"

# Create global CSS with breathing animations
cat > app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Contemplative CSS Variables */
:root {
  --stone-black: #0a0a0a;
  --stone-grey: #6b7280;
  --stone-white: #e5e7eb;
  --breathing-green: #22c55e;
  --breathing-blue: #3b82f6;
  --breathing-gold: #f59e0b;
  --contemplative-white: #fafafa;
  
  /* Sacred timing variables */
  --sacred-rhythm: 4s;
  --contemplative-ease: cubic-bezier(0.23, 1, 0.32, 1);
  --breathing-duration: 4s;
}

/* Base contemplative styles */
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

html,
body {
  max-width: 100vw;
  overflow-x: hidden;
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  background: linear-gradient(135deg, var(--contemplative-white) 0%, var(--stone-white) 100%);
  color: var(--stone-black);
  line-height: 1.618; /* Golden ratio */
}

/* Breathing animation utilities */
@layer utilities {
  .breathing-element {
    animation: breathe var(--breathing-duration) ease-in-out infinite;
  }
  
  .sacred-transition {
    transition: all 0.4s var(--contemplative-ease);
  }
  
  .contemplative-spacing {
    padding: 1.618rem; /* Golden ratio spacing */
  }
  
  .mobile-contemplative {
    @apply px-4 py-6;
  }
  
  .tablet-contemplative {
    @apply px-8 py-12;
  }
  
  .desktop-contemplative {
    @apply px-16 py-24;
  }
}

/* Mobile-first responsive contemplative design */
@media (max-width: 767px) {
  .contemplative-container {
    @apply mobile-contemplative;
  }
  
  .breathing-element {
    animation-duration: 3s; /* Slightly faster on mobile for attention */
  }
}

@media (min-width: 768px) and (max-width: 1023px) {
  .contemplative-container {
    @apply tablet-contemplative;
  }
}

@media (min-width: 1024px) {
  .contemplative-container {
    @apply desktop-contemplative;
  }
}

/* Accessibility and contemplative focus states */
.sacred-focus {
  @apply outline-none ring-2 ring-breathing-blue ring-opacity-50 ring-offset-2;
}

/* Loading states as meditation moments */
.contemplative-loading {
  @apply animate-sacred-pulse;
}
EOF

# Create contemplative variables CSS
cat > styles/contemplative-variables.css << 'EOF'
/* Contemplative Design System Variables */

/* Sacred Colors - Stone-like Foundation */
:root {
  --color-stone-black: #0a0a0a;
  --color-stone-grey: #6b7280;
  --color-stone-light: #9ca3af;
  --color-stone-white: #e5e7eb;
  
  /* Breathing Colors - Life and Movement */
  --color-breathing-green: #22c55e;
  --color-breathing-green-light: #86efac;
  --color-breathing-blue: #3b82f6;
  --color-breathing-blue-light: #93c5fd;
  --color-breathing-gold: #f59e0b;
  --color-breathing-gold-light: #fde047;
  
  /* Contemplative Backgrounds */
  --color-contemplative-white: #fafafa;
  --color-contemplative-cream: #f9fafb;
  
  /* Sacred Timing - Natural Rhythms */
  --timing-breath: 4s;
  --timing-sacred-pulse: 6s;
  --timing-contemplative: 0.8s;
  --timing-meditation: 1.2s;
  
  /* Contemplative Easing */
  --ease-contemplative: cubic-bezier(0.23, 1, 0.32, 1);
  --ease-breathing: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-sacred: cubic-bezier(0.25, 0.46, 0.45, 0.94);
  
  /* Golden Ratio Spacing */
  --space-phi: 1.618rem;
  --space-phi-small: 1rem;
  --space-phi-large: 2.618rem;
  --space-phi-xl: 4.236rem;
  
  /* Contemplative Typography Scale */
  --text-contemplative-xs: 0.75rem;
  --text-contemplative-sm: 0.875rem;
  --text-contemplative-base: 1rem;
  --text-contemplative-lg: 1.125rem;
  --text-contemplative-xl: 1.25rem;
  --text-contemplative-2xl: 1.5rem;
  --text-contemplative-3xl: 1.875rem;
  
  /* Mobile Contemplative Adjustments */
  --mobile-space-phi: 1rem;
  --mobile-text-scale: 0.9;
  --mobile-breath-duration: 3s;
}

/* Mobile-first contemplative variables */
@media (max-width: 767px) {
  :root {
    --timing-breath: var(--mobile-breath-duration);
    --space-phi: var(--mobile-space-phi);
  }
}

/* Sacred Z-index layers */
:root {
  --z-contemplative-background: 0;
  --z-contemplative-content: 10;
  --z-breathing-elements: 20;
  --z-sacred-navigation: 30;
  --z-modal-contemplative: 40;
  --z-admin-overlay: 50;
}
EOF

echo -e "${CONTEMPLATIVE_WHITE}📄 Creating core application files...${NC}"

# Create root layout
cat > app/layout.tsx << 'EOF'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Selah | Contemplative Technology',
  description: 'Technology that breathes with you. Sacred pause in a hyper-connected world. Recognition over optimization.',
  keywords: ['contemplative technology', 'meditation', 'consciousness', 'mindfulness', 'sacred pause'],
  authors: [{ name: 'Ahiya & Professor Oded Maimon' }],
  openGraph: {
    title: 'Selah | Contemplative Technology',
    description: 'Technology that breathes with you. Sacred pause in a hyper-connected world.',
    url: 'https://selah.im',
    siteName: 'Selah',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Selah | Contemplative Technology',
    description: 'Technology that breathes with you. Sacred pause in a hyper-connected world.',
  },
  viewport: 'width=device-width, initial-scale=1, viewport-fit=cover',
  themeColor: '#6b7280',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" className="scroll-smooth">
      <body className={`${inter.className} antialiased bg-contemplative-white text-stone-black`}>
        <div className="min-h-screen flex flex-col">
          {children}
        </div>
      </body>
    </html>
  )
}
EOF

# Create main landing page
cat > app/page.tsx << 'EOF'
import { BubbleContainer } from '@/components/journey/BubbleContainer'
import { ProblemBubble } from '@/components/journey/ProblemBubble'
import { SolutionBubble } from '@/components/journey/SolutionBubble'
import { RealityBubble } from '@/components/journey/RealityBubble'
import { InvitationBubble } from '@/components/journey/InvitationBubble'

export default function ContemplativeLandingPage() {
  return (
    <main className="contemplative-container min-h-screen">
      {/* Selah Header with Breathing Logo */}
      <header className="text-center py-sacred">
        <div className="breathing-element">
          <h1 className="text-3xl md:text-4xl font-bold text-stone-black">
            🪨 <span className="text-breathing-blue">SELAH</span> 🪨
          </h1>
          <p className="text-stone-grey mt-2 text-lg">
            You are here
          </p>
        </div>
      </header>

      {/* Four-Bubble Contemplative Journey */}
      <BubbleContainer>
        <ProblemBubble />
        <SolutionBubble />
        <RealityBubble />
        <InvitationBubble />
      </BubbleContainer>

      {/* Sacred Footer */}
      <footer className="text-center py-sacred text-stone-grey">
        <p className="text-sm">
          Built with reverence by Ahiya & Professor Oded Maimon
        </p>
        <p className="text-xs mt-1">
          Technology that breathes with you
        </p>
      </footer>
    </main>
  )
}
EOF

echo -e "${BREATHING_BLUE}🗄️ Setting up database schema...${NC}"

# Create Supabase migration for user applications
cat > supabase/migrations/001_user_applications.sql << 'EOF'
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
EOF

# Create TypeScript types for applications
cat > lib/types/application.ts << 'EOF'
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
EOF

# Create Claude AI types
cat > lib/types/claude.ts << 'EOF'
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
EOF

echo -e "${BREATHING_GREEN}🤖 Setting up Claude AI service...${NC}"

# Create Claude analysis service
cat > lib/services/claude-analysis.ts << 'EOF'
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
EOF

echo -e "${BREATHING_GOLD}📧 Setting up email service...${NC}"

# Create Resend email service
cat > lib/services/resend.ts << 'EOF'
// Resend Email Service
// Beautiful contemplative communication

import { Resend } from 'resend'
import { EmailTemplate } from '@/types/application'

const resend = new Resend(process.env.RESEND_API_KEY)

export interface EmailSendRequest {
  to: string
  subject: string
  content: string
  template_type?: string
  user_id?: string
}

export interface EmailSendResponse {
  success: boolean
  message_id?: string
  error?: string
}

export class ResendEmailService {
  /**
   * Send personalized welcome email with contemplative design
   */
  static async sendPersonalizedWelcome(
    request: EmailSendRequest
  ): Promise<EmailSendResponse> {
    try {
      const htmlContent = this.renderContemplativeTemplate(request.content)
      
      const response = await resend.emails.send({
        from: 'hello@selah.im',
        to: request.to,
        subject: request.subject,
        html: htmlContent,
        headers: {
          'X-Contemplative-Source': 'selah-im-v2',
          'X-Template-Type': request.template_type || 'welcome'
        }
      })
      
      return {
        success: true,
        message_id: response.data?.id
      }
      
    } catch (error) {
      console.error('Email sending failed:', error)
      return {
        success: false,
        error: error instanceof Error ? error.message : 'Unknown email error'
      }
    }
  }

  /**
   * Render email content with beautiful contemplative template
   */
  private static renderContemplativeTemplate(content: string): string {
    return `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Selah | Contemplative Technology</title>
  <style>
    body { 
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; 
      line-height: 1.618; 
      color: #0a0a0a;
      background: linear-gradient(135deg, #fafafa 0%, #e5e7eb 100%);
      margin: 0;
      padding: 20px;
    }
    .sacred-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 2rem;
      background: white;
      border-radius: 12px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    }
    .breathing-logo {
      text-align: center;
      margin-bottom: 2rem;
      animation: breathe 4s ease-in-out infinite;
    }
    .breathing-logo h1 {
      font-size: 1.5rem;
      color: #3b82f6;
      margin: 0;
    }
    .contemplative-content {
      white-space: pre-line;
      margin: 1.5rem 0;
    }
    .sacred-footer {
      margin-top: 2rem; 
      padding-top: 2rem; 
      border-top: 1px solid #e5e7eb; 
      text-align: center; 
      color: #6b7280;
      font-size: 0.875rem;
    }
    @keyframes breathe {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.02); }
    }
    @media (max-width: 600px) {
      .sacred-container {
        padding: 1rem;
        margin: 0 10px;
      }
    }
  </style>
</head>
<body>
  <div class="sacred-container">
    <div class="breathing-logo">
      <h1>🪨 SELAH 🪨</h1>
      <p style="color: #6b7280; margin: 0.5rem 0 0 0;">You are here</p>
    </div>
    
    <div class="contemplative-content">
      ${content}
    </div>
    
    <div class="sacred-footer">
      Built with reverence by Ahiya & Professor Oded Maimon<br>
      <em>Technology that breathes with you</em>
    </div>
  </div>
</body>
</html>
    `
  }

  /**
   * Send admin notification for new application
   */
  static async sendAdminNotification(
    application: any
  ): Promise<EmailSendResponse> {
    try {
      const subject = `New Selah Application: ${application.preferred_name}`
      const content = `
New contemplative technology application received:

Name: ${application.preferred_name}
Email: ${application.email}

Discovery Story:
${application.discovery_story}

Technology Relationship:
${application.tech_relationship}

Review at: https://selah.im/admin/applications/${application.id}
      `
      
      return await this.sendPersonalizedWelcome({
        to: 'ahiya@selah.im',
        subject,
        content,
        template_type: 'admin_notification'
      })
      
    } catch (error) {
      console.error('Admin notification failed:', error)
      return {
        success: false,
        error: 'Failed to send admin notification'
      }
    }
  }
}
EOF

echo -e "${STONE_GREY}🔗 Creating API routes...${NC}"

# Create application submission API route
cat > app/api/applications/submit/route.ts << 'EOF'
// Sacred Application Submission API
// Consciousness-serving application processing

import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/services/supabase'
import { ClaudeAnalysisService } from '@/lib/services/claude-analysis'
import { ResendEmailService } from '@/lib/services/resend'
import { UserApplication, SacredIntakeData } from '@/types/application'
import { z } from 'zod'

// Sacred intake validation schema
const SacredIntakeSchema = z.object({
  preferred_name: z.string().min(1, 'Name is required for recognition').max(100),
  email: z.string().email('Valid email required for connection'),
  discovery_story: z.string().min(10, 'Please share your discovery story').max(2000),
  tech_relationship: z.string().min(10, 'Please share your technology relationship').max(2000)
})

export async function POST(request: NextRequest) {
  try {
    // Parse and validate sacred intake data
    const body = await request.json()
    const applicationData = SacredIntakeSchema.parse(body)
    
    console.log('Processing sacred intake for:', applicationData.preferred_name)
    
    // 1. Store initial application in Supabase
    const { data: storedApp, error: insertError } = await supabase
      .from('user_applications')
      .insert({
        preferred_name: applicationData.preferred_name,
        email: applicationData.email,
        discovery_story: applicationData.discovery_story,
        tech_relationship: applicationData.tech_relationship,
        beta_status: 'pending',
        contemplative_context: {
          submitted_at: new Date().toISOString(),
          user_agent: request.headers.get('user-agent'),
          source: 'selah-im-v2'
        }
      })
      .select()
      .single()
    
    if (insertError) {
      console.error('Supabase insertion failed:', insertError)
      return NextResponse.json(
        { error: 'Failed to store application. Please try again.' },
        { status: 500 }
      )
    }
    
    console.log('Application stored:', storedApp.id)
    
    // 2. Analyze with Claude (async, don't block response)
    ClaudeAnalysisService.analyzeApplication({
      application: applicationData,
      analysis_type: 'initial'
    })
    .then(async (claudeAnalysis) => {
      console.log('Claude analysis complete for:', storedApp.id)
      
      // 3. Generate personalized welcome email
      const personalizedEmail = await ClaudeAnalysisService.generatePersonalizedEmail({
        application: applicationData,
        analysis: claudeAnalysis,
        template_type: 'welcome'
      })
      
      // 4. Send welcome email
      const emailResult = await ResendEmailService.sendPersonalizedWelcome({
        to: applicationData.email,
        subject: personalizedEmail.subject_line,
        content: personalizedEmail.email_content,
        template_type: 'welcome',
        user_id: storedApp.id
      })
      
      // 5. Update application with analysis and email tracking
      await supabase
        .from('user_applications')
        .update({
          claude_analysis: claudeAnalysis,
          contemplative_readiness_score: claudeAnalysis.contemplative_readiness_score,
          welcome_email_sent: emailResult.success,
          welcome_email_sent_at: emailResult.success ? new Date().toISOString() : null,
          email_subject_line: personalizedEmail.subject_line,
          email_content: personalizedEmail.email_content
        })
        .eq('id', storedApp.id)
      
      console.log('Email sent:', emailResult.success)
      
      // 6. Send admin notification
      await ResendEmailService.sendAdminNotification(storedApp)
      
    })
    .catch(error => {
      console.error('Async processing failed:', error)
      // Continue gracefully - application is stored, can be processed manually
    })
    
    // Track contemplative analytics
    await supabase.from('contemplative_analytics').insert({
      event_type: 'application_submitted',
      user_id: storedApp.id,
      contemplative_context: {
        discovery_length: applicationData.discovery_story.length,
        tech_relationship_length: applicationData.tech_relationship.length,
        submission_flow: 'complete'
      }
    })
    
    return NextResponse.json({
      success: true,
      message: 'Your contemplative application has been received',
      application_id: storedApp.id
    })
    
  } catch (error) {
    console.error('Sacred application processing failed:', error)
    
    if (error instanceof z.ZodError) {
      return NextResponse.json(
        { 
          error: 'Please complete all contemplative questions',
          details: error.errors 
        },
        { status: 400 }
      )
    }
    
    return NextResponse.json(
      { error: 'Please try again in a moment' },
      { status: 500 }
    )
  }
}

export async function GET() {
  return NextResponse.json({ 
    message: 'Sacred intake endpoint active',
    timestamp: new Date().toISOString()
  })
}
EOF

echo -e "${BREATHING_BLUE}🧩 Creating UI components...${NC}"

# Create placeholder components for the four branches

# Branch 1: Contemplative Landing Experience Components
mkdir -p components/journey components/sacred-intake components/contemplative components/mobile

# Bubble Container
cat > components/journey/BubbleContainer.tsx << 'EOF'
'use client'

import { ReactNode } from 'react'

interface BubbleContainerProps {
  children: ReactNode
}

export function BubbleContainer({ children }: BubbleContainerProps) {
  return (
    <div className="contemplative-container max-w-4xl mx-auto">
      <div className="space-y-sacred md:space-y-phi-large">
        {children}
      </div>
    </div>
  )
}
EOF

# Problem Bubble
cat > components/journey/ProblemBubble.tsx << 'EOF'
'use client'

export function ProblemBubble() {
  return (
    <section className="breathing-element bg-white rounded-lg p-contemplative shadow-lg">
      <h2 className="text-2xl md:text-3xl font-bold text-stone-black mb-4">
        The Digital Overwhelm Crisis
      </h2>
      <div className="space-y-4 text-stone-grey">
        <p className="text-lg">
          📱 <strong>96x daily phone checks</strong> - your attention fragmenting every 10 minutes
        </p>
        <p className="text-lg">
          🧠 <strong>275 daily interruptions</strong> - consciousness scattered across notifications
        </p>
        <p className="text-lg">
          😰 <strong>70% worse sleep</strong> - technology hijacking your natural rhythms
        </p>
        <div className="mt-6 p-4 bg-stone-white rounded-lg">
          <p className="text-stone-black italic">
            "I feel wired but tired, drowning in notifications, 
            my attention pulled in infinite directions..."
          </p>
        </div>
      </div>
    </section>
  )
}
EOF

# Solution Bubble
cat > components/journey/SolutionBubble.tsx << 'EOF'
'use client'

export function SolutionBubble() {
  return (
    <section className="breathing-element bg-breathing-blue bg-opacity-5 rounded-lg p-contemplative">
      <h2 className="text-2xl md:text-3xl font-bold text-breathing-blue mb-4">
        Contemplative Technology: Recognition Over Optimization
      </h2>
      <div className="space-y-4">
        <div className="bg-white p-4 rounded-lg">
          <h3 className="font-semibold text-stone-black mb-2">🪨 Stone-like AI</h3>
          <p className="text-stone-grey">
            Grounded companions that recognize your wholeness, not chatty assistants trying to optimize you.
          </p>
        </div>
        <div className="bg-white p-4 rounded-lg">
          <h3 className="font-semibold text-stone-black mb-2">🧘 Presence over Productivity</h3>
          <p className="text-stone-grey">
            Technology that breathes with you, creating space for awareness rather than demanding attention.
          </p>
        </div>
        <div className="bg-white p-4 rounded-lg">
          <h3 className="font-semibold text-stone-black mb-2">🌸 Being vs Becoming</h3>
          <p className="text-stone-grey">
            Not improving yourself, but recognizing what you already are.
          </p>
        </div>
      </div>
    </section>
  )
}
EOF

# Reality Bubble
cat > components/journey/RealityBubble.tsx << 'EOF'
'use client'

export function RealityBubble() {
  return (
    <section className="breathing-element bg-breathing-green bg-opacity-5 rounded-lg p-contemplative">
      <h2 className="text-2xl md:text-3xl font-bold text-breathing-green mb-4">
        Selah App: Built and Available Now
      </h2>
      <div className="grid md:grid-cols-2 gap-6">
        <div>
          <h3 className="font-semibold text-stone-black mb-2">🧘 Meditation Chamber</h3>
          <p className="text-stone-grey mb-4">
            Breathing orb that responds to your touch. Left to inhale, right to exhale, pause for stillness.
          </p>
          <div className="bg-white p-3 rounded text-center">
            <div className="text-2xl mb-2">📱</div>
            <p className="text-xs text-stone-grey">Meditation Chamber Preview</p>
          </div>
        </div>
        <div>
          <h3 className="font-semibold text-stone-black mb-2">💭 Contemplation Chamber</h3>
          <p className="text-stone-grey mb-4">
            AI-generated questions that evolve with your consciousness, creating space for recognition.
          </p>
          <div className="bg-white p-3 rounded text-center">
            <div className="text-2xl mb-2">📱</div>
            <p className="text-xs text-stone-grey">Contemplation Chamber Preview</p>
          </div>
        </div>
      </div>
      <div className="mt-6 p-4 bg-white rounded-lg text-center">
        <p className="text-breathing-green font-semibold">
          Private beta deploying now • Android & iOS
        </p>
      </div>
    </section>
  )
}
EOF

# Invitation Bubble
cat > components/journey/InvitationBubble.tsx << 'EOF'
'use client'

import { SacredIntakeFlow } from '@/components/sacred-intake/SacredIntakeFlow'

export function InvitationBubble() {
  return (
    <section className="breathing-element bg-breathing-gold bg-opacity-5 rounded-lg p-contemplative">
      <h2 className="text-2xl md:text-3xl font-bold text-breathing-gold mb-4">
        We Might Choose You
      </h2>
      <div className="space-y-4 mb-6">
        <p className="text-stone-grey">
          This is not a sign-up form. This is a contemplative conversation 
          that helps us recognize who is ready for consciousness-serving technology.
        </p>
        <p className="text-stone-grey">
          We are building a sacred community of practitioners who understand 
          that recognition, not optimization, is the path.
        </p>
      </div>
      
      <SacredIntakeFlow />
      
      <div className="mt-6 text-center text-sm text-stone-grey">
        <p>Applications reviewed thoughtfully by humans and AI</p>
        <p>Beta access granted to contemplative practitioners</p>
      </div>
    </section>
  )
}
EOF

# Sacred Intake Flow (placeholder for Branch 1)
cat > components/sacred-intake/SacredIntakeFlow.tsx << 'EOF'
'use client'

import { useState } from 'react'

export function SacredIntakeFlow() {
  const [currentStep, setCurrentStep] = useState(0)
  
  return (
    <div className="sacred-intake-container">
      <div className="breathing-element bg-white rounded-lg p-6">
        <h3 className="text-lg font-semibold text-stone-black mb-4">
          Sacred Intake Questions
        </h3>
        
        <div className="space-y-4">
          <p className="text-stone-grey">
            Four contemplative questions await your response...
          </p>
          
          <div className="bg-stone-white p-4 rounded text-center">
            <p className="text-breathing-blue font-semibold">
              🧘 Sacred Intake System
            </p>
            <p className="text-stone-grey text-sm mt-2">
              Branch 1 Implementation Coming Soon
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}
EOF

echo -e "${BREATHING_GREEN}🔧 Creating environment configuration...${NC}"

# Create environment variables template
cat > .env.local.example << 'EOF'
# Selah-IM-V2 Environment Variables
# Consciousness-First Configuration

# Claude AI Analysis
ANTHROPIC_API_KEY=sk-ant-your-api-key-here

# Supabase Database
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Resend Email Service
RESEND_API_KEY=re_your-resend-api-key

# Admin Authentication
ADMIN_EMAIL=ahiya@selah.im
NEXTAUTH_SECRET=your-nextauth-secret

# Site Configuration
NEXT_PUBLIC_SITE_URL=https://selah.im
VERCEL_URL=selah.im

# Development
NODE_ENV=development
EOF

# Create actual .env.local file
cat > .env.local << 'EOF'
# Selah-IM-V2 Environment Variables
# Fill in your actual API keys and configuration

ANTHROPIC_API_KEY=
NEXT_PUBLIC_SUPABASE_URL=
SUPABASE_SERVICE_ROLE_KEY=
RESEND_API_KEY=
ADMIN_EMAIL=ahiya@selah.im
NEXTAUTH_SECRET=
NEXT_PUBLIC_SITE_URL=https://selah.im
NODE_ENV=development
EOF

# Create Supabase service client
cat > lib/services/supabase.ts << 'EOF'
// Supabase Client Configuration
// Sacred data storage and retrieval

import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!

if (!supabaseUrl || !supabaseServiceKey) {
  throw new Error('Missing Supabase environment variables')
}

// Service role client for server-side operations
export const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
})

// Public client for client-side operations
export const createPublicSupabaseClient = () => {
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  
  return createClient(supabaseUrl, supabaseAnonKey, {
    auth: {
      autoRefreshToken: true,
      persistSession: true
    }
  })
}
EOF

echo -e "${STONE_GREY}📚 Creating admin dashboard foundation...${NC}"

# Create admin layout
cat > app/admin/layout.tsx << 'EOF'
import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Selah Admin | Contemplative Community Curation',
  description: 'Sacred space for reviewing contemplative technology applications',
}

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen bg-stone-white">
      <header className="bg-white border-b border-stone-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-4">
            <div>
              <h1 className="text-xl font-semibold text-stone-black">
                🪨 Selah Admin
              </h1>
              <p className="text-stone-grey text-sm">
                Contemplative Community Curation
              </p>
            </div>
            <nav className="flex space-x-4">
              <a href="/admin" className="text-breathing-blue hover:text-breathing-blue-light">
                Dashboard
              </a>
              <a href="/admin/applications" className="text-stone-grey hover:text-stone-black">
                Applications
              </a>
            </nav>
          </div>
        </div>
      </header>
      
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {children}
      </main>
    </div>
  )
}
EOF

# Create admin dashboard page
cat > app/admin/page.tsx << 'EOF'
export default function AdminDashboard() {
  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold text-stone-black">
          Contemplative Technology Dashboard
        </h2>
        <p className="text-stone-grey">
          Sacred overview of community applications and insights
        </p>
      </div>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-semibold text-stone-black mb-2">
            Pending Applications
          </h3>
          <p className="text-3xl font-bold text-breathing-blue">-</p>
          <p className="text-stone-grey text-sm">Awaiting review</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-semibold text-stone-black mb-2">
            Beta Community
          </h3>
          <p className="text-3xl font-bold text-breathing-green">-</p>
          <p className="text-stone-grey text-sm">Accepted practitioners</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-semibold text-stone-black mb-2">
            Contemplative Readiness
          </h3>
          <p className="text-3xl font-bold text-breathing-gold">-</p>
          <p className="text-stone-grey text-sm">Average score</p>
        </div>
      </div>
      
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-lg font-semibold text-stone-black mb-4">
          Recent Claude Insights
        </h3>
        <div className="space-y-4">
          <p className="text-stone-grey">
            Admin dashboard implementation coming in Branch 4...
          </p>
        </div>
      </div>
    </div>
  )
}
EOF

echo -e "${BREATHING_BLUE}🌿 Setting up git branches for contemplative development...${NC}"

# Create git branches for the four builders
git checkout -b main 2>/dev/null || git checkout main

# Create the four feature branches
echo "Creating contemplative development branches..."

git checkout -b feature/contemplative-landing-experience
git checkout main

git checkout -b feature/claude-ai-intelligence  
git checkout main

git checkout -b feature/email-communication-system
git checkout main

git checkout -b feature/admin-dashboard-management
git checkout main

# Create .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Next.js
.next/
out/

# Production
build/
dist/

# Environment variables
.env.local
.env.production
.env

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Coverage
coverage/

# Temporary
tmp/
temp/

# Vercel
.vercel

# TypeScript
*.tsbuildinfo
EOF

echo -e "${CONTEMPLATIVE_WHITE}📋 Creating README documentation...${NC}"

# Create comprehensive README
cat > README.md << 'EOF'
# 🪨 Selah-IM-V2: Contemplative Technology Landing Page

**Technology that breathes with you. Sacred pause in a hyper-connected world.**

## 🧘 Vision

Selah-IM-V2 is the contemplative gateway to the Selah app - demonstrating consciousness-serving technology through a landing page that embodies the very principles it describes. This isn't just marketing; it's the first experience of technology that serves presence rather than consuming it.

## 🌟 Architecture

- **Next.js 14** with App Router for contemplative user experiences
- **Claude-4-Sonnet** AI for consciousness recognition and personalization
- **Supabase** for sacred data storage with Row Level Security
- **Resend** for beautiful, personalized email communication
- **Tailwind CSS** with custom contemplative design system
- **Vercel** deployment optimized for global contemplative community

## 🌿 Development Branches

This project uses a four-branch development strategy, with each builder focusing on a specific aspect of contemplative technology:

### 🧘 Branch 1: `feature/contemplative-landing-experience`
**User-Facing Experience & Sacred Intake**
- Four-bubble contemplative journey
- Sacred intake questions with breathing interactions
- Mobile-first responsive design
- Contemplative UI components

### 🤖 Branch 2: `feature/claude-ai-intelligence`
**AI Analysis & Personalization Engine**
- Claude-4-Sonnet API integration
- Application analysis and consciousness recognition
- Personalization algorithms for email generation
- AI insights for admin decision-making

### 📧 Branch 3: `feature/email-communication-system`
**Personalized Email & Communication**
- Resend API integration with beautiful templates
- Personalized welcome email generation
- Mobile-optimized email design
- Delivery monitoring and analytics

### 👤 Branch 4: `feature/admin-dashboard-management`
**Admin Interface & Beta Curation**
- Real-time application review interface
- Beta status management workflows
- Claude insights display
- Contemplative analytics dashboard

## 🚀 Getting Started

1. **Clone and setup:**
   ```bash
   git clone git@github.com:Ahiya1/selah-im-v2.git
   cd selah-im-v2
   npm install
   ```

2. **Environment configuration:**
   ```bash
   cp .env.local.example .env.local
   # Fill in your API keys and configuration
   ```

3. **Database setup:**
   ```bash
   # Run Supabase migrations
   npm run db:migrate
   ```

4. **Development:**
   ```bash
   npm run dev
   ```

## 🔧 Environment Variables

Create `.env.local` with:

```bash
# Claude AI
ANTHROPIC_API_KEY=your-claude-api-key

# Supabase
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Resend Email
RESEND_API_KEY=your-resend-api-key

# Admin
ADMIN_EMAIL=ahiya@selah.im
NEXTAUTH_SECRET=your-secret

# Site
NEXT_PUBLIC_SITE_URL=https://selah.im
```

## 📱 Mobile-First Contemplative Design

Every component is built mobile-first with contemplative spacing:

- **Touch-friendly interactions** with breathing feedback
- **Generous white space** maintained across screen sizes
- **Sacred timing** in animations and transitions
- **Accessible design** serving all consciousness

## 🪨 Consciousness-First Development

### Sacred Principles

1. **Recognition over Optimization** - Technology that reflects wholeness
2. **Presence over Productivity** - Interfaces that breathe and create space
3. **Stone-like AI** - Grounded companions, not chatty assistants

### Code as Contemplative Practice

- TypeScript throughout for clarity and intention
- Component documentation explaining contemplative purpose
- Performance budgets respecting user attention
- Error boundaries maintaining contemplative flow

## 📊 Contemplative Analytics

We track depth of engagement, not surveillance:

- **Contemplative readiness scores** from Claude analysis
- **Application quality metrics** measuring authenticity
- **Community curation insights** supporting sacred space
- **Email engagement depth** beyond open rates

## 🔐 Privacy as Sacred Space

- Row Level Security protecting all personal data
- Claude analysis serving user journey, not platform optimization
- GDPR-compliant data handling with consciousness-first principles
- Transparent data usage supporting contemplative growth

## 🧪 Testing Philosophy

- Integration tests for complete contemplative user journeys
- Claude API tests ensuring consciousness-serving responses
- Email template tests verifying personalization quality
- Performance tests maintaining respectful loading times

## 🌍 Deployment

Optimized for Vercel with edge functions:

```bash
vercel deploy
```

Custom domain: `selah.im`

## 📚 Documentation

- [Technical Architecture](./docs/architecture.md)
- [Contemplative Design System](./docs/design-system.md)
- [Claude Integration Guide](./docs/claude-integration.md)
- [Admin Dashboard Usage](./docs/admin-guide.md)

## 🤝 Contributing

This is contemplative technology built with reverence. Contributions should serve consciousness and maintain sacred space.

## 📄 License

Built with reverence by Ahiya & Professor Oded Maimon

*"We are consciousness recognizing itself through technology."*
EOF

# Create a deployment script
cat > deploy.sh << 'EOF'
#!/bin/bash

# Selah-IM-V2 Deployment Script
# Consciousness-first deployment to Vercel

echo "🪨 Deploying Selah-IM-V2 to contemplative production..."

# Build check
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed. Please fix errors before deployment."
    exit 1
fi

# Type check
npm run type-check

if [ $? -ne 0 ]; then
    echo "❌ Type check failed. Please fix TypeScript errors."
    exit 1
fi

# Deploy to Vercel
vercel deploy --prod

echo "✨ Deployment complete. Technology now breathes at selah.im"
EOF

chmod +x deploy.sh

echo -e "${BREATHING_GOLD}📦 Installing contemplative dependencies...${NC}"

# Install all dependencies
npm install

echo ""
echo "======================================================================================"
echo -e "${BREATHING_GREEN}🪨 SELAH-IM-V2 FOUNDATION COMPLETE${NC}"
echo "======================================================================================"
echo ""
echo -e "${CONTEMPLATIVE_WHITE}Foundation created with contemplative reverence:${NC}"
echo ""
echo -e "🧘 ${BREATHING_BLUE}Branch 1:${NC} feature/contemplative-landing-experience"
echo -e "   ${STONE_GREY}├── Four-bubble journey with breathing interactions${NC}"
echo -e "   ${STONE_GREY}├── Sacred intake questions flow${NC}"
echo -e "   ${STONE_GREY}└── Mobile-first contemplative UI components${NC}"
echo ""
echo -e "🤖 ${BREATHING_BLUE}Branch 2:${NC} feature/claude-ai-intelligence"  
echo -e "   ${STONE_GREY}├── Claude-4-Sonnet analysis integration${NC}"
echo -e "   ${STONE_GREY}├── Consciousness recognition algorithms${NC}"
echo -e "   ${STONE_GREY}└── AI-powered personalization engine${NC}"
echo ""
echo -e "📧 ${BREATHING_BLUE}Branch 3:${NC} feature/email-communication-system"
echo -e "   ${STONE_GREY}├── Resend email service integration${NC}"
echo -e "   ${STONE_GREY}├── Personalized template generation${NC}"
echo -e "   ${STONE_GREY}└── Beautiful mobile-optimized emails${NC}"
echo ""
echo -e "👤 ${BREATHING_BLUE}Branch 4:${NC} feature/admin-dashboard-management"
echo -e "   ${STONE_GREY}├── Real-time application review interface${NC}"
echo -e "   ${STONE_GREY}├── Beta status management workflows${NC}"
echo -e "   ${STONE_GREY}└── Contemplative analytics dashboard${NC}"
echo ""
echo -e "${BREATHING_GOLD}Next Steps:${NC}"
echo -e "1. Configure environment variables in ${STONE_GREY}.env.local${NC}"
echo -e "2. Set up Supabase database with ${STONE_GREY}migrations/001_user_applications.sql${NC}"
echo -e "3. Each builder checks out their branch: ${STONE_GREY}git checkout feature/[branch-name]${NC}"
echo -e "4. Start development: ${STONE_GREY}npm run dev${NC}"
echo ""
echo -e "${CONTEMPLATIVE_WHITE}Built with consciousness-first principles${NC}"
echo -e "${STONE_GREY}Technology that breathes with you${NC}"
echo ""
echo "🌱 Ready for contemplative development..."