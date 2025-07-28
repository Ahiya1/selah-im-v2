'use client'

import { ReactNode } from 'react'

interface BubbleContainerProps {
  children: ReactNode
}

export function BubbleContainer({ children }: BubbleContainerProps) {
  return (
    <div className="contemplative-container max-w-4xl mx-auto">
      <div className="space-y-sacred md:space-y-phi-large">
        {children}
      </div>
    </div>
  )
}
