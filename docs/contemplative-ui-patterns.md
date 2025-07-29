# Contemplative UI Patterns

## Breathing Animations
All interactive elements should breathe to create life and presence:

```tsx
// Standard breathing for cards and containers
<BreathingCard variant="standard">
  Content that breathes with 4-second rhythm
</BreathingCard>

// Gentle breathing for background elements  
<BreathingCard variant="gentle">
  Subtle 6-second breathing for ambiance
</BreathingCard>
```

## Sacred Timing
- **Bubble reveals**: 2-second intervals for contemplative absorption
- **Form transitions**: 0.5-second smooth transitions
- **Breathing rhythm**: 4 seconds (3.5s on mobile)
- **Hover responses**: 0.2-second acknowledgment

## Mobile Contemplative Design
- Minimum 44px touch targets
- 16px font size to prevent iOS zoom
- Contemplative spacing maintained at all breakpoints
- Touch interactions feel intentional, not accidental

## Accessibility Requirements
- All animations respect `prefers-reduced-motion`
- Color contrast meets WCAG AA standards
- Keyboard navigation for all interactions
- Screen reader friendly content structure

## Component Export Reference

### Available for Other Builders
```typescript
// Shared contemplative components
export { BreathingCard } from '@/components/contemplative/BreathingCard'
export { SacredButton } from '@/components/contemplative/SacredButton'
export { ContemplativeForm, FormField } from '@/components/contemplative/ContemplativeForm'

// Sacred color palette
export const contemplativeColors = {
  stoneBlack: '#0a0a0a',
  stoneGrey: '#6b7280',
  stoneWhite: '#e5e7eb',
  breathingGreen: '#22c55e',
  breathingBlue: '#3b82f6',
  breathingGold: '#f59e0b',
  contemplativeWhite: '#fafafa'
}
```
