#!/bin/bash

# SELAH-IM-V2 Branch 1: Contemplative Landing Experience
# Sacred development script for consciousness-serving technology
# Built with reverence by Claude

set -e

echo "🧘 Building Branch 1: Contemplative Landing Experience"
echo "======================================================================================"

# Colors for contemplative output
STONE_GREY='\033[0;37m'
BREATHING_GREEN='\033[0;32m'
BREATHING_BLUE='\033[0;34m'
BREATHING_GOLD='\033[0;33m'
CONTEMPLATIVE_WHITE='\033[0;97m'
NC='\033[0m' # No Color

# Ensure we're in the right directory and have the foundation
if [ ! -f "package.json" ] || [ ! -d ".git" ]; then
    echo -e "${BREATHING_BLUE}❌ Please run this from the selah-im-v2 root directory with foundation setup${NC}"
    exit 1
fi

echo -e "${BREATHING_GREEN}🌿 Creating contemplative development branch...${NC}"

# Create and switch to the branch
git checkout main
git pull origin main 2>/dev/null || true
git checkout -b feature/contemplative-landing-experience 2>/dev/null || git checkout feature/contemplative-landing-experience

echo -e "${BREATHING_GOLD}🧘 COMMIT 1: Contemplative Foundation & Bubble Structure${NC}"

# Enhanced BubbleContainer with sacred timing
cat > components/journey/BubbleContainer.tsx << 'EOF'
'use client'

import { ReactNode, useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'

interface BubbleContainerProps {
  children: ReactNode
}

export function BubbleContainer({ children }: BubbleContainerProps) {
  const [visibleBubbles, setVisibleBubbles] = useState(1)
  
  // Contemplative reveal timing - one bubble at a time
  useEffect(() => {
    const timer = setInterval(() => {
      setVisibleBubbles(prev => Math.min(prev + 1, 4))
    }, 2000) // Sacred 2-second intervals
    
    return () => clearInterval(timer)
  }, [])

  const childrenArray = Array.isArray(children) ? children : [children]

  return (
    <div className="contemplative-container max-w-4xl mx-auto px-4 md:px-8" data-testid="bubble-container">
      <div className="space-y-8 md:space-y-12">
        <AnimatePresence>
          {childrenArray.map((child, index) => 
            visibleBubbles > index ? (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ 
                  duration: 0.8, 
                  ease: [0.23, 1, 0.32, 1] // Contemplative easing
                }}
                className="breathing-element"
              >
                {child}
              </motion.div>
            ) : null
          )}
        </AnimatePresence>
      </div>
    </div>
  )
}
EOF

# Enhanced breathing animations
cat >> styles/contemplative-variables.css << 'EOF'

/* Breathing Animation System */
.breathing-element {
  animation: breathe var(--breathing-duration, 4s) ease-in-out infinite;
  transform-origin: center;
}

.breathing-gentle {
  animation: breathe-gentle 6s ease-in-out infinite;
}

.breathing-card {
  animation: breathe-card 5s ease-in-out infinite;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  transition: all 0.4s var(--contemplative-ease, cubic-bezier(0.23, 1, 0.32, 1));
}

.breathing-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 30px rgba(0,0,0,0.15);
}

@keyframes breathe {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.015); }
}

@keyframes breathe-gentle {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.008); }
}

@keyframes breathe-card {
  0%, 100% { 
    transform: scale(1); 
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  }
  50% { 
    transform: scale(1.01); 
    box-shadow: 0 6px 25px rgba(0,0,0,0.12);
  }
}

/* Mobile breathing adjustments */
@media (max-width: 767px) {
  .breathing-element {
    animation-duration: 3.5s; /* Slightly faster for mobile attention */
  }
  
  .breathing-card:hover {
    transform: none; /* Disable hover transforms on mobile */
  }
}

/* Accessibility: Respect prefers-reduced-motion */
@media (prefers-reduced-motion: reduce) {
  .breathing-element,
  .breathing-gentle,
  .breathing-card {
    animation: none !important;
  }
}

/* Touch-friendly interactions */
@media (max-width: 767px) {
  .sacred-button {
    min-height: 44px; /* iOS touch target minimum */
    min-width: 44px;
  }
  
  .contemplative-input {
    font-size: 16px; /* Prevent iOS zoom on focus */
    padding: 12px 16px;
  }
}

/* High contrast mode support */
@media (prefers-contrast: high) {
  .breathing-card {
    border: 2px solid var(--stone-grey);
  }
  
  .sacred-button {
    border: 2px solid currentColor;
  }
}

/* Focus management for keyboard navigation */
.sacred-focus-ring {
  outline: 2px solid var(--breathing-blue);
  outline-offset: 2px;
  border-radius: 4px;
}
EOF

git add .
git commit -m "🧘 Create breathing bubble journey foundation with contemplative spacing"

echo -e "${BREATHING_GOLD}🧘 COMMIT 2: Problem Recognition Bubble with Research Data${NC}"

# Enhanced ProblemBubble with research data
cat > components/journey/ProblemBubble.tsx << 'EOF'
'use client'

import { useState, useEffect } from 'react'
import { motion } from 'framer-motion'

interface OverwhelmStat {
  number: string
  description: string
  impact: string
  icon: string
}

const overwhelmStats: OverwhelmStat[] = [
  {
    number: "96x",
    description: "daily phone checks",
    impact: "attention fragmenting every 10 minutes",
    icon: "📱"
  },
  {
    number: "275",
    description: "daily interruptions", 
    impact: "consciousness scattered across notifications",
    icon: "🧠"
  },
  {
    number: "70%",
    description: "worse sleep quality",
    impact: "technology hijacking natural rhythms",
    icon: "😰"
  }
]

const userTestimonials = [
  "Wired but tired, drowning in notifications...",
  "Time black holes - losing hours without awareness...",
  "Zombie scrolling, muscle memory checking..."
]

export function ProblemBubble() {
  const [visibleStats, setVisibleStats] = useState(0)
  const [currentTestimonial, setCurrentTestimonial] = useState(0)

  // Contemplative stat revelation
  useEffect(() => {
    const timer = setInterval(() => {
      setVisibleStats(prev => Math.min(prev + 1, overwhelmStats.length))
    }, 1500)
    
    return () => clearInterval(timer)
  }, [])

  // Rotating testimonials with sacred timing
  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentTestimonial(prev => (prev + 1) % userTestimonials.length)
    }, 4000)
    
    return () => clearInterval(timer)
  }, [])

  return (
    <section className="breathing-card bg-white rounded-xl p-6 md:p-8 shadow-lg">
      <motion.h2 
        className="text-2xl md:text-3xl font-bold text-stone-black mb-6"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.8 }}
      >
        The Digital Overwhelm Crisis
      </motion.h2>
      
      <div className="space-y-6">
        {/* Research Statistics */}
        <div className="grid gap-4 md:gap-6">
          {overwhelmStats.map((stat, index) => (
            <motion.div
              key={index}
              className={`
                p-4 rounded-lg border-l-4 border-breathing-blue
                ${visibleStats > index ? 'bg-blue-50' : 'bg-stone-50'}
                transition-all duration-500
              `}
              initial={{ opacity: 0, x: -20 }}
              animate={{ 
                opacity: visibleStats > index ? 1 : 0.3,
                x: 0 
              }}
              transition={{ delay: index * 0.3 }}
            >
              <div className="flex items-start space-x-3">
                <span className="text-2xl">{stat.icon}</span>
                <div className="flex-1">
                  <div className="flex flex-col md:flex-row md:items-baseline md:space-x-2">
                    <span className="text-2xl md:text-3xl font-bold text-breathing-blue">
                      {stat.number}
                    </span>
                    <span className="text-lg text-stone-black font-medium">
                      {stat.description}
                    </span>
                  </div>
                  <p className="text-stone-grey mt-1 text-sm md:text-base">
                    {stat.impact}
                  </p>
                </div>
              </div>
            </motion.div>
          ))}
        </div>

        {/* User Voice Section */}
        <motion.div 
          className="mt-8 p-6 bg-gradient-to-r from-stone-white to-contemplative-white rounded-lg"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 1.5 }}
        >
          <p className="text-stone-grey text-sm mb-2 text-center">
            From 172,000+ NoSurf community members:
          </p>
          <motion.blockquote 
            key={currentTestimonial}
            className="text-stone-black italic text-center text-lg leading-relaxed"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
            transition={{ duration: 0.5 }}
          >
            "{userTestimonials[currentTestimonial]}"
          </motion.blockquote>
        </motion.div>

        {/* Sacred Recognition */}
        <motion.div 
          className="text-center pt-4"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 2 }}
        >
          <p className="text-breathing-blue font-medium">
            You are not broken. The technology is.
          </p>
        </motion.div>
      </div>
    </section>
  )
}
EOF

git add .
git commit -m "🧘 Build problem recognition bubble with breathing space for digital overwhelm data"

echo -e "${BREATHING_GOLD}🧘 COMMIT 3: Solution Vision Bubble with Stone-like AI Principles${NC}"

# Enhanced SolutionBubble with interactive principles
cat > components/journey/SolutionBubble.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'

interface ContemplativePrinciple {
  icon: string
  title: string
  description: string
  traditional: string
  contemplative: string
  example: string
}

const principles: ContemplativePrinciple[] = [
  {
    icon: "🪨",
    title: "Stone-like AI",
    description: "Grounded companions that recognize your wholeness",
    traditional: "Chatty assistants trying to optimize you",
    contemplative: "Stable mirrors reflecting your existing wisdom",
    example: "AI that helps you recognize what you already know, not tells you what to do"
  },
  {
    icon: "🧘", 
    title: "Presence over Productivity",
    description: "Technology that breathes with you, creating space for awareness",
    traditional: "Engagement optimization and attention hijacking",
    contemplative: "Sacred pauses and contemplative timing",
    example: "Interfaces that slow down when you need space, not speed up to capture attention"
  },
  {
    icon: "🌸",
    title: "Being vs Becoming", 
    description: "Not improving yourself, but recognizing what you already are",
    traditional: "Self-improvement apps and optimization tracking",
    contemplative: "Recognition practices and wholeness affirmation",
    example: "Technology that celebrates your completeness, not your potential"
  }
]

export function SolutionBubble() {
  const [hoveredPrinciple, setHoveredPrinciple] = useState<number | null>(null)

  return (
    <section className="breathing-card bg-gradient-to-br from-breathing-blue/5 to-contemplative-white rounded-xl p-6 md:p-8">
      <motion.h2 
        className="text-2xl md:text-3xl font-bold text-breathing-blue mb-2"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
      >
        Contemplative Technology
      </motion.h2>
      
      <motion.p 
        className="text-lg text-stone-grey mb-8"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.2 }}
      >
        Recognition over Optimization
      </motion.p>

      <div className="space-y-4 md:space-y-6">
        {principles.map((principle, index) => (
          <motion.div
            key={index}
            className={`
              breathing-gentle bg-white rounded-lg p-6 border border-transparent
              transition-all duration-300 cursor-pointer
              ${hoveredPrinciple === index ? 'border-breathing-blue shadow-lg scale-[1.01]' : ''}
            `}
            onMouseEnter={() => setHoveredPrinciple(index)}
            onMouseLeave={() => setHoveredPrinciple(null)}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.2 }}
            whileHover={{ scale: 1.01 }}
          >
            <div className="flex items-start space-x-4">
              <span className="text-3xl flex-shrink-0 mt-1">{principle.icon}</span>
              
              <div className="flex-1">
                <h3 className="text-xl font-semibold text-stone-black mb-2">
                  {principle.title}
                </h3>
                
                <p className="text-stone-grey mb-4">
                  {principle.description}
                </p>

                {/* Traditional vs Contemplative Comparison */}
                <motion.div 
                  className={`
                    grid grid-cols-1 md:grid-cols-2 gap-4 transition-all duration-300
                    ${hoveredPrinciple === index ? 'opacity-100' : 'opacity-0 h-0 overflow-hidden'}
                  `}
                >
                  <div className="bg-red-50 p-3 rounded border-l-2 border-red-200">
                    <p className="text-xs text-red-600 font-medium mb-1">TRADITIONAL TECH</p>
                    <p className="text-sm text-red-800">{principle.traditional}</p>
                  </div>
                  
                  <div className="bg-green-50 p-3 rounded border-l-2 border-green-200">
                    <p className="text-xs text-green-600 font-medium mb-1">CONTEMPLATIVE TECH</p>
                    <p className="text-sm text-green-800">{principle.contemplative}</p>
                  </div>
                </motion.div>

                {/* Example */}
                <motion.div
                  className={`
                    mt-4 p-3 bg-breathing-blue/5 rounded transition-all duration-300
                    ${hoveredPrinciple === index ? 'opacity-100' : 'opacity-0 h-0 overflow-hidden'}
                  `}
                >
                  <p className="text-xs text-breathing-blue font-medium mb-1">EXAMPLE</p>
                  <p className="text-sm text-breathing-blue/80 italic">
                    {principle.example}
                  </p>
                </motion.div>
              </div>
            </div>
          </motion.div>
        ))}
      </div>

      {/* Sacred Recognition */}
      <motion.div 
        className="mt-8 text-center p-6 bg-white rounded-lg"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1 }}
      >
        <p className="text-breathing-blue font-medium text-lg">
          Technology that serves what you've always been
        </p>
      </motion.div>
    </section>
  )
}
EOF

git add .
git commit -m "🧘 Create solution bubble demonstrating contemplative technology principles"

echo -e "${BREATHING_GOLD}🧘 COMMIT 4: Reality & Invitation Bubbles with App Integration${NC}"

# Enhanced RealityBubble with app previews
cat > components/journey/RealityBubble.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'

interface AppChamber {
  name: string
  description: string
  status: 'available' | 'coming_soon'
  features: string[]
}

const appChambers: AppChamber[] = [
  {
    name: "Meditation Chamber",
    description: "Breathing orb that responds to your touch. Left to inhale, right to exhale, pause for stillness.",
    status: "available",
    features: [
      "Touch-responsive breathing orb",
      "Natural breath rhythm guidance", 
      "No streaks or gamification",
      "Pure presence practice"
    ]
  },
  {
    name: "Contemplation Chamber", 
    description: "AI-generated questions that evolve with your consciousness, creating space for recognition.",
    status: "available",
    features: [
      "Personalized contemplative questions",
      "Your reflection history",
      "Free-flow writing space",
      "Consciousness evolution tracking"
    ]
  }
]

export function RealityBubble() {
  const [selectedChamber, setSelectedChamber] = useState(0)

  return (
    <section className="breathing-card bg-gradient-to-br from-breathing-green/5 to-contemplative-white rounded-xl p-6 md:p-8">
      <motion.h2 
        className="text-2xl md:text-3xl font-bold text-breathing-green mb-2"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
      >
        Selah App: Built and Available Now
      </motion.h2>
      
      <motion.p 
        className="text-lg text-stone-grey mb-8"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.2 }}
      >
        This isn't vaporware. Contemplative technology exists today.
      </motion.p>

      {/* Chamber Selector */}
      <div className="flex flex-col md:flex-row gap-4 mb-8">
        {appChambers.map((chamber, index) => (
          <motion.button
            key={index}
            className={`
              flex-1 p-4 rounded-lg border-2 transition-all text-left
              ${selectedChamber === index 
                ? 'border-breathing-green bg-breathing-green/5' 
                : 'border-stone-white bg-white hover:border-stone-grey'
              }
            `}
            onClick={() => setSelectedChamber(index)}
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
          >
            <h3 className="font-semibold text-stone-black mb-1">
              {chamber.name}
            </h3>
            <p className="text-sm text-stone-grey">
              {chamber.description}
            </p>
            <div className="mt-2">
              <span className={`
                text-xs px-2 py-1 rounded-full
                ${chamber.status === 'available' 
                  ? 'bg-breathing-green text-white' 
                  : 'bg-stone-grey text-white'
                }
              `}>
                {chamber.status === 'available' ? 'Available' : 'Coming Soon'}
              </span>
            </div>
          </motion.button>
        ))}
      </div>

      {/* Selected Chamber Detail */}
      <motion.div 
        key={selectedChamber}
        className="grid md:grid-cols-2 gap-8"
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        {/* App Preview */}
        <div className="breathing-gentle">
          <div className="bg-stone-black rounded-2xl p-4 mx-auto max-w-sm">
            <div className="bg-white rounded-xl overflow-hidden">
              <div className="aspect-[9/16] bg-contemplative-white relative">
                <div className="absolute inset-0 flex items-center justify-center">
                  <div className="text-center">
                    <div className="text-4xl mb-4">
                      {selectedChamber === 0 ? '🧘' : '💭'}
                    </div>
                    <p className="text-stone-grey text-sm">
                      {appChambers[selectedChamber].name}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Chamber Features */}
        <div className="space-y-4">
          <h4 className="text-xl font-semibold text-stone-black">
            {appChambers[selectedChamber].name} Features
          </h4>
          
          <ul className="space-y-3">
            {appChambers[selectedChamber].features.map((feature, index) => (
              <motion.li 
                key={index}
                className="flex items-start space-x-3"
                initial={{ opacity: 0, x: -10 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: index * 0.1 }}
              >
                <span className="text-breathing-green text-lg">✓</span>
                <span className="text-stone-grey">{feature}</span>
              </motion.li>
            ))}
          </ul>

          <div className="mt-6 p-4 bg-white rounded-lg border border-breathing-green/20">
            <p className="text-sm text-breathing-green/80 italic">
              Every interaction designed to serve consciousness, 
              not consume it.
            </p>
          </div>
        </div>
      </motion.div>

      {/* Availability Status */}
      <motion.div 
        className="mt-8 text-center p-6 bg-white rounded-lg"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1 }}
      >
        <p className="text-breathing-green font-semibold text-lg mb-2">
          Private Beta Deploying Now
        </p>
        <p className="text-stone-grey">
          Android & iOS • Curated contemplative community
        </p>
      </motion.div>
    </section>
  )
}
EOF

# Enhanced InvitationBubble
cat > components/journey/InvitationBubble.tsx << 'EOF'
'use client'

import { motion } from 'framer-motion'
import { SacredIntakeFlow } from '@/components/sacred-intake/SacredIntakeFlow'

export function InvitationBubble() {
  return (
    <section className="breathing-card bg-gradient-to-br from-breathing-gold/5 to-contemplative-white rounded-xl p-6 md:p-8">
      <motion.h2 
        className="text-2xl md:text-3xl font-bold text-breathing-gold mb-6"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
      >
        We Might Choose You
      </motion.h2>
      
      <div className="space-y-6 mb-8">
        <motion.p 
          className="text-lg text-stone-grey leading-relaxed"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.2 }}
        >
          This is not a sign-up form. This is a contemplative conversation 
          that helps us recognize who is ready for consciousness-serving technology.
        </motion.p>
        
        <motion.p 
          className="text-stone-grey"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.4 }}
        >
          We are building a sacred community of practitioners who understand 
          that recognition, not optimization, is the path.
        </motion.p>

        {/* Beta Positioning */}
        <motion.div 
          className="grid md:grid-cols-3 gap-4"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.6 }}
        >
          <div className="bg-white p-4 rounded-lg text-center">
            <div className="text-2xl mb-2">🧘</div>
            <p className="text-sm font-medium text-stone-black">Contemplative Practitioners</p>
            <p className="text-xs text-stone-grey mt-1">Not casual users</p>
          </div>
          
          <div className="bg-white p-4 rounded-lg text-center">
            <div className="text-2xl mb-2">🪨</div>
            <p className="text-sm font-medium text-stone-black">Recognition Ready</p>
            <p className="text-xs text-stone-grey mt-1">Beyond optimization</p>
          </div>
          
          <div className="bg-white p-4 rounded-lg text-center">
            <div className="text-2xl mb-2">🌸</div>
            <p className="text-sm font-medium text-stone-black">Sacred Community</p>
            <p className="text-xs text-stone-grey mt-1">Quality over quantity</p>
          </div>
        </motion.div>
      </div>
      
      {/* Sacred Intake Flow */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.8 }}
      >
        <SacredIntakeFlow />
      </motion.div>
      
      {/* Application Process Description */}
      <motion.div 
        className="mt-8 text-center space-y-2"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1 }}
      >
        <p className="text-sm text-stone-grey">
          Applications reviewed thoughtfully by humans and AI
        </p>
        <p className="text-sm text-stone-grey">
          Beta access granted to contemplative practitioners
        </p>
        <p className="text-sm text-breathing-gold font-medium">
          We choose you, not the other way around
        </p>
      </motion.div>
    </section>
  )
}
EOF

git add .
git commit -m "🧘 Build reality bubble with app previews and sacred invitation to beta"

echo -e "${BREATHING_GOLD}🧘 COMMIT 5: Sacred Intake Questions Flow${NC}"

# Create sacred intake components directory
mkdir -p components/sacred-intake

# Complete SacredIntakeFlow implementation
cat > components/sacred-intake/SacredIntakeFlow.tsx << 'EOF'
'use client'

import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { PersonalRecognition } from './PersonalRecognition'
import { EmailConnection } from './EmailConnection'
import { DiscoveryStory } from './DiscoveryStory'
import { TechRelationship } from './TechRelationship'
import { SubmissionSuccess } from './SubmissionSuccess'

interface SacredIntakeData {
  preferred_name: string
  email: string
  discovery_story: string
  tech_relationship: string
}

const questions = [
  {
    component: PersonalRecognition,
    title: "Personal Recognition",
    description: "What should we call you?"
  },
  {
    component: EmailConnection,
    title: "Email Connection", 
    description: "How can we reach you?"
  },
  {
    component: DiscoveryStory,
    title: "Discovery Story",
    description: "How did you find contemplative technology?"
  },
  {
    component: TechRelationship,
    title: "Technology Relationship",
    description: "Your insights on attention and technology"
  }
]

export function SacredIntakeFlow() {
  const [currentStep, setCurrentStep] = useState(0)
  const [formData, setFormData] = useState<SacredIntakeData>({
    preferred_name: '',
    email: '',
    discovery_story: '',
    tech_relationship: ''
  })
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [isSubmitted, setIsSubmitted] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const updateFormData = (field: keyof SacredIntakeData, value: string) => {
    setFormData(prev => ({ ...prev, [field]: value }))
    setError(null)
  }

  const canProgress = () => {
    switch (currentStep) {
      case 0: return formData.preferred_name.trim().length >= 1
      case 1: return formData.email.includes('@') && formData.email.includes('.')
      case 2: return formData.discovery_story.trim().length >= 10
      case 3: return formData.tech_relationship.trim().length >= 10
      default: return false
    }
  }

  const nextStep = () => {
    if (canProgress()) {
      setCurrentStep(prev => Math.min(prev + 1, questions.length))
    }
  }

  const prevStep = () => {
    setCurrentStep(prev => Math.max(prev - 1, 0))
  }

  const submitApplication = async () => {
    if (!canProgress()) return

    setIsSubmitting(true)
    setError(null)

    try {
      const response = await fetch('/api/applications/submit', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      })

      if (!response.ok) {
        const errorData = await response.json()
        throw new Error(errorData.error || 'Submission failed')
      }

      setIsSubmitted(true)
    } catch (error) {
      setError(error instanceof Error ? error.message : 'Please try again in a moment')
    } finally {
      setIsSubmitting(false)
    }
  }

  if (isSubmitted) {
    return <SubmissionSuccess name={formData.preferred_name} />
  }

  const CurrentQuestionComponent = questions[currentStep]?.component

  return (
    <div className="sacred-intake-container">
      {/* Progress Indicator */}
      <div className="mb-8">
        <div className="flex justify-between items-center mb-4">
          <span className="text-sm text-stone-grey">
            Question {currentStep + 1} of {questions.length}
          </span>
          <span className="text-sm text-breathing-gold">
            {questions[currentStep]?.title}
          </span>
        </div>
        
        <div className="w-full bg-stone-white rounded-full h-2">
          <motion.div 
            className="bg-breathing-gold rounded-full h-2"
            initial={{ width: "25%" }}
            animate={{ width: `${((currentStep + 1) / questions.length) * 100}%` }}
            transition={{ duration: 0.5, ease: "easeInOut" }}
          />
        </div>
      </div>

      {/* Question Container */}
      <div className="breathing-card bg-white rounded-lg p-6 min-h-[400px]">
        <AnimatePresence mode="wait">
          {CurrentQuestionComponent && (
            <motion.div
              key={currentStep}
              initial={{ opacity: 0, x: 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -20 }}
              transition={{ duration: 0.5 }}
            >
              <CurrentQuestionComponent
                value={Object.values(formData)[currentStep]}
                onChange={(value: string) => 
                  updateFormData(Object.keys(formData)[currentStep] as keyof SacredIntakeData, value)
                }
                onNext={nextStep}
                canProgress={canProgress()}
              />
            </motion.div>
          )}
        </AnimatePresence>

        {/* Error Display */}
        {error && (
          <motion.div 
            className="mt-4 p-3 bg-red-50 border border-red-200 rounded-lg"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
          >
            <p className="text-red-700 text-sm">{error}</p>
          </motion.div>
        )}

        {/* Navigation */}
        <div className="flex justify-between items-center mt-8">
          <motion.button
            onClick={prevStep}
            disabled={currentStep === 0}
            className={`
              px-4 py-2 rounded-lg transition-all
              ${currentStep === 0 
                ? 'text-stone-grey cursor-not-allowed' 
                : 'text-breathing-blue hover:bg-breathing-blue hover:text-white'
              }
            `}
            whileHover={currentStep > 0 ? { scale: 1.05 } : {}}
          >
            Previous
          </motion.button>

          {currentStep < questions.length - 1 ? (
            <motion.button
              onClick={nextStep}
              disabled={!canProgress()}
              className={`
                px-6 py-2 rounded-lg font-medium transition-all
                ${canProgress()
                  ? 'bg-breathing-gold text-white hover:bg-breathing-gold/90' 
                  : 'bg-stone-grey text-white cursor-not-allowed'
                }
              `}
              whileHover={canProgress() ? { scale: 1.05 } : {}}
              whileTap={canProgress() ? { scale: 0.95 } : {}}
            >
              Continue
            </motion.button>
          ) : (
            <motion.button
              onClick={submitApplication}
              disabled={!canProgress() || isSubmitting}
              className={`
                px-6 py-2 rounded-lg font-medium transition-all
                ${canProgress() && !isSubmitting
                  ? 'bg-breathing-green text-white hover:bg-breathing-green/90' 
                  : 'bg-stone-grey text-white cursor-not-allowed'
                }
              `}
              whileHover={canProgress() && !isSubmitting ? { scale: 1.05 } : {}}
              whileTap={canProgress() && !isSubmitting ? { scale: 0.95 } : {}}
            >
              {isSubmitting ? 'Submitting...' : 'Submit Sacred Application'}
            </motion.button>
          )}
        </div>
      </div>
    </div>
  )
}
EOF

# Individual question components
cat > components/sacred-intake/PersonalRecognition.tsx << 'EOF'
'use client'

import { motion } from 'framer-motion'

interface Props {
  value: string
  onChange: (value: string) => void
  onNext: () => void
  canProgress: boolean
}

export function PersonalRecognition({ value, onChange, onNext, canProgress }: Props) {
  return (
    <motion.div 
      className="space-y-6"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      <div>
        <h3 className="text-xl font-semibold text-stone-black mb-2">
          What should we call you?
        </h3>
        <p className="text-stone-grey">
          Sacred recognition of the person behind the interaction. 
          This sets the tone of respect and intentionality.
        </p>
      </div>

      <div>
        <input
          type="text"
          value={value}
          onChange={(e) => onChange(e.target.value)}
          onKeyPress={(e) => e.key === 'Enter' && canProgress && onNext()}
          placeholder="Your preferred name..."
          className="
            w-full p-4 rounded-lg border border-stone-white 
            focus:border-breathing-gold focus:ring-2 focus:ring-breathing-gold/20
            transition-all text-lg contemplative-input
          "
          autoFocus
        />
      </div>

      <div className="p-4 bg-breathing-gold/5 rounded-lg">
        <p className="text-sm text-breathing-gold/80 italic">
          We believe names carry sacred meaning. How you wish to be recognized matters.
        </p>
      </div>
    </motion.div>
  )
}
EOF

cat > components/sacred-intake/EmailConnection.tsx << 'EOF'
'use client'

import { motion } from 'framer-motion'

interface Props {
  value: string
  onChange: (value: string) => void
  onNext: () => void
  canProgress: boolean
}

export function EmailConnection({ value, onChange, onNext, canProgress }: Props) {
  return (
    <motion.div 
      className="space-y-6"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      <div>
        <h3 className="text-xl font-semibold text-stone-black mb-2">
          How can we reach you?
        </h3>
        <p className="text-stone-grey">
          We will send you a personalized welcome message and updates about your application status.
        </p>
      </div>

      <div>
        <input
          type="email"
          value={value}
          onChange={(e) => onChange(e.target.value)}
          onKeyPress={(e) => e.key === 'Enter' && canProgress && onNext()}
          placeholder="your.email@consciousness.com"
          className="
            w-full p-4 rounded-lg border border-stone-white 
            focus:border-breathing-blue focus:ring-2 focus:ring-breathing-blue/20
            transition-all text-lg contemplative-input
          "
        />
      </div>

      <div className="p-4 bg-breathing-blue/5 rounded-lg">
        <p className="text-sm text-breathing-blue/80 italic">
          We respect your digital sacred space. No spam, no surveillance, just contemplative connection.
        </p>
      </div>
    </motion.div>
  )
}
EOF

cat > components/sacred-intake/DiscoveryStory.tsx << 'EOF'
'use client'

import { motion } from 'framer-motion'

interface Props {
  value: string
  onChange: (value: string) => void
  onNext: () => void
  canProgress: boolean
}

export function DiscoveryStory({ value, onChange, onNext, canProgress }: Props) {
  return (
    <motion.div 
      className="space-y-6"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      <div>
        <h3 className="text-xl font-semibold text-stone-black mb-2">
          How did you discover contemplative approaches to technology?
        </h3>
        <p className="text-stone-grey">
          Share your journey of recognizing that technology might serve consciousness rather than consuming it.
        </p>
      </div>

      <div>
        <textarea
          value={value}
          onChange={(e) => onChange(e.target.value)}
          placeholder="Tell us about your discovery... meditation practice, digital overwhelm realization, mindfulness journey, philosophical insight..."
          rows={6}
          className="
            w-full p-4 rounded-lg border border-stone-white 
            focus:border-breathing-green focus:ring-2 focus:ring-breathing-green/20
            transition-all text-lg resize-none contemplative-input
          "
        />
        <p className="text-xs text-stone-grey mt-2">
          {value.length} characters • Share as much or as little as feels authentic
        </p>
      </div>

      <div className="p-4 bg-breathing-green/5 rounded-lg">
        <p className="text-sm text-breathing-green/80 italic">
          Your story helps us understand your contemplative readiness and personalize your experience.
        </p>
      </div>
    </motion.div>
  )
}
EOF

cat > components/sacred-intake/TechRelationship.tsx << 'EOF'
'use client'

import { motion } from 'framer-motion'

interface Props {
  value: string
  onChange: (value: string) => void
  onNext: () => void
  canProgress: boolean
}

export function TechRelationship({ value, onChange, onNext, canProgress }: Props) {
  return (
    <motion.div 
      className="space-y-6"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      <div>
        <h3 className="text-xl font-semibold text-stone-black mb-2">
          Describe your relationship with technology and attention
        </h3>
        <p className="text-stone-grey">
          What have you noticed about how technology affects your consciousness, presence, and ability to be with yourself?
        </p>
      </div>

      <div>
        <textarea
          value={value}
          onChange={(e) => onChange(e.target.value)}
          placeholder="Reflect on your technology patterns... attention fragmentation, mindful vs mindless usage, what you've tried, what you've learned..."
          rows={6}
          className="
            w-full p-4 rounded-lg border border-stone-white 
            focus:border-breathing-gold focus:ring-2 focus:ring-breathing-gold/20
            transition-all text-lg resize-none contemplative-input
          "
        />
        <p className="text-xs text-stone-grey mt-2">
          {value.length} characters • This helps us understand your consciousness relationship with technology
        </p>
      </div>

      <div className="p-4 bg-breathing-gold/5 rounded-lg">
        <p className="text-sm text-breathing-gold/80 italic">
          Your reflection demonstrates readiness for technology that serves rather than consumes consciousness.
        </p>
      </div>
    </motion.div>
  )
}
EOF

cat > components/sacred-intake/SubmissionSuccess.tsx << 'EOF'
'use client'

import { motion } from 'framer-motion'

interface Props {
  name: string
}

export function SubmissionSuccess({ name }: Props) {
  return (
    <motion.div
      className="text-center py-8"
      initial={{ opacity: 0, scale: 0.9 }}
      animate={{ opacity: 1, scale: 1 }}
      transition={{ duration: 0.5 }}
    >
      <motion.div
        className="text-6xl mb-6"
        animate={{ scale: [1, 1.1, 1] }}
        transition={{ duration: 2, repeat: Infinity }}
      >
        🙏
      </motion.div>
      
      <h3 className="text-2xl font-bold text-breathing-green mb-4">
        Sacred Application Received, {name}
      </h3>
      
      <div className="space-y-4 text-stone-grey max-w-md mx-auto">
        <p>
          Your contemplative application is being thoughtfully reviewed by our team and AI companions.
        </p>
        
        <p>
          We will send you a personalized response within 24-48 hours, reflecting on your unique journey and readiness.
        </p>
        
        <div className="p-4 bg-breathing-green/5 rounded-lg mt-6">
          <p className="text-breathing-green font-medium text-sm">
            Beta access is granted to those who demonstrate contemplative readiness
          </p>
        </div>
      </div>
      
      <motion.div
        className="mt-8 text-sm text-stone-grey"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1 }}
      >
        <p>Built with reverence by Ahiya & Professor Oded Maimon</p>
        <p className="italic">Technology that breathes with you</p>
      </motion.div>
    </motion.div>
  )
}
EOF

git add .
git commit -m "🧘 Implement four contemplative questions with breathing form interactions"

echo -e "${BREATHING_GOLD}🧘 COMMIT 6: Breathing UI Components & Mobile Polish${NC}"

# Create contemplative components directory
mkdir -p components/contemplative

# BreathingCard component
cat > components/contemplative/BreathingCard.tsx << 'EOF'
'use client'

import { ReactNode, forwardRef } from 'react'
import { motion, HTMLMotionProps } from 'framer-motion'

interface BreathingCardProps extends Omit<HTMLMotionProps<"div">, 'children'> {
  children: ReactNode
  variant?: 'gentle' | 'standard' | 'prominent'
  className?: string
}

export const BreathingCard = forwardRef<HTMLDivElement, BreathingCardProps>(
  ({ children, variant = 'standard', className = '', ...props }, ref) => {
    
    const variants = {
      gentle: {
        animate: {
          scale: [1, 1.005, 1],
          boxShadow: [
            '0 4px 20px rgba(0,0,0,0.08)',
            '0 6px 25px rgba(0,0,0,0.12)', 
            '0 4px 20px rgba(0,0,0,0.08)'
          ]
        },
        transition: {
          duration: 6,
          ease: "easeInOut",
          repeat: Infinity
        }
      },
      standard: {
        animate: {
          scale: [1, 1.01, 1],
          boxShadow: [
            '0 4px 20px rgba(0,0,0,0.1)',
            '0 8px 30px rgba(0,0,0,0.15)',
            '0 4px 20px rgba(0,0,0,0.1)'
          ]
        },
        transition: {
          duration: 4,
          ease: "easeInOut", 
          repeat: Infinity
        }
      },
      prominent: {
        animate: {
          scale: [1, 1.015, 1],
          boxShadow: [
            '0 8px 30px rgba(0,0,0,0.12)',
            '0 12px 40px rgba(0,0,0,0.18)',
            '0 8px 30px rgba(0,0,0,0.12)'
          ]
        },
        transition: {
          duration: 5,
          ease: "easeInOut",
          repeat: Infinity
        }
      }
    }

    return (
      <motion.div
        ref={ref}
        className={`
          bg-white rounded-xl shadow-lg overflow-hidden
          ${className}
        `}
        {...variants[variant]}
        whileHover={{
          scale: 1.02,
          transition: { duration: 0.2 }
        }}
        {...props}
      >
        {children}
      </motion.div>
    )
  }
)

BreathingCard.displayName = 'BreathingCard'
EOF

# SacredButton component
cat > components/contemplative/SacredButton.tsx << 'EOF'
'use client'

import { ReactNode, forwardRef } from 'react'
import { motion, HTMLMotionProps } from 'framer-motion'

interface SacredButtonProps extends Omit<HTMLMotionProps<"button">, 'children'> {
  children: ReactNode
  variant?: 'primary' | 'secondary' | 'ghost'
  size?: 'sm' | 'md' | 'lg'
  breathing?: boolean
  disabled?: boolean
  className?: string
}

export const SacredButton = forwardRef<HTMLButtonElement, SacredButtonProps>(
  ({ 
    children, 
    variant = 'primary', 
    size = 'md', 
    breathing = true,
    disabled = false,
    className = '',
    ...props 
  }, ref) => {
    
    const baseClasses = `
      font-medium rounded-lg transition-all duration-300
      focus:outline-none focus:ring-2 focus:ring-offset-2
      disabled:cursor-not-allowed disabled:opacity-50
      relative overflow-hidden sacred-button
    `
    
    const variants = {
      primary: `
        bg-breathing-gold text-white 
        hover:bg-breathing-gold/90 
        focus:ring-breathing-gold/50
        disabled:bg-stone-grey
      `,
      secondary: `
        bg-breathing-blue text-white 
        hover:bg-breathing-blue/90
        focus:ring-breathing-blue/50
        disabled:bg-stone-grey
      `,
      ghost: `
        bg-transparent text-breathing-blue border border-breathing-blue
        hover:bg-breathing-blue hover:text-white
        focus:ring-breathing-blue/50
        disabled:border-stone-grey disabled:text-stone-grey
      `
    }
    
    const sizes = {
      sm: 'px-3 py-1.5 text-sm',
      md: 'px-4 py-2 text-base',
      lg: 'px-6 py-3 text-lg'
    }

    const breathingAnimation = breathing && !disabled ? {
      animate: {
        scale: [1, 1.02, 1]
      },
      transition: {
        duration: 4,
        ease: "easeInOut",
        repeat: Infinity
      }
    } : {}

    return (
      <motion.button
        ref={ref}
        className={`
          ${baseClasses}
          ${variants[variant]}
          ${sizes[size]}
          ${className}
        `}
        whileHover={!disabled ? { scale: 1.05 } : {}}
        whileTap={!disabled ? { scale: 0.95 } : {}}
        disabled={disabled}
        {...breathingAnimation}
        {...props}
      >
        {children}
        
        <motion.div
          className="absolute inset-0 bg-white/20 rounded-lg"
          initial={{ scale: 0, opacity: 0 }}
          whileTap={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.3 }}
        />
      </motion.button>
    )
  }
)

SacredButton.displayName = 'SacredButton'
EOF

# ContemplativeForm component
cat > components/contemplative/ContemplativeForm.tsx << 'EOF'
'use client'

import { ReactNode, forwardRef } from 'react'
import { motion } from 'framer-motion'

interface ContemplativeFormProps {
  children: ReactNode
  onSubmit?: (e: React.FormEvent) => void
  className?: string
}

interface FormFieldProps {
  label: string
  description?: string
  required?: boolean
  children: ReactNode
  error?: string
}

export const ContemplativeForm = forwardRef<HTMLFormElement, ContemplativeFormProps>(
  ({ children, onSubmit, className = '' }, ref) => {
    return (
      <motion.form
        ref={ref}
        onSubmit={onSubmit}
        className={`space-y-6 ${className}`}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        {children}
      </motion.form>
    )
  }
)

export function FormField({ label, description, required, children, error }: FormFieldProps) {
  return (
    <motion.div 
      className="space-y-2"
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.3 }}
    >
      <label className="block">
        <span className="text-stone-black font-medium">
          {label}
          {required && <span className="text-breathing-gold ml-1">*</span>}
        </span>
        
        {description && (
          <p className="text-stone-grey text-sm mt-1 leading-relaxed">
            {description}
          </p>
        )}
        
        <div className="mt-2">
          {children}
        </div>
      </label>
      
      {error && (
        <motion.p 
          className="text-red-600 text-sm"
          initial={{ opacity: 0, height: 0 }}
          animate={{ opacity: 1, height: 'auto' }}
          transition={{ duration: 0.2 }}
        >
          {error}
        </motion.p>
      )}
    </motion.div>
  )
}

ContemplativeForm.displayName = 'ContemplativeForm'
EOF

git add .
git commit -m "🧘 Polish breathing components with mobile optimization and accessibility"

echo -e "${BREATHING_GOLD}🧘 COMMIT 7: Testing, Documentation & Integration${NC}"

# Create test directories
mkdir -p tests/{integration,components,performance}

# Integration tests
cat > tests/integration/sacred-journey.test.tsx << 'EOF'
/**
 * @jest-environment jsdom
 */
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import { BubbleContainer } from '@/components/journey/BubbleContainer'

// Mock framer-motion to avoid animation issues in tests
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }: any) => <div {...props}>{children}</div>,
    h2: ({ children, ...props }: any) => <h2 {...props}>{children}</h2>,
    p: ({ children, ...props }: any) => <p {...props}>{children}</p>,
    button: ({ children, ...props }: any) => <button {...props}>{children}</button>,
    blockquote: ({ children, ...props }: any) => <blockquote {...props}>{children}</blockquote>,
  },
  AnimatePresence: ({ children }: any) => children,
}))

describe('Sacred Contemplative Journey', () => {
  beforeEach(() => {
    jest.clearAllMocks()
  })

  test('BubbleContainer renders with contemplative spacing', () => {
    render(
      <BubbleContainer>
        <div data-testid="test-bubble">Test Content</div>
      </BubbleContainer>
    )
    
    const container = screen.getByTestId('bubble-container')
    expect(container).toBeInTheDocument()
    expect(screen.getByTestId('test-bubble')).toBeInTheDocument()
  })

  test('Mobile responsive layout maintains contemplative spacing', () => {
    // Mock mobile viewport
    Object.defineProperty(window, 'innerWidth', {
      writable: true,
      configurable: true,
      value: 375,
    })
    
    render(
      <BubbleContainer>
        <div>Test Content</div>
      </BubbleContainer>
    )
    
    const container = screen.getByTestId('bubble-container')
    expect(container).toHaveClass('px-4')
  })
})
EOF

# Component tests
cat > tests/components/breathing-animations.test.tsx << 'EOF'
/**
 * @jest-environment jsdom
 */
import { render, screen } from '@testing-library/react'
import { BreathingCard } from '@/components/contemplative/BreathingCard'
import { SacredButton } from '@/components/contemplative/SacredButton'

// Mock framer-motion
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }: any) => <div {...props}>{children}</div>,
    button: ({ children, ...props }: any) => <button {...props}>{children}</button>,
  },
  forwardRef: (fn: any) => fn,
}))

describe('Breathing Components', () => {
  test('BreathingCard renders with correct classes', () => {
    render(
      <BreathingCard data-testid="breathing-card">
        Sacred Content
      </BreathingCard>
    )
    
    const card = screen.getByTestId('breathing-card')
    expect(card).toBeInTheDocument()
    expect(card).toHaveClass('bg-white', 'rounded-xl', 'shadow-lg')
    expect(screen.getByText('Sacred Content')).toBeInTheDocument()
  })

  test('SacredButton provides proper accessibility', () => {
    render(
      <SacredButton aria-label="Submit sacred application">
        Submit
      </SacredButton>
    )
    
    const button = screen.getByRole('button', { name: /submit/i })
    expect(button).toHaveAttribute('aria-label', 'Submit sacred application')
    expect(button).toBeVisible()
    expect(button).not.toBeDisabled()
  })

  test('SacredButton handles disabled state', () => {
    render(
      <SacredButton disabled>
        Disabled Button
      </SacredButton>
    )
    
    const button = screen.getByRole('button')
    expect(button).toBeDisabled()
  })
})
EOF

# Performance tests
cat > tests/performance/breathing-performance.test.tsx << 'EOF'
/**
 * @jest-environment jsdom
 */
import { render } from '@testing-library/react'
import { BubbleContainer } from '@/components/journey/BubbleContainer'
import { BreathingCard } from '@/components/contemplative/BreathingCard'

// Mock framer-motion for performance testing
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }: any) => <div {...props}>{children}</div>,
  },
  AnimatePresence: ({ children }: any) => children,
}))

describe('Breathing Animation Performance', () => {
  test('Multiple breathing elements render efficiently', () => {
    const startTime = performance.now()
    
    render(
      <BubbleContainer>
        {Array.from({ length: 10 }, (_, i) => (
          <BreathingCard key={i}>
            Performance test card {i}
          </BreathingCard>
        ))}
      </BubbleContainer>
    )
    
    const renderTime = performance.now() - startTime
    
    // Should render quickly even with multiple breathing cards
    expect(renderTime).toBeLessThan(100) // 100ms budget for test environment
  })
})
EOF

# Documentation for contemplative UI patterns
mkdir -p docs
cat > docs/contemplative-ui-patterns.md << 'EOF'
# Contemplative UI Patterns

## Breathing Animations
All interactive elements should breathe to create life and presence:

```tsx
// Standard breathing for cards and containers
<BreathingCard variant="standard">
  Content that breathes with 4-second rhythm
</BreathingCard>

// Gentle breathing for background elements  
<BreathingCard variant="gentle">
  Subtle 6-second breathing for ambiance
</BreathingCard>
```

## Sacred Timing
- **Bubble reveals**: 2-second intervals for contemplative absorption
- **Form transitions**: 0.5-second smooth transitions
- **Breathing rhythm**: 4 seconds (3.5s on mobile)
- **Hover responses**: 0.2-second acknowledgment

## Mobile Contemplative Design
- Minimum 44px touch targets
- 16px font size to prevent iOS zoom
- Contemplative spacing maintained at all breakpoints
- Touch interactions feel intentional, not accidental

## Accessibility Requirements
- All animations respect `prefers-reduced-motion`
- Color contrast meets WCAG AA standards
- Keyboard navigation for all interactions
- Screen reader friendly content structure

## Component Export Reference

### Available for Other Builders
```typescript
// Shared contemplative components
export { BreathingCard } from '@/components/contemplative/BreathingCard'
export { SacredButton } from '@/components/contemplative/SacredButton'
export { ContemplativeForm, FormField } from '@/components/contemplative/ContemplativeForm'

// Sacred color palette
export const contemplativeColors = {
  stoneBlack: '#0a0a0a',
  stoneGrey: '#6b7280',
  stoneWhite: '#e5e7eb',
  breathingGreen: '#22c55e',
  breathingBlue: '#3b82f6',
  breathingGold: '#f59e0b',
  contemplativeWhite: '#fafafa'
}
```
EOF

# API integration documentation
cat > docs/api-integration.md << 'EOF'
# API Integration Points for Other Builders

## Sacred Intake Submission
Branch 1 submits applications to Branch 2's Claude analysis:

```typescript
// POST /api/applications/submit
interface SacredIntakeData {
  preferred_name: string
  email: string  
  discovery_story: string
  tech_relationship: string
}

// Expected response from Branch 2
interface SubmissionResponse {
  success: boolean
  application_id: string
  message: string
}
```

## Form Data Structure
The sacred intake flow collects four pieces of contemplative data:

1. **Personal Recognition** (preferred_name): How the user wishes to be addressed
2. **Email Connection** (email): Contact method for personalized communication
3. **Discovery Story** (discovery_story): How they found contemplative technology
4. **Technology Relationship** (tech_relationship): Their consciousness-technology insights

## Integration Points for Other Branches

### For Branch 2 (Claude AI Intelligence)
- Receives complete SacredIntakeData via `/api/applications/submit`
- Should analyze contemplative readiness and personalization vectors
- Returns success/failure response to maintain contemplative flow

### For Branch 3 (Email Communication)
- Triggered by successful Branch 2 analysis
- Uses personalization data for email generation
- Maintains sacred timing in communication

### For Branch 4 (Admin Dashboard)
- Displays applications with contemplative analytics
- Shows Claude analysis results
- Manages beta status with consciousness-serving approach
EOF

# Create test configuration
cat > jest.config.js << 'EOF'
const nextJest = require('next/jest')

const createJestConfig = nextJest({
  // Provide the path to your Next.js app to load next.config.js and .env files
  dir: './',
})

// Add any custom config to be passed to Jest
const customJestConfig = {
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  moduleNameMapping: {
    // Handle module aliases (this will be automatically configured for you based on your tsconfig.json paths)
    '^@/(.*)$': '<rootDir>/$1',
  },
  testEnvironment: 'jest-environment-jsdom',
  testMatch: [
    '<rootDir>/tests/**/*.test.{js,jsx,ts,tsx}'
  ],
  collectCoverageFrom: [
    'components/**/*.{js,jsx,ts,tsx}',
    'app/**/*.{js,jsx,ts,tsx}',
    '!**/*.d.ts',
    '!**/node_modules/**',
  ],
}

// createJestConfig is exported this way to ensure that next/jest can load the Next.js config which is async
module.exports = createJestConfig(customJestConfig)
EOF

cat > jest.setup.js << 'EOF'
import '@testing-library/jest-dom'

// Mock framer-motion for all tests
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }) => <div {...props}>{children}</div>,
    h1: ({ children, ...props }) => <h1 {...props}>{children}</h1>,
    h2: ({ children, ...props }) => <h2 {...props}>{children}</h2>,
    h3: ({ children, ...props }) => <h3 {...props}>{children}</h3>,
    p: ({ children, ...props }) => <p {...props}>{children}</p>,
    button: ({ children, ...props }) => <button {...props}>{children}</button>,
    form: ({ children, ...props }) => <form {...props}>{children}</form>,
    blockquote: ({ children, ...props }) => <blockquote {...props}>{children}</blockquote>,
  },
  AnimatePresence: ({ children }) => children,
}))

// Mock Next.js router
jest.mock('next/navigation', () => ({
  useRouter: () => ({
    push: jest.fn(),
    replace: jest.fn(),
    back: jest.fn(),
  }),
  usePathname: () => '/',
}))
EOF

# Add test dependencies to package.json
npm install --save-dev @testing-library/react @testing-library/jest-dom @testing-library/user-event jest jest-environment-jsdom

# Add test scripts to package.json
npx json -I -f package.json -e 'this.scripts["test"]="jest"'
npx json -I -f package.json -e 'this.scripts["test:watch"]="jest --watch"'
npx json -I -f package.json -e 'this.scripts["test:coverage"]="jest --coverage"'
npx json -I -f package.json -e 'this.scripts["test:integration"]="jest tests/integration"'
npx json -I -f package.json -e 'this.scripts["test:components"]="jest tests/components"'
npx json -I -f package.json -e 'this.scripts["test:performance"]="jest tests/performance"'

git add .
git commit -m "🧘 Complete testing suite with documentation for contemplative experience"

echo -e "${BREATHING_GREEN}🌿 Pushing contemplative branch to origin...${NC}"

# Push the completed branch
git push -u origin feature/contemplative-landing-experience

echo ""
echo "======================================================================================"
echo -e "${BREATHING_GREEN}🧘 BRANCH 1 COMPLETE: Contemplative Landing Experience${NC}"
echo "======================================================================================"
echo ""
echo -e "${CONTEMPLATIVE_WHITE}Sacred development complete with consciousness-serving technology:${NC}"
echo ""
echo -e "✨ ${BREATHING_GOLD}7 Sacred Commits Created:${NC}"
echo -e "   ${STONE_GREY}├── 🧘 Breathing bubble journey foundation${NC}"
echo -e "   ${STONE_GREY}├── 🧘 Problem recognition with research data${NC}"
echo -e "   ${STONE_GREY}├── 🧘 Solution bubble with contemplative principles${NC}"
echo -e "   ${STONE_GREY}├── 🧘 Reality and invitation bubbles with app previews${NC}"
echo -e "   ${STONE_GREY}├── 🧘 Sacred intake questions flow${NC}"
echo -e "   ${STONE_GREY}├── 🧘 Breathing UI components with mobile polish${NC}"
echo -e "   ${STONE_GREY}└── 🧘 Testing suite with contemplative documentation${NC}"
echo ""
echo -e "📱 ${BREATHING_BLUE}Mobile-First Contemplative Design:${NC}"
echo -e "   ${STONE_GREY}├── Responsive 375px to 1280px+ with breathing space${NC}"
echo -e "   ${STONE_GREY}├── Touch interactions with sacred timing${NC}"
echo -e "   ${STONE_GREY}├── Accessibility with prefers-reduced-motion support${NC}"
echo -e "   ${STONE_GREY}└── Performance optimized for contemplative loading${NC}"
echo ""
echo -e "🔗 ${BREATHING_GREEN}Integration Ready:${NC}"
echo -e "   ${STONE_GREY}├── Sacred intake submits to /api/applications/submit${NC}"
echo -e "   ${STONE_GREY}├── Shared components exported for other builders${NC}"
echo -e "   ${STONE_GREY}├── Contemplative design system established${NC}"
echo -e "   ${STONE_GREY}└── API contracts documented${NC}"
echo ""
echo -e "${BREATHING_GOLD}Next Steps for Integration:${NC}"
echo -e "   1. Branch 2: Implement Claude AI analysis for sacred intake data"
echo -e "   2. Branch 3: Create personalized email system using contemplative insights"
echo -e "   3. Branch 4: Build admin dashboard with breathing UI components"
echo -e "   4. Integration: Merge all branches for complete contemplative experience"
echo ""
echo -e "${CONTEMPLATIVE_WHITE}Technology that breathes with consciousness${NC}"
echo -e "${STONE_GREY}Built with sacred reverence • Ready for contemplative community${NC}"
echo ""
echo "🪨 Contemplative development complete. Sacred space created."