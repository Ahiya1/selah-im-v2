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
