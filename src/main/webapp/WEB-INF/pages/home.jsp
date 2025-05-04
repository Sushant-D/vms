<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoluniFy - Volunteer Management System</title>
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
    
    .trust-badge {
      margin-top: 40px;
      display: flex;
      align-items: center;
      gap: 15px;
    }
    
    .trust-score {
      display: flex;
      align-items: center;
      background-color: white;
      padding: 10px 15px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    .trust-score-icon {
      color: green;
      margin-right: 10px;
    }
    
    /* Features Section */
    .features {
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
    
    .features-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
    }
    
    .feature-card {
      background-color: #FFFAF5;
      border-radius: 10px;
      padding: 30px;
      text-align: center;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .feature-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    }
    
    .feature-icon {
      font-size: 40px;
      margin-bottom: 20px;
      color: #6A5ACD;
    }
    
    .feature-card h3 {
      font-size: 22px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .feature-card p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
    }
    
    /* Dashboard Preview */
    .dashboard-preview {
      padding: 80px 0;
      background-color: #FFFAF5;
    }
    
    .dashboard-content {
      display: flex;
      align-items: center;
      gap: 50px;
    }
    
    .dashboard-text {
      flex: 1;
    }
    
    .dashboard-text h2 {
      font-size: 36px;
      margin-bottom: 20px;
      color: #333;
    }
    
    .dashboard-text p {
      font-size: 18px;
      color: #666;
      margin-bottom: 30px;
      line-height: 1.6;
    }
    
    .dashboard-image {
      flex: 1.5;
      position: relative;
    }
    
    .dashboard-image img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    /* Testimonials */
    .testimonials {
      padding: 80px 0;
      background-color: white;
    }
    
    .testimonials-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 30px;
    }
    
    .testimonial-card {
      background-color: #FFFAF5;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }
    
    .testimonial-text {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
      margin-bottom: 20px;
      font-style: italic;
    }
    
    .testimonial-author {
      display: flex;
      align-items: center;
    }
    
    .author-avatar {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background-color: #ddd;
      margin-right: 15px;
    }
    
    .author-info h4 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #333;
    }
    
    .author-info p {
      font-size: 14px;
      color: #666;
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
    
    /* Trusted By */
    .trusted-by {
      padding: 60px 0;
      background-color: #FFFAF5;
      text-align: center;
    }
    
    .trusted-by h3 {
      font-size: 20px;
      color: #666;
      margin-bottom: 30px;
    }
    
    .trusted-logos {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      gap: 40px;
    }
    
    .trusted-logo {
      height: 40px;
      opacity: 0.7;
      transition: opacity 0.3s;
    }
    
    .trusted-logo:hover {
      opacity: 1;
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
      
      .features-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      
      .dashboard-content {
        flex-direction: column;
      }
      
      .dashboard-text {
        text-align: center;
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
      .features-grid, 
      .testimonials-grid {
        grid-template-columns: 1fr;
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
        <div class="logo"><a href="${pageContext.request.contextPath}/">Voluni<span>Fy</span></a></div>
        <ul class="nav-links">
          <li><a href="${pageContext.request.contextPath}/features">Features</a></li>
          <li><a href="${pageContext.request.contextPath}/nonprofits">Nonprofits</a></li>
          <li><a href="${pageContext.request.contextPath}/volunteers">Volunteers</a></li>
          <!-- <li><a href="#">Schools</a></li> -->
          <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li> 
          <li><a href="${pageContext.request.contextPath}/princing">Pricing</a></li>
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
        <h1>Recruit more <span class="highlight">Volunteers</span> and <span class="highlight-orange">Save Time</span> managing them</h1>
        <p>The easiest way to manage, engage, and mobilize volunteers. Our powerful volunteer management system simplifies your experience and saves you time.</p>
        <div class="hero-buttons">
          <a href="#" class="btn btn-secondary">Get Started</a>
          <a href="#" class="btn btn-outline">Watch Demo</a>
        </div>
        <div class="trust-badge">
          <div class="trust-score">
            <span class="trust-score-icon">★</span>
            <span>4.8 Trust Score</span>
          </div>
          <span>Built in partnership with nonprofits</span>
        </div>
      </div>
      <div class="hero-image">
        <img src="/api/placeholder/500/400" alt="Dashboard Preview">
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section class="features">
    <div class="container">
      <div class="section-header">
        <h2>Powerful Features Made Simple</h2>
        <p>Everything you need to efficiently manage your volunteer program in one place</p>
      </div>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">👥</div>
          <h3>Volunteer Recruitment</h3>
          <p>Easily recruit and onboard new volunteers with customizable registration forms and automated workflows.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">📊</div>
          <h3>Advanced Analytics</h3>
          <p>Track volunteer hours, impact metrics, and program performance with intuitive dashboards and reports.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">📱</div>
          <h3>Mobile App</h3>
          <p>Empower volunteers with our user-friendly mobile app for opportunity browsing, hour logging, and more.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">📆</div>
          <h3>Event Management</h3>
          <p>Create, schedule, and manage volunteer opportunities with ease, including sign-ups and reminders.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">🔔</div>
          <h3>Communication Tools</h3>
          <p>Keep volunteers engaged with automated emails, SMS notifications, and a community message board.</p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">🔄</div>
          <h3>Integration Options</h3>
          <p>Seamlessly connect with your existing tools through our API and built-in integrations.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Dashboard Preview -->
  <section class="dashboard-preview">
    <div class="container">
      <div class="dashboard-content">
        <div class="dashboard-text">
          <h2>Intuitive Dashboards for Everyone</h2>
          <p>Our easy-to-use dashboards provide valuable insights for administrators and volunteers alike. Monitor program performance, track volunteer hours, and measure impact—all in one place.</p>
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
        <div class="dashboard-image">
          <img src="/api/placeholder/600/400" alt="Dashboard Preview">
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials -->
  <section class="testimonials">
    <div class="container">
      <div class="section-header">
        <h2>What Our Users Say</h2>
        <p>Join thousands of organizations already using VolunteerHub</p>
      </div>
      <div class="testimonials-grid">
        <div class="testimonial-card">
          <p class="testimonial-text">"VolunteerHub has transformed how we manage our volunteer program. The time we've saved on administrative tasks has allowed us to focus more on our mission."</p>
          <div class="testimonial-author">
            <div class="author-avatar"></div>
            <div class="author-info">
              <h4>Sarah Johnson</h4>
              <p>Volunteer Coordinator, Community Food Bank</p>
            </div>
          </div>
        </div>
        <div class="testimonial-card">
          <p class="testimonial-text">"The analytics tools have given us valuable insights into our volunteer program that we never had before. It's made a huge difference in how we allocate resources."</p>
          <div class="testimonial-author">
            <div class="author-avatar"></div>
            <div class="author-info">
              <h4>Michael Rodriguez</h4>
              <p>Director of Operations, City Shelter</p>
            </div>
          </div>
        </div>
        <div class="testimonial-card">
          <p class="testimonial-text">"Our volunteers love using the mobile app to find opportunities and track their hours. It's helped us increase engagement and retention significantly."</p>
          <div class="testimonial-author">
            <div class="author-avatar"></div>
            <div class="author-info">
              <h4>Lisa Chen</h4>
              <p>Executive Director, Youth Mentoring Program</p>
            </div>
          </div>
        </div>
        <div class="testimonial-card">
          <p class="testimonial-text">"The onboarding process for new volunteers is so much smoother now. VolunteerHub has streamlined everything from application to training."</p>
          <div class="testimonial-author">
            <div class="author-avatar"></div>
            <div class="author-info">
              <h4>David Thompson</h4>
              <p>Volunteer Manager, Animal Rescue</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="cta">
    <div class="container">
      <h2>Ready to Transform Your Volunteer Program?</h2>
      <p>Join thousands of organizations already using VolunteerHub to recruit, engage, and manage volunteers effectively.</p>
      <div class="hero-buttons">
        <a href="#" class="btn btn-secondary">Get Started Free</a>
        <a href="#" class="btn btn-outline" style="color: white; border-color: white;">Schedule a Demo</a>
      </div>
    </div>
  </section>

  <!-- Trusted By -->
  <section class="trusted-by">
    <div class="container">
      <h3>TRUSTED BY 4000+ ORGANIZATIONS</h3>
      <div class="trusted-logos">
        <div class="trusted-logo">Logo 1</div>
        <div class="trusted-logo">Logo 2</div>
        <div class="trusted-logo">Logo 3</div>
        <div class="trusted-logo">Logo 4</div>
        <div class="trusted-logo">Logo 5</div>
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
        <p>&copy; 2025 VolunteerHub. All rights reserved.</p>
      </div>
    </div>
  </footer>
</body>
</html>
