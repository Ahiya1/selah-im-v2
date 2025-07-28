// Sacred Application Submission API
// Consciousness-serving application processing

import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/services/supabase'
import { ClaudeAnalysisService } from '@/lib/services/claude-analysis'
import { ResendEmailService } from '@/lib/services/resend'
import { UserApplication, SacredIntakeData } from '@/types/application'
import { z } from 'zod'

// Sacred intake validation schema
const SacredIntakeSchema = z.object({
  preferred_name: z.string().min(1, 'Name is required for recognition').max(100),
  email: z.string().email('Valid email required for connection'),
  discovery_story: z.string().min(10, 'Please share your discovery story').max(2000),
  tech_relationship: z.string().min(10, 'Please share your technology relationship').max(2000)
})

export async function POST(request: NextRequest) {
  try {
    // Parse and validate sacred intake data
    const body = await request.json()
    const applicationData = SacredIntakeSchema.parse(body)
    
    console.log('Processing sacred intake for:', applicationData.preferred_name)
    
    // 1. Store initial application in Supabase
    const { data: storedApp, error: insertError } = await supabase
      .from('user_applications')
      .insert({
        preferred_name: applicationData.preferred_name,
        email: applicationData.email,
        discovery_story: applicationData.discovery_story,
        tech_relationship: applicationData.tech_relationship,
        beta_status: 'pending',
        contemplative_context: {
          submitted_at: new Date().toISOString(),
          user_agent: request.headers.get('user-agent'),
          source: 'selah-im-v2'
        }
      })
      .select()
      .single()
    
    if (insertError) {
      console.error('Supabase insertion failed:', insertError)
      return NextResponse.json(
        { error: 'Failed to store application. Please try again.' },
        { status: 500 }
      )
    }
    
    console.log('Application stored:', storedApp.id)
    
    // 2. Analyze with Claude (async, don't block response)
    ClaudeAnalysisService.analyzeApplication({
      application: applicationData,
      analysis_type: 'initial'
    })
    .then(async (claudeAnalysis) => {
      console.log('Claude analysis complete for:', storedApp.id)
      
      // 3. Generate personalized welcome email
      const personalizedEmail = await ClaudeAnalysisService.generatePersonalizedEmail({
        application: applicationData,
        analysis: claudeAnalysis,
        template_type: 'welcome'
      })
      
      // 4. Send welcome email
      const emailResult = await ResendEmailService.sendPersonalizedWelcome({
        to: applicationData.email,
        subject: personalizedEmail.subject_line,
        content: personalizedEmail.email_content,
        template_type: 'welcome',
        user_id: storedApp.id
      })
      
      // 5. Update application with analysis and email tracking
      await supabase
        .from('user_applications')
        .update({
          claude_analysis: claudeAnalysis,
          contemplative_readiness_score: claudeAnalysis.contemplative_readiness_score,
          welcome_email_sent: emailResult.success,
          welcome_email_sent_at: emailResult.success ? new Date().toISOString() : null,
          email_subject_line: personalizedEmail.subject_line,
          email_content: personalizedEmail.email_content
        })
        .eq('id', storedApp.id)
      
      console.log('Email sent:', emailResult.success)
      
      // 6. Send admin notification
      await ResendEmailService.sendAdminNotification(storedApp)
      
    })
    .catch(error => {
      console.error('Async processing failed:', error)
      // Continue gracefully - application is stored, can be processed manually
    })
    
    // Track contemplative analytics
    await supabase.from('contemplative_analytics').insert({
      event_type: 'application_submitted',
      user_id: storedApp.id,
      contemplative_context: {
        discovery_length: applicationData.discovery_story.length,
        tech_relationship_length: applicationData.tech_relationship.length,
        submission_flow: 'complete'
      }
    })
    
    return NextResponse.json({
      success: true,
      message: 'Your contemplative application has been received',
      application_id: storedApp.id
    })
    
  } catch (error) {
    console.error('Sacred application processing failed:', error)
    
    if (error instanceof z.ZodError) {
      return NextResponse.json(
        { 
          error: 'Please complete all contemplative questions',
          details: error.errors 
        },
        { status: 400 }
      )
    }
    
    return NextResponse.json(
      { error: 'Please try again in a moment' },
      { status: 500 }
    )
  }
}

export async function GET() {
  return NextResponse.json({ 
    message: 'Sacred intake endpoint active',
    timestamp: new Date().toISOString()
  })
}
