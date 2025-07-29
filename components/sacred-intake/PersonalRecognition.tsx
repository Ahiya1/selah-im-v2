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
