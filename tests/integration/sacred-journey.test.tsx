/**
 * @jest-environment jsdom
 */
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import { BubbleContainer } from '@/components/journey/BubbleContainer'

// Mock framer-motion to avoid animation issues in tests
jest.mock('framer-motion', () => ({
  motion: {
    div: ({ children, ...props }: any) => <div {...props}>{children}</div>,
    h2: ({ children, ...props }: any) => <h2 {...props}>{children}</h2>,
    p: ({ children, ...props }: any) => <p {...props}>{children}</p>,
    button: ({ children, ...props }: any) => <button {...props}>{children}</button>,
    blockquote: ({ children, ...props }: any) => <blockquote {...props}>{children}</blockquote>,
  },
  AnimatePresence: ({ children }: any) => children,
}))

describe('Sacred Contemplative Journey', () => {
  beforeEach(() => {
    jest.clearAllMocks()
  })

  test('BubbleContainer renders with contemplative spacing', () => {
    render(
      <BubbleContainer>
        <div data-testid="test-bubble">Test Content</div>
      </BubbleContainer>
    )
    
    const container = screen.getByTestId('bubble-container')
    expect(container).toBeInTheDocument()
    expect(screen.getByTestId('test-bubble')).toBeInTheDocument()
  })

  test('Mobile responsive layout maintains contemplative spacing', () => {
    // Mock mobile viewport
    Object.defineProperty(window, 'innerWidth', {
      writable: true,
      configurable: true,
      value: 375,
    })
    
    render(
      <BubbleContainer>
        <div>Test Content</div>
      </BubbleContainer>
    )
    
    const container = screen.getByTestId('bubble-container')
    expect(container).toHaveClass('px-4')
  })
})
