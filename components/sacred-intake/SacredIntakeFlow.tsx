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
