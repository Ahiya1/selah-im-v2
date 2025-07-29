/**
 * @jest-environment jsdom
 */
import { render } from '@testing-library/react'
import { BubbleContainer } from '@/components/journey/BubbleContainer'
import { BreathingCard } from '@/components/contemplative/BreathingCard'

// Mock framer-motion for performance testing
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }: any) => <div {...props}>{children}</div>,
  },
  AnimatePresence: ({ children }: any) => children,
}))

describe('Breathing Animation Performance', () => {
  test('Multiple breathing elements render efficiently', () => {
    const startTime = performance.now()
    
    render(
      <BubbleContainer>
        {Array.from({ length: 10 }, (_, i) => (
          <BreathingCard key={i}>
            Performance test card {i}
          </BreathingCard>
        ))}
      </BubbleContainer>
    )
    
    const renderTime = performance.now() - startTime
    
    // Should render quickly even with multiple breathing cards
    expect(renderTime).toBeLessThan(100) // 100ms budget for test environment
  })
})
