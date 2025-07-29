'use client'

import { ReactNode, forwardRef } from 'react'
import { motion } from 'framer-motion'

interface ContemplativeFormProps {
  children: ReactNode
  onSubmit?: (e: React.FormEvent) => void
  className?: string
}

interface FormFieldProps {
  label: string
  description?: string
  required?: boolean
  children: ReactNode
  error?: string
}

export const ContemplativeForm = forwardRef<HTMLFormElement, ContemplativeFormProps>(
  ({ children, onSubmit, className = '' }, ref) => {
    return (
      <motion.form
        ref={ref}
        onSubmit={onSubmit}
        className={`space-y-6 ${className}`}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        {children}
      </motion.form>
    )
  }
)

export function FormField({ label, description, required, children, error }: FormFieldProps) {
  return (
    <motion.div 
      className="space-y-2"
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.3 }}
    >
      <label className="block">
        <span className="text-stone-black font-medium">
          {label}
          {required && <span className="text-breathing-gold ml-1">*</span>}
        </span>
        
        {description && (
          <p className="text-stone-grey text-sm mt-1 leading-relaxed">
            {description}
          </p>
        )}
        
        <div className="mt-2">
          {children}
        </div>
      </label>
      
      {error && (
        <motion.p 
          className="text-red-600 text-sm"
          initial={{ opacity: 0, height: 0 }}
          animate={{ opacity: 1, height: 'auto' }}
          transition={{ duration: 0.2 }}
        >
          {error}
        </motion.p>
      )}
    </motion.div>
  )
}

ContemplativeForm.displayName = 'ContemplativeForm'
