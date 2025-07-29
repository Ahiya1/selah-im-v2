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
