<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoluniFy - Nonprofit Volunteer Management</title>
  <style>
    /* Base Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
      background-color: #FFFAF5;
      color: #333;
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }
    
    /* Header */
    header {
      background-color: #fff;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      position: fixed;
      width: 100%;
      z-index: 100;
    }
    
    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
    }
    
    .logo {
      font-size: 28px;
      font-weight: bold;
      color: #6A5ACD;
    }
    
    .logo span {
      color: #FF8C00;
    }
    
    .nav-links {
      display: flex;
      list-style: none;
    }
    
    .nav-links li {
      margin: 0 15px;
    }
    
    .nav-links a {
      text-decoration: none;
      color: #333;
      font-weight: 500;
      transition: color 0.3s;
    }
    
    .nav-links a:hover {
      color: #6A5ACD;
    }
    
    .nav-links a.active {
      color: #6A5ACD;
      font-weight: 600;
      border-bottom: 2px solid #6A5ACD;
    }
    
    .auth-buttons {
      display: flex;
      gap: 15px;
    }
    
    .btn {
      padding: 10px 20px;
      border-radius: 30px;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s;
      text-decoration: none;
    }
    
    .btn-outline {
      border: 1px solid #6A5ACD;
      color: #6A5ACD;
      background: transparent;
    }
    
    .btn-primary {
      background-color: #6A5ACD;
      color: white;
      border: none;
    }
    
    .btn-secondary {
      background-color: #FF8C00;
      color: white;
      border: none;
    }
    
    /* Hero Section */
    .hero {
      padding: 150px 0 80px;
      display: flex;
      align-items: center;
    }
    
    .hero-content {
      flex: 1;
    }
    
    .hero h1 {
      font-size: 54px;
      margin-bottom: 20px;
      color: #333;
      line-height: 1.2;
    }
    
    .hero h1 .highlight {
      color: #6A5ACD;
    }
    
    .hero h1 .highlight-orange {
      color: #FF8C00;
    }
    
    .hero p {
      font-size: 18px;
      margin-bottom: 30px;
      color: #666;
      line-height: 1.6;
    }
    
    .hero-buttons {
      display: flex;
      gap: 15px;
      margin-bottom: 20px;
    }
    
    .hero-image {
      flex: 1;
      text-align: right;
    }
    
    .hero-image img {
      max-width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    /* Benefits Section */
    .benefits {
      padding: 80px 0;
      background-color: white;
    }
    
    .section-header {
      text-align: center;
      margin-bottom: 60px;
    }
    
    .section-header h2 {
      font-size: 36px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .section-header p {
      font-size: 18px;
      color: #666;
      max-width: 600px;
      margin: 0 auto;
    }
    
    .benefits-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
    }
    
    .benefit-card {
      background-color: #FFFAF5;
      border-radius: 10px;
      padding: 30px;
      text-align: center;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .benefit-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    }
    
    .benefit-icon {
      font-size: 40px;
      margin-bottom: 20px;
      color: #6A5ACD;
    }
    
    .benefit-card h3 {
      font-size: 22px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .benefit-card p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
    }
    
    /* How It Works */
    .how-it-works {
      padding: 80px 0;
      background-color: #FFFAF5;
    }
    
    .steps-container {
      display: flex;
      flex-direction: column;
      gap: 40px;
      margin-top: 40px;
    }
    
    .step {
      display: flex;
      align-items: center;
      gap: 30px;
    }
    
    .step-number {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #6A5ACD;
      color: white;
      font-size: 32px;
      font-weight: bold;
      flex-shrink: 0;
    }
    
    .step-content {
      flex: 1;
    }
    
    .step-content h3 {
      font-size: 24px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .step-content p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
    }
    
    /* Success Stories */
    .success-stories {
      padding: 80px 0;
      background-color: white;
    }
    
    .stories-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
      margin-top: 40px;
    }
    
    .story-card {
      background-color: #FFFAF5;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }
    
    .story-image {
      height: 200px;
      background-color: #ddd;
    }
    
    .story-content {
      padding: 25px;
    }
    
    .story-content h3 {
      font-size: 20px;
      margin-bottom: 10px;
      color: #333;
    }
    
    .story-content p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
      margin-bottom: 15px;
    }
    
    .story-stats {
      display: flex;
      justify-content: space-between;
      border-top: 1px solid #eee;
      padding-top: 15px;
      margin-top: 15px;
    }
    
    .stat {
      text-align: center;
    }
    
    .stat-number {
      font-size: 20px;
      font-weight: bold;
      color: #6A5ACD;
      margin-bottom: 5px;
    }
    
    .stat-label {
      font-size: 14px;
      color: #666;
    }
    
    /* Pricing */
    .pricing {
      padding: 80px 0;
      background-color: #FFFAF5;
    }
    
    .pricing-options {
      display: flex;
      justify-content: center;
      gap: 30px;
      margin-top: 40px;
    }
    
    .pricing-card {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      padding: 40px;
      width: 350px;
      text-align: center;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .pricing-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0,0,0,0.1);
    }
    
    .pricing-card.featured {
      border: 2px solid #6A5ACD;
      position: relative;
    }
    
    .featured-tag {
      position: absolute;
      top: -15px;
      left: 50%;
      transform: translateX(-50%);
      background-color: #6A5ACD;
      color: white;
      padding: 5px 15px;
      border-radius: 20px;
      font-size: 14px;
      font-weight: bold;
    }
    
    .pricing-card h3 {
      font-size: 24px;
      margin-bottom: 10px;
      color: #333;
    }
    
    .pricing-card .price {
      font-size: 48px;
      font-weight: bold;
      color: #6A5ACD;
      margin-bottom: 20px;
    }
    
    .pricing-card .price span {
      font-size: 16px;
      color: #666;
      font-weight: normal;
    }
    
    .pricing-card ul {
      list-style: none;
      margin-bottom: 30px;
      text-align: left;
    }
    
    .pricing-card ul li {
      padding: 10px 0;
      border-bottom: 1px solid #eee;
      font-size: 16px;
      color: #666;
    }
    
    .pricing-card ul li:before {
      content: "✓";
      color: #6A5ACD;
      margin-right: 10px;
    }
    
    /* FAQ Section */
    .faq {
      padding: 80px 0;
      background-color: white;
    }
    
    .faq-container {
      max-width: 800px;
      margin: 40px auto 0;
    }
    
    .faq-item {
      border-bottom: 1px solid #eee;
      padding: 20px 0;
    }
    
    .faq-question {
      font-size: 18px;
      font-weight: 600;
      color: #333;
      margin-bottom: 15px;
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .faq-question:after {
      content: "+";
      font-size: 24px;
      color: #6A5ACD;
    }
    
    .faq-answer {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
      padding-bottom: 10px;
    }
    
    /* CTA Section */
    .cta {
      padding: 80px 0;
      background-color: #6A5ACD;
      color: white;
      text-align: center;
    }
    
    .cta h2 {
      font-size: 36px;
      margin-bottom: 20px;
    }
    
    .cta p {
      font-size: 18px;
      margin-bottom: 30px;
      max-width: 600px;
      margin-left: auto;
      margin-right: auto;
    }
    
    /* Footer */
    footer {
      background-color: #333;
      color: white;
      padding: 60px 0 30px;
    }
    
    .footer-content {
      display: grid;
      grid-template-columns: 2fr 1fr 1fr 1fr;
      gap: 40px;
      margin-bottom: 40px;
    }
    
    .footer-info h3 {
      font-size: 24px;
      margin-bottom: 20px;
    }
    
    .footer-info p {
      font-size: 14px;
      line-height: 1.6;
      color: #ccc;
      margin-bottom: 20px;
    }
    
    .footer-links h4 {
      font-size: 18px;
      margin-bottom: 20px;
    }
    
    .footer-links ul {
      list-style: none;
    }
    
    .footer-links li {
      margin-bottom: 10px;
    }
    
    .footer-links a {
      text-decoration: none;
      color: #ccc;
      transition: color 0.3s;
    }
    
    .footer-links a:hover {
      color: white;
    }
    
    .footer-bottom {
      text-align: center;
      padding-top: 20px;
      border-top: 1px solid #444;
      font-size: 14px;
      color: #999;
    }
    
    /* Responsive */
    @media (max-width: 992px) {
      .hero {
        flex-direction: column;
        text-align: center;
      }
      
      .hero-image {
        margin-top: 40px;
      }
      
      .benefits-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      
      .stories-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      
      .pricing-options {
        flex-direction: column;
        align-items: center;
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
      .benefits-grid, 
      .stories-grid {
        grid-template-columns: 1fr;
      }
      
      .step {
        flex-direction: column;
        text-align: center;
      }
      
      .hero-buttons {
        justify-content: center;
      }
      
      .footer-content {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>
  <!-- Header -->
  <header>
    <div class="container">
      <nav>
        <div class="logo">Voluni<span>Fy</span></div>
        <ul class="nav-links">
          <li><a href="${pageContext.request.contextPath}/features">Features</a></li>
          <li><a href="${pageContext.request.contextPath}/nonprofits" class="active">Nonprofits</a></li>
          <li><a href="${pageContext.request.contextPath}/volunteers">Volunteers</a></li>
          <li><a href="${pageContext.request.contextPath}/schools">Schools</a></li>
          <li><a href="${pageContext.request.contextPath}/companies">Companies</a></li>
          <li><a href="${pageContext.request.contextPath}/pricing">Pricing</a></li>
        </ul>
        <div class="auth-buttons">
          <a href="${pageContext.request.contextPath}/login" class="btn btn-outline">Log In</a>
          <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Sign Up</a>
        </div>
      </nav>
    </div>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <div class="container">
      <div class="hero-content">
        <h1>Empower Your <span class="highlight">Nonprofit's</span> Mission with <span class="highlight-orange">Volunteer Power</span></h1>
        <p>VoluniFy helps nonprofit organizations recruit, manage, and retain volunteers effectively. Our platform is designed specifically for the unique needs of nonprofits, saving you time and resources.</p>
        <div class="hero-buttons">
          <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Start Your Free Trial</a>
          <a href="#" class="btn btn-outline">Schedule a Demo</a>
        </div>
      </div>
      <div class="hero-image">
        <img src="/api/placeholder/500/400" alt="Nonprofit volunteer management">
      </div>
    </div>
  </section>

  <!-- Benefits Section -->
  <section class="benefits">
    <div class="container">
      <div class="section-header">
        <h2>Why Nonprofits Choose VoluniFy</h2>
        <p>Trusted by thousands of nonprofits worldwide to streamline their volunteer programs</p>
      </div>
      <div class="benefits-grid">
        <div class="benefit-card">
          <div class="benefit-icon">⏱️</div>
          <h3>Save Valuable Time</h3>
          <p>Automated workflows reduce administrative tasks by up to 75%, allowing you to focus on your mission rather than paperwork.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">📈</div>
          <h3>Increase Engagement</h3>
          <p>Boost volunteer retention rates with personalized communication tools and recognition programs.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">💰</div>
          <h3>Reduce Costs</h3>
          <p>All-in-one platform eliminates the need for multiple software subscriptions, saving nonprofits an average of $3,000 annually.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">📊</div>
          <h3>Measure Impact</h3>
          <p>Generate detailed reports on volunteer hours, skills utilized, and program outcomes for grants and stakeholders.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">🔒</div>
          <h3>HIPAA & FERPA Compliant</h3>
          <p>Built with security features that meet the highest standards for data protection and privacy compliance.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">🌐</div>
          <h3>Seamless Integration</h3>
          <p>Connect with your existing CRM, donor management, and communication tools for a unified nonprofit workflow.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- How It Works -->
  <section class="how-it-works">
    <div class="container">
      <div class="section-header">
        <h2>How VoluniFy Works for Nonprofits</h2>
        <p>Our simple yet powerful platform grows with your organization</p>
      </div>
      <div class="steps-container">
        <div class="step">
          <div class="step-number">1</div>
          <div class="step-content">
            <h3>Streamlined Volunteer Recruitment</h3>
            <p>Create custom registration forms that collect the information you need. Embedded skill-matching algorithms connect you with volunteers who have the exact skills your nonprofit needs, while our SEO-optimized opportunity listings help you reach more potential volunteers.</p>
          </div>
        </div>
        <div class="step">
          <div class="step-number">2</div>
          <div class="step-content">
            <h3>Efficient Volunteer Management</h3>
            <p>Automate volunteer scheduling, check-ins, and hour tracking. Send automatic reminders to reduce no-shows by 40%. Our mobile app makes it easy for volunteers to find opportunities, sign up, and log hours from anywhere.</p>
          </div>
        </div>
        <div class="step">
          <div class="step-number">3</div>
          <div class="step-content">
            <h3>Engage & Retain Volunteers</h3>
            <p>Keep volunteers coming back with personalized communication, automated recognition programs, and impact reporting. Our platform helps volunteers see how their time directly contributes to your mission's success.</p>
          </div>
        </div>
        <div class="step">
          <div class="step-number">4</div>
          <div class="step-content">
            <h3>Measure & Improve Your Program</h3>
            <p>Access comprehensive analytics and customizable reports for grants, board meetings, and internal decision-making. Track volunteer hours, skills utilized, retention rates, and program outcomes to continuously improve your volunteer program.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Success Stories -->
  <section class="success-stories">
    <div class="container">
      <div class="section-header">
        <h2>Nonprofit Success Stories</h2>
        <p>See how other organizations have transformed their volunteer programs with VoluniFy</p>
      </div>
      <div class="stories-grid">
        <div class="story-card">
          <div class="story-image">
            <img src="/api/placeholder/400/200" alt="Community Food Bank">
          </div>
          <div class="story-content">
            <h3>Community Food Bank</h3>
            <p>Streamlined volunteer onboarding process and reduced administrative time by 85%, allowing staff to focus on food distribution and community outreach.</p>
            <div class="story-stats">
              <div class="stat">
                <div class="stat-number">3,500+</div>
                <div class="stat-label">Volunteers</div>
              </div>
              <div class="stat">
                <div class="stat-number">85%</div>
                <div class="stat-label">Time Saved</div>
              </div>
              <div class="stat">
                <div class="stat-number">45%</div>
                <div class="stat-label">Retention</div>
              </div>
            </div>
          </div>
        </div>
        <div class="story-card">
          <div class="story-image">
            <img src="/api/placeholder/400/200" alt="Habitat for Humanity">
          </div>
          <div class="story-content">
            <h3>Habitat for Humanity Chapter</h3>
            <p>Increased volunteer recruitment by 65% through simplified sign-up process and improved community visibility. Volunteer retention increased by 40%.</p>
            <div class="story-stats">
              <div class="stat">
                <div class="stat-number">12,000+</div>
                <div class="stat-label">Hours Logged</div>
              </div>
              <div class="stat">
                <div class="stat-number">65%</div>
                <div class="stat-label">More Volunteers</div>
              </div>
              <div class="stat">
                <div class="stat-number">40%</div>
                <div class="stat-label">Higher Retention</div>
              </div>
            </div>
          </div>
        </div>
        <div class="story-card">
          <div class="story-image">
            <img src="/api/placeholder/400/200" alt="Animal Rescue League">
          </div>
          <div class="story-content">
            <h3>Animal Rescue League</h3>
            <p>Automated volunteer scheduling and reminders reduced no-shows by 60%. Detailed skills tracking helped match volunteers to appropriate roles.</p>
            <div class="story-stats">
              <div class="stat">
                <div class="stat-number">1,200+</div>
                <div class="stat-label">Active Volunteers</div>
              </div>
              <div class="stat">
                <div class="stat-number">60%</div>
                <div class="stat-label">Fewer No-shows</div>
              </div>
              <div class="stat">
                <div class="stat-number">30%</div>
                <div class="stat-label">Cost Reduction</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Pricing Section -->
  <section class="pricing">
    <div class="container">
      <div class="section-header">
        <h2>Nonprofit-Friendly Pricing</h2>
        <p>Affordable plans designed specifically for mission-driven organizations</p>
      </div>
      <div class="pricing-options">
        <div class="pricing-card">
          <h3>Starter</h3>
          <div class="price">$49<span>/month</span></div>
          <ul>
            <li>Up to 50 volunteers</li>
            <li>Basic volunteer profiles</li>
            <li>Simple event scheduling</li>
            <li>Hour tracking</li>
            <li>Email notifications</li>
            <li>Standard reports</li>
            <li>Community support</li>
          </ul>
          <a href="${pageContext.request.contextPath}/register" class="btn btn-outline">Get Started</a>
        </div>
        <div class="pricing-card featured">
          <div class="featured-tag">Most Popular</div>
          <h3>Professional</h3>
          <div class="price">$99<span>/month</span></div>
          <ul>
            <li>Up to 250 volunteers</li>
            <li>Advanced volunteer profiles</li>
            <li>Custom registration forms</li>
            <li>Shift management</li>
            <li>Automated reminders</li>
            <li>Skill matching</li>
            <li>Custom reports</li>
            <li>Email and chat support</li>
          </ul>
          <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Get Started</a>
        </div>
        <div class="pricing-card">
          <h3>Enterprise</h3>
          <div class="price">$199<span>/month</span></div>
          <ul>
            <li>Unlimited volunteers</li>
            <li>Background checks</li>
            <li>Volunteer certification</li>
            <li>API access</li>
            <li>Custom integrations</li>
            <li>Advanced analytics</li>
            <li>Multi-location support</li>
            <li>Dedicated account manager</li>
          </ul>
          <a href="#" class="btn btn-outline">Contact Sales</a>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQ Section -->
  <section class="faq">
    <div class="container">
      <div class="section-header">
        <h2>Frequently Asked Questions</h2>
        <p>Common questions from nonprofit organizations</p>
      </div>
      <div class="faq-container">
        <div class="faq-item">
          <div class="faq-question">How difficult is it to switch from our current volunteer management system?</div>
          <div class="faq-answer">Our onboarding team makes the transition smooth and easy. We provide data migration services, personalized training, and 24/7 support during your first 30 days. Most nonprofits are up and running within a week.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Do you offer discounts for small nonprofits?</div>
          <div class="faq-answer">Yes! We offer special pricing for nonprofits with annual budgets under $500,000. Contact our sales team for more information about our nonprofit discount program.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Can we customize registration forms for different volunteer roles?</div>
          <div class="faq-answer">Absolutely. VoluniFy allows you to create unlimited custom registration forms with specific questions and requirements for different positions, events, or programs.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Does VoluniFy integrate with our existing donor management software?</div>
          <div class="faq-answer">Yes, we offer integrations with popular nonprofit CRMs and donor management systems including Salesforce Nonprofit Cloud, Blackbaud, DonorPerfect, and many others.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">What kind of support do you provide?</div>
          <div class="faq-answer">All plans include access to our knowledge base and community forums. Professional and Enterprise plans include email and chat support, while Enterprise customers receive a dedicated account manager.</div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="cta">
    <div class="container">
      <h2>Transform Your Nonprofit's Volunteer Program</h2>
      <p>Join thousands of nonprofits already using VoluniFy to make a bigger impact with their volunteers.</p>
      <div class="hero-buttons">
        <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Start Your Free Trial</a>
        <a href="#" class="btn btn-outline" style="color: white; border-color: white;">Schedule a Demo</a>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="footer-content">
        <div class="footer-info">
          <h3>VoluniFy</h3>
          <p>The complete volunteer management solution for nonprofits, schools, and corporations. Simplify recruitment, engagement, and impact measurement.</p>
        </div>