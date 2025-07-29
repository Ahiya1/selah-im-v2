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
