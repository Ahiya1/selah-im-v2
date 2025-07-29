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
