'use client'

import { ReactNode, useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'

interface BubbleContainerProps {
  children: ReactNode
}

export function BubbleContainer({ children }: BubbleContainerProps) {
  const [visibleBubbles, setVisibleBubbles] = useState(1)
  
  // Contemplative reveal timing - one bubble at a time
  useEffect(() => {
    const timer = setInterval(() => {
      setVisibleBubbles(prev => Math.min(prev + 1, 4))
    }, 2000) // Sacred 2-second intervals
    
    return () => clearInterval(timer)
  }, [])

  const childrenArray = Array.isArray(children) ? children : [children]

  return (
    <div className="contemplative-container max-w-4xl mx-auto px-4 md:px-8" data-testid="bubble-container">
      <div className="space-y-8 md:space-y-12">
        <AnimatePresence>
          {childrenArray.map((child, index) => 
            visibleBubbles > index ? (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ 
                  duration: 0.8, 
                  ease: [0.23, 1, 0.32, 1] // Contemplative easing
                }}
                className="breathing-element"
              >
                {child}
              </motion.div>
            ) : null
          )}
        </AnimatePresence>
      </div>
    </div>
  )
}
