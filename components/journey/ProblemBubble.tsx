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
