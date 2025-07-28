// Resend Email Service
// Beautiful contemplative communication

import { Resend } from 'resend'
import { EmailTemplate } from '@/types/application'

const resend = new Resend(process.env.RESEND_API_KEY)

export interface EmailSendRequest {
  to: string
  subject: string
  content: string
  template_type?: string
  user_id?: string
}

export interface EmailSendResponse {
  success: boolean
  message_id?: string
  error?: string
}

export class ResendEmailService {
  /**
   * Send personalized welcome email with contemplative design
   */
  static async sendPersonalizedWelcome(
    request: EmailSendRequest
  ): Promise<EmailSendResponse> {
    try {
      const htmlContent = this.renderContemplativeTemplate(request.content)
      
      const response = await resend.emails.send({
        from: 'hello@selah.im',
        to: request.to,
        subject: request.subject,
        html: htmlContent,
        headers: {
          'X-Contemplative-Source': 'selah-im-v2',
          'X-Template-Type': request.template_type || 'welcome'
        }
      })
      
      return {
        success: true,
        message_id: response.data?.id
      }
      
    } catch (error) {
      console.error('Email sending failed:', error)
      return {
        success: false,
        error: error instanceof Error ? error.message : 'Unknown email error'
      }
    }
  }

  /**
   * Render email content with beautiful contemplative template
   */
  private static renderContemplativeTemplate(content: string): string {
    return `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Selah | Contemplative Technology</title>
  <style>
    body { 
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; 
      line-height: 1.618; 
      color: #0a0a0a;
      background: linear-gradient(135deg, #fafafa 0%, #e5e7eb 100%);
      margin: 0;
      padding: 20px;
    }
    .sacred-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 2rem;
      background: white;
      border-radius: 12px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    }
    .breathing-logo {
      text-align: center;
      margin-bottom: 2rem;
      animation: breathe 4s ease-in-out infinite;
    }
    .breathing-logo h1 {
      font-size: 1.5rem;
      color: #3b82f6;
      margin: 0;
    }
    .contemplative-content {
      white-space: pre-line;
      margin: 1.5rem 0;
    }
    .sacred-footer {
      margin-top: 2rem; 
      padding-top: 2rem; 
      border-top: 1px solid #e5e7eb; 
      text-align: center; 
      color: #6b7280;
      font-size: 0.875rem;
    }
    @keyframes breathe {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.02); }
    }
    @media (max-width: 600px) {
      .sacred-container {
        padding: 1rem;
        margin: 0 10px;
      }
    }
  </style>
</head>
<body>
  <div class="sacred-container">
    <div class="breathing-logo">
      <h1>🪨 SELAH 🪨</h1>
      <p style="color: #6b7280; margin: 0.5rem 0 0 0;">You are here</p>
    </div>
    
    <div class="contemplative-content">
      ${content}
    </div>
    
    <div class="sacred-footer">
      Built with reverence by Ahiya & Professor Oded Maimon<br>
      <em>Technology that breathes with you</em>
    </div>
  </div>
</body>
</html>
    `
  }

  /**
   * Send admin notification for new application
   */
  static async sendAdminNotification(
    application: any
  ): Promise<EmailSendResponse> {
    try {
      const subject = `New Selah Application: ${application.preferred_name}`
      const content = `
New contemplative technology application received:

Name: ${application.preferred_name}
Email: ${application.email}

Discovery Story:
${application.discovery_story}

Technology Relationship:
${application.tech_relationship}

Review at: https://selah.im/admin/applications/${application.id}
      `
      
      return await this.sendPersonalizedWelcome({
        to: 'ahiya@selah.im',
        subject,
        content,
        template_type: 'admin_notification'
      })
      
    } catch (error) {
      console.error('Admin notification failed:', error)
      return {
        success: false,
        error: 'Failed to send admin notification'
      }
    }
  }
}
