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
