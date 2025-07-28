import { BubbleContainer } from '@/components/journey/BubbleContainer'
import { ProblemBubble } from '@/components/journey/ProblemBubble'
import { SolutionBubble } from '@/components/journey/SolutionBubble'
import { RealityBubble } from '@/components/journey/RealityBubble'
import { InvitationBubble } from '@/components/journey/InvitationBubble'

export default function ContemplativeLandingPage() {
  return (
    <main className="contemplative-container min-h-screen">
      {/* Selah Header with Breathing Logo */}
      <header className="text-center py-sacred">
        <div className="breathing-element">
          <h1 className="text-3xl md:text-4xl font-bold text-stone-black">
            🪨 <span className="text-breathing-blue">SELAH</span> 🪨
          </h1>
          <p className="text-stone-grey mt-2 text-lg">
            You are here
          </p>
        </div>
      </header>

      {/* Four-Bubble Contemplative Journey */}
      <BubbleContainer>
        <ProblemBubble />
        <SolutionBubble />
        <RealityBubble />
        <InvitationBubble />
      </BubbleContainer>

      {/* Sacred Footer */}
      <footer className="text-center py-sacred text-stone-grey">
        <p className="text-sm">
          Built with reverence by Ahiya & Professor Oded Maimon
        </p>
        <p className="text-xs mt-1">
          Technology that breathes with you
        </p>
      </footer>
    </main>
  )
}
