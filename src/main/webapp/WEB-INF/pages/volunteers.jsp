<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoluniFy - Volunteers</title>
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
    
    .nav-links a:hover, .nav-links a.active {
      color: #6A5ACD;
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
      padding: 150px 0 60px;
      background-color: #6A5ACD;
      color: white;
      text-align: center;
    }
    
    .hero h1 {
      font-size: 48px;
      margin-bottom: 20px;
    }
    
    .hero p {
      font-size: 18px;
      max-width: 700px;
      margin: 0 auto 30px;
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
      max-width: 700px;
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

    .steps {
      display: flex;
      justify-content: space-between;
      max-width: 1000px;
      margin: 0 auto;
    }

    .step {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      width: 250px;
    }

    .step-number {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background-color: #6A5ACD;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .step h3 {
      font-size: 20px;
      margin-bottom: 15px;
      color: #333;
    }

    .step p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
    }

    .step-connector {
      height: 2px;
      background-color: #ddd;
      width: 100px;
      margin-top: 30px;
    }

    /* App Features */
    .app-features {
      padding: 80px 0;
      background-color: white;
    }

    .app-content {
      display: flex;
      align-items: center;
      gap: 50px;
    }

    .app-image {
      flex: 1;
    }

    .app-image img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .app-details {
      flex: 1;
    }

    .app-details h2 {
      font-size: 36px;
      margin-bottom: 20px;
      color: #333;
    }

    .feature-list {
      margin-top: 30px;
    }

    .feature-item {
      display: flex;
      align-items: flex-start;
      margin-bottom: 20px;
    }

    .feature-icon {
      background-color: #F0EBF8;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #6A5ACD;
      font-size: 20px;
      margin-right: 15px;
      flex-shrink: 0;
    }

    .feature-text h4 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #333;
    }

    .feature-text p {
      font-size: 15px;
      color: #666;
      line-height: 1.6;
    }

    /* Testimonials */
    .testimonials {
      padding: 80px 0;
      background-color: #FFFAF5;
    }

    .testimonial-slider {
      max-width: 800px;
      margin: 0 auto;
      background-color: white;
      border-radius: 10px;
      padding: 40px;
      text-align: center;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    .testimonial-text {
      font-size: 18px;
      font-style: italic;
      color: #666;
      line-height: 1.6;
      margin-bottom: 30px;
    }

    .testimonial-author {
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .author-avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background-color: #ddd;
      margin-right: 15px;
    }

    .author-info h4 {
      font-size: 18px;
      color: #333;
      margin-bottom: 5px;
      text-align: left;
    }

    .author-info p {
      font-size: 14px;
      color: #666;
      text-align: left;
    }

    /* CTA */
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
      max-width: 700px;
      margin-left: auto;
      margin-right: auto;
    }

    .app-buttons {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 30px;
    }

    .app-button {
      display: flex;
      align-items: center;
      background-color: white;
      color: #333;
      padding: 12px 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: transform 0.3s;
    }

    .app-button:hover {
      transform: translateY(-3px);
    }

    .app-button-icon {
      font-size: 24px;
      margin-right: 10px;
    }

    .app-button-text {
      text-align: left;
    }

    .app-button-text small {
      display: block;
      font-size: 12px;
      margin-bottom: 2px;
    }

    .app-button-text strong {
      font-size: 16px;
    }

    /* FAQs */
    .faqs {
      padding: 80px 0;
      background-color: white;
    }

    .faq-list {
      max-width: 800px;
      margin: 0 auto;
    }

    .faq-item {
      margin-bottom: 20px;
      border-radius: 8px;
      overflow: hidden;
      background-color: #FFFAF5;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .faq-question {
      padding: 20px;
      font-size: 18px;
      font-weight: 500;
      color: #333;
      cursor: pointer;
      position: relative;
      padding-right: 40px;
    }

    .faq-question::after {
      content: "+";
      position: absolute;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 24px;
      color: #6A5ACD;
    }

    .faq-answer {
      padding: 0 20px 20px;
      font-size: 16px;
      color: #666;
      line-height: 1.6;
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
      .benefits-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      
      .steps {
        flex-direction: column;
        align-items: center;
        gap: 40px;
      }
      
      .step-connector {
        display: none;
      }
      
      .app-content {
        flex-direction: column-reverse;
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
      .benefits-grid {
        grid-template-columns: 1fr;
      }
      
      .app-buttons {
        flex-direction: column;
        align-items: center;
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
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/features">Features</a></li>
          <li><a href="${pageContext.request.contextPath}/nonprofits">Nonprofits</a></li>
          <li><a href="${pageContext.request.contextPath}/volunteers" class="active">Volunteers</a></li>
          <li><a href="${pageContext.request.contextPath}/schools">Schools</a></li>
          <li><a href="${pageContext.request.contextPath}/pricing">Pricing</a></li>
          <li><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
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
      <h1>Make a Difference with Your Time</h1>
      <p>Find meaningful volunteer opportunities, track your impact, and build your volunteer portfolio all in one place</p>
      <a href="#" class="btn btn-secondary">Download Our App</a>
    </div>
  </section>

  <!-- Benefits Section -->
  <section class="benefits">
    <div class="container">
      <div class="section-header">
        <h2>Benefits for Volunteers</h2>
        <p>Join thousands of volunteers already using VoluniFy to find opportunities and track their impact</p>
      </div>
      <div class="benefits-grid">
        <div class="benefit-card">
          <div class="benefit-icon">🔍</div>
          <h3>Find Opportunities</h3>
          <p>Discover volunteer opportunities that match your skills, interests, and availability with our smart search tools.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">📊</div>
          <h3>Track Your Impact</h3>
          <p>Automatically log your volunteer hours and see the tangible difference you're making in your community.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">📄</div>
          <h3>Build Your Profile</h3>
          <p>Create a professional volunteer portfolio to showcase your community service for college applications or resumes.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">📱</div>
          <h3>Mobile Access</h3>
          <p>Manage your volunteer activities on the go with our user-friendly mobile app for iOS and Android.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">🏆</div>
          <h3>Earn Rewards</h3>
          <p>Get recognition for your service with digital badges, certificates, and potential rewards from partner organizations.</p>
        </div>
        <div class="benefit-card">
          <div class="benefit-icon">👥</div>
          <h3>Connect with Others</h3>
          <p>Join a community of like-minded volunteers and share experiences through our social features.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- How It Works -->
  <section class="how-it-works">
    <div class="container">
      <div class="section-header">
        <h2>How It Works</h2>
        <p>Getting started with VoluniFy is simple and takes just minutes</p>
      </div>
      <div class="steps">
        <div class="step">
          <div class="step-number">1</div>
          <h3>Create Your Profile</h3>
          <p>Sign up and fill out your interests, skills, and availability preferences.</p>
        </div>
        <div class="step-connector"></div>
        <div class="step">
          <div class="step-number">2</div>
          <h3>Find Opportunities</h3>
          <p>Browse and filter opportunities that match your profile and preferences.</p>
        </div>
        <div class="step-connector"></div>
        <div class="step">
          <div class="step-number">3</div>
          <h3>Volunteer & Log Hours</h3>
          <p>Participate in activities and easily log your hours through the app.</p>
        </div>
        <div class="step-connector"></div>
        <div class="step">
          <div class="step-number">4</div>
          <h3>Track Your Impact</h3>
          <p>See statistics and impact reports of your volunteer contributions.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- App Features -->
  <section class="app-features">
    <div class="container">
      <div class="app-content">
        <div class="app-image">
          <img src="/api/placeholder/500/600" alt="VoluniFy Mobile App">
        </div>
        <div class="app-details">
          <h2>The VoluniFy Volunteer App</h2>
          <p>Our mobile app gives you all the tools you need to find, manage, and track your volunteer activities from anywhere.</p>
          
          <div class="feature-list">
            <div class="feature-item">
              <div class="feature-icon">✓</div>
              <div class="feature-text">
                <h4>Smart Opportunity Matching</h4>
                <p>Get personalized volunteer opportunity recommendations based on your interests and skills.</p>
              </div>
            </div>
            <div class="feature-item">
              <div class="feature-icon">✓</div>
              <div class="feature-text">
                <h4>Digital Hour Logging</h4>
                <p>Easily track your volunteer hours with GPS verification and supervisor approval.</p>
              </div>
            </div>
            <div class="feature-item">
              <div class="feature-icon">✓</div>
              <div class="feature-text">
                <h4>Impact Dashboard</h4>
                <p>Visualize your contributions and impact with intuitive charts and statistics.</p>
              </div>
            </div>
            <div class="feature-item">
              <div class="feature-icon">✓</div>
              <div class="feature-text">
                <h4>Digital Certificates</h4>
                <p>Access and share verifiable certificates for completed volunteer service.</p>
              </div>
            </div>
          </div>
          
          <div class="app-buttons">
            <a href="#" class="app-button">
              <div class="app-button-icon">●</div>
              <div class="app-button-text">
                <small>Download on the</small>
                <strong>App Store</strong>
              </div>
            </a>
            <a href="#" class="app-button">
              <div class="app-button-icon">●</div>
              <div class="app-button-text">
                <small>Get it on</small>
                <strong>Google Play</strong>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials -->
  <section class="testimonials">
    <div class="container">
      <div class="section-header">
        <h2>What Volunteers Say</h2>
        <p>Join thousands of volunteers already making an impact with VoluniFy</p>
      </div>
      <div class="testimonial-slider">
        <p class="testimonial-text">"VoluniFy has made it so much easier for me to find volunteer opportunities that fit my schedule. I've been able to contribute more to my community than ever before, and I love being able to see the impact of my hours."</p>
        <div class="testimonial-author">
          <div class="author-avatar"></div>
          <div class="author-info">
            <h4>James Wilson</h4>
            <p>College Student & Regular Volunteer</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQs -->
  <section class="faqs">
    <div class="container">
      <div class="section-header">
        <h2>Frequently Asked Questions</h2>
        <p>Get answers to common questions about volunteering with VoluniFy</p>
      </div>
      <div class="faq-list">
        <div class="faq-item">
          <div class="faq-question">Is the VoluniFy app free for volunteers?</div>
          <div class="faq-answer">Yes! The VoluniFy app is completely free for individual volunteers. You can create an account, find opportunities, log hours, and track your impact without any charge.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">How do I get my volunteer hours verified?</div>
          <div class="faq-answer">When you log hours through the app, the organization coordinator will receive a notification to approve them. Once approved, your hours are officially verified and added to your profile.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Can I use VoluniFy to find virtual volunteer opportunities?</div>
          <div class="faq-answer">Absolutely! VoluniFy lists both in-person and virtual volunteer opportunities. You can filter by "remote" or "virtual" in the search options to find opportunities you can complete from anywhere.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">How do I generate a report of my volunteer hours?</div>
          <div class="faq-answer">In your volunteer profile, navigate to the "Reports" section where you can generate custom reports of your volunteer hours. You can filter by date range, organization, or activity type, and export as PDF or share directly.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Can I use VoluniFy for court-ordered community service?</div>
          <div class="faq-answer">Yes, many organizations on VoluniFy accept volunteers fulfilling court-ordered service. Be sure to check with the specific organization about their policies, and let them know about your requirements when you sign up.</div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="cta">
    <div class="container">
      <h2>Ready to Start Your Volunteer Journey?</h2>
      <p>Join thousands of volunteers making a difference with VoluniFy. Download our app today and start finding opportunities that match your passions.</p>
      <a href="#" class="btn btn-secondary">Sign Up Now</a>
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
        <div class="footer-links">
          <h4>Platform</h4>
          <ul>
            <li><a href="#">Features</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">Integrations</a></li>
            <li><a href="#">Case Studies</a></li>
          </ul>
        </div>
        <div class="footer-links">
          <h4>Resources</h4>
          <ul>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Guides</a></li>
            <li><a href="#">Webinars</a></li>
            <li><a href="#">Support</a></li>
          </ul>
        </div>
        <div class="footer-links">
          <h4>Company</h4>
          <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Privacy Policy</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2025 VoluniFy. All rights reserved.</p>
      </div>
    </div>
  </footer>
</body>
</html>