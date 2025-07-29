'use client'

import { ReactNode, forwardRef } from 'react'
import { motion, HTMLMotionProps } from 'framer-motion'

interface BreathingCardProps extends Omit<HTMLMotionProps<"div">, 'children'> {
  children: ReactNode
  variant?: 'gentle' | 'standard' | 'prominent'
  className?: string
}

export const BreathingCard = forwardRef<HTMLDivElement, BreathingCardProps>(
  ({ children, variant = 'standard', className = '', ...props }, ref) => {
    
    const variants = {
      gentle: {
        animate: {
          scale: [1, 1.005, 1],
          boxShadow: [
            '0 4px 20px rgba(0,0,0,0.08)',
            '0 6px 25px rgba(0,0,0,0.12)', 
            '0 4px 20px rgba(0,0,0,0.08)'
          ]
        },
        transition: {
          duration: 6,
          ease: "easeInOut",
          repeat: Infinity
        }
      },
      standard: {
        animate: {
          scale: [1, 1.01, 1],
          boxShadow: [
            '0 4px 20px rgba(0,0,0,0.1)',
            '0 8px 30px rgba(0,0,0,0.15)',
            '0 4px 20px rgba(0,0,0,0.1)'
          ]
        },
        transition: {
          duration: 4,
          ease: "easeInOut", 
          repeat: Infinity
        }
      },
      prominent: {
        animate: {
          scale: [1, 1.015, 1],
          boxShadow: [
            '0 8px 30px rgba(0,0,0,0.12)',
            '0 12px 40px rgba(0,0,0,0.18)',
            '0 8px 30px rgba(0,0,0,0.12)'
          ]
        },
        transition: {
          duration: 5,
          ease: "easeInOut",
          repeat: Infinity
        }
      }
    }

    return (
      <motion.div
        ref={ref}
        className={`
          bg-white rounded-xl shadow-lg overflow-hidden
          ${className}
        `}
        {...variants[variant]}
        whileHover={{
          scale: 1.02,
          transition: { duration: 0.2 }
        }}
        {...props}
      >
        {children}
      </motion.div>
    )
  }
)

BreathingCard.displayName = 'BreathingCard'
