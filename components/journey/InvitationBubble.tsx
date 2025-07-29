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
