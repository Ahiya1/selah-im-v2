'use client'

import { ReactNode, forwardRef } from 'react'
import { motion, HTMLMotionProps } from 'framer-motion'

interface SacredButtonProps extends Omit<HTMLMotionProps<"button">, 'children'> {
  children: ReactNode
  variant?: 'primary' | 'secondary' | 'ghost'
  size?: 'sm' | 'md' | 'lg'
  breathing?: boolean
  disabled?: boolean
  className?: string
}

export const SacredButton = forwardRef<HTMLButtonElement, SacredButtonProps>(
  ({ 
    children, 
    variant = 'primary', 
    size = 'md', 
    breathing = true,
    disabled = false,
    className = '',
    ...props 
  }, ref) => {
    
    const baseClasses = `
      font-medium rounded-lg transition-all duration-300
      focus:outline-none focus:ring-2 focus:ring-offset-2
      disabled:cursor-not-allowed disabled:opacity-50
      relative overflow-hidden sacred-button
    `
    
    const variants = {
      primary: `
        bg-breathing-gold text-white 
        hover:bg-breathing-gold/90 
        focus:ring-breathing-gold/50
        disabled:bg-stone-grey
      `,
      secondary: `
        bg-breathing-blue text-white 
        hover:bg-breathing-blue/90
        focus:ring-breathing-blue/50
        disabled:bg-stone-grey
      `,
      ghost: `
        bg-transparent text-breathing-blue border border-breathing-blue
        hover:bg-breathing-blue hover:text-white
        focus:ring-breathing-blue/50
        disabled:border-stone-grey disabled:text-stone-grey
      `
    }
    
    const sizes = {
      sm: 'px-3 py-1.5 text-sm',
      md: 'px-4 py-2 text-base',
      lg: 'px-6 py-3 text-lg'
    }

    const breathingAnimation = breathing && !disabled ? {
      animate: {
        scale: [1, 1.02, 1]
      },
      transition: {
        duration: 4,
        ease: "easeInOut",
        repeat: Infinity
      }
    } : {}

    return (
      <motion.button
        ref={ref}
        className={`
          ${baseClasses}
          ${variants[variant]}
          ${sizes[size]}
          ${className}
        `}
        whileHover={!disabled ? { scale: 1.05 } : {}}
        whileTap={!disabled ? { scale: 0.95 } : {}}
        disabled={disabled}
        {...breathingAnimation}
        {...props}
      >
        {children}
        
        <motion.div
          className="absolute inset-0 bg-white/20 rounded-lg"
          initial={{ scale: 0, opacity: 0 }}
          whileTap={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.3 }}
        />
      </motion.button>
    )
  }
)

SacredButton.displayName = 'SacredButton'
