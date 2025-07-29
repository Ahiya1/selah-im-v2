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
