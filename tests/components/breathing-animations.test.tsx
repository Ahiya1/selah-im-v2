/**
 * @jest-environment jsdom
 */
import { render, screen } from '@testing-library/react'
import { BreathingCard } from '@/components/contemplative/BreathingCard'
import { SacredButton } from '@/components/contemplative/SacredButton'

// Mock framer-motion
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }: any) => <div {...props}>{children}</div>,
    button: ({ children, ...props }: any) => <button {...props}>{children}</button>,
  },
  forwardRef: (fn: any) => fn,
}))

describe('Breathing Components', () => {
  test('BreathingCard renders with correct classes', () => {
    render(
      <BreathingCard data-testid="breathing-card">
        Sacred Content
      </BreathingCard>
    )
    
    const card = screen.getByTestId('breathing-card')
    expect(card).toBeInTheDocument()
    expect(card).toHaveClass('bg-white', 'rounded-xl', 'shadow-lg')
    expect(screen.getByText('Sacred Content')).toBeInTheDocument()
  })

  test('SacredButton provides proper accessibility', () => {
    render(
      <SacredButton aria-label="Submit sacred application">
        Submit
      </SacredButton>
    )
    
    const button = screen.getByRole('button', { name: /submit/i })
    expect(button).toHaveAttribute('aria-label', 'Submit sacred application')
    expect(button).toBeVisible()
    expect(button).not.toBeDisabled()
  })

  test('SacredButton handles disabled state', () => {
    render(
      <SacredButton disabled>
        Disabled Button
      </SacredButton>
    )
    
    const button = screen.getByRole('button')
    expect(button).toBeDisabled()
  })
})
