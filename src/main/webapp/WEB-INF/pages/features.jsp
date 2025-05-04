<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Features - VoluniFy</title>
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
    
    /* Page Header */
    .page-header {
      padding: 150px 0 60px;
      background-color: #6A5ACD;
      color: white;
      text-align: center;
    }
    
    .page-header h1 {
      font-size: 48px;
      margin-bottom: 20px;
    }
    
    .page-header p {
      font-size: 18px;
      max-width: 700px;
      margin: 0 auto;
      line-height: 1.6;
    }
    
    /* Feature Section */
    .feature-section {
      padding: 80px 0;
    }
    
    .feature-section:nth-child(even) {
      background-color: white;
    }
    
    .feature-container {
      display: flex;
      align-items: center;
      gap: 50px;
    }
    
    .feature-container.reverse {
      flex-direction: row-reverse;
    }
    
    .feature-image {
      flex: 1;
    }
    
    .feature-image img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    .feature-content {
      flex: 1;
    }
    
    .feature-content h2 {
      font-size: 36px;
      margin-bottom: 20px;
      color: #333;
    }
    
    .feature-content p {
      font-size: 18px;
      color: #666;
      margin-bottom: 30px;
      line-height: 1.6;
    }
    
    .feature-list {
      margin-bottom: 30px;
    }
    
    .feature-list-item {
      display: flex;
      align-items: flex-start;
      margin-bottom: 15px;
    }
    
    .feature-icon {
      margin-right: 15px;
      color: #6A5ACD;
      font-size: 20px;
      min-width: 24px;
    }
    
    .feature-list-content h4 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #333;
    }
    
    .feature-list-content p {
      font-size: 16px;
      margin-bottom: 0;
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
    
    .cta-buttons {
      display: flex;
      justify-content: center;
      gap: 15px;
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
      .feature-container,
      .feature-container.reverse {
        flex-direction: column;
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
      .footer-content {
        grid-template-columns: 1fr;
      }
      
      .cta-buttons {
        flex-direction: column;
        align-items: center;
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
          <li><a href="${pageContext.request.contextPath}/features.jsp" class="active">Features</a></li>
          <li><a href="${pageContext.request.contextPath}/nonprofits.jsp">Nonprofits</a></li>
          <li><a href="${pageContext.request.contextPath}/volunteers.jsp">Volunteers</a></li>
          <li><a href="${pageContext.request.contextPath}/schools.jsp">Schools</a></li>
          <li><a href="${pageContext.request.contextPath}/companies.jsp">Companies</a></li>
          <li><a href="${pageContext.request.contextPath}/pricing.jsp">Pricing</a></li>
        </ul>
        <div class="auth-buttons">
          <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-outline">Log In</a>
          <a href="${pageContext.request.contextPath}/register.jsp" class="btn btn-primary">Sign Up</a>
        </div>
      </nav>
    </div>
  </header>

  <!-- Page Header -->
  <section class="page-header">
    <div class="container">
      <h1>Features Designed for Volunteer Success</h1>
      <p>Discover the powerful tools that make VoluniFy the leading volunteer management system for organizations of all sizes.</p>
    </div>
  </section>

  <!-- Volunteer Recruitment Section -->
  <section class="feature-section">
    <div class="container">
      <div class="feature-container">
        <div class="feature-image">
          <img src="/api/placeholder/500/350" alt="Volunteer Recruitment">
        </div>
        <div class="feature-content">
          <h2>Volunteer Recruitment</h2>
          <p>Attract more volunteers and streamline the onboarding process with our intuitive recruitment tools.</p>
          
          <div class="feature-list">
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Customizable Registration Forms</h4>
                <p>Create tailored application forms that collect exactly the information you need from potential volunteers.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Automated Screening</h4>
                <p>Set qualification criteria and let our system automatically screen applicants based on your requirements.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Onboarding Workflows</h4>
                <p>Guide new volunteers through customized onboarding sequences with automated emails and task assignments.</p>
              </div>
            </div>
          </div>
          
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Advanced Analytics Section -->
  <section class="feature-section">
    <div class="container">
      <div class="feature-container reverse">
        <div class="feature-image">
          <img src="/api/placeholder/500/350" alt="Advanced Analytics">
        </div>
        <div class="feature-content">
          <h2>Advanced Analytics</h2>
          <p>Gain valuable insights into your volunteer program with comprehensive analytics and reporting tools.</p>
          
          <div class="feature-list">
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Real-time Dashboards</h4>
                <p>Monitor key metrics and program performance with customizable, real-time dashboards.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Comprehensive Reporting</h4>
                <p>Generate detailed reports on volunteer hours, impact metrics, demographics, and more.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Data Visualization</h4>
                <p>Visualize trends and patterns with intuitive charts and graphs to better understand your volunteer program.</p>
              </div>
            </div>
          </div>
          
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Mobile App Section -->
  <section class="feature-section">
    <div class="container">
      <div class="feature-container">
        <div class="feature-image">
          <img src="/api/placeholder/500/350" alt="Mobile App">
        </div>
        <div class="feature-content">
          <h2>Mobile App</h2>
          <p>Empower your volunteers with our user-friendly mobile application for on-the-go engagement.</p>
          
          <div class="feature-list">
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Opportunity Browser</h4>
                <p>Allow volunteers to discover and sign up for opportunities that match their interests and availability.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Hour Tracking</h4>
                <p>Enable volunteers to easily log their hours directly from their smartphones with GPS verification.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Push Notifications</h4>
                <p>Keep volunteers informed with timely reminders and announcements delivered straight to their devices.</p>
              </div>
            </div>
          </div>
          
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Event Management Section -->
  <section class="feature-section">
    <div class="container">
      <div class="feature-container reverse">
        <div class="feature-image">
          <img src="/api/placeholder/500/350" alt="Event Management">
        </div>
        <div class="feature-content">
          <h2>Event Management</h2>
          <p>Streamline the planning and execution of volunteer events with our comprehensive event management tools.</p>
          
          <div class="feature-list">
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Event Creation</h4>
                <p>Easily create and schedule volunteer opportunities with customizable details and requirements.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Sign-up Management</h4>
                <p>Manage volunteer registrations, waitlists, and capacity controls for each event.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Automated Reminders</h4>
                <p>Reduce no-shows with automated email and SMS reminders before volunteer shifts.</p>
              </div>
            </div>
          </div>
          
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Communication Tools Section -->
  <section class="feature-section">
    <div class="container">
      <div class="feature-container">
        <div class="feature-image">
          <img src="/api/placeholder/500/350" alt="Communication Tools">
        </div>
        <div class="feature-content">
          <h2>Communication Tools</h2>
          <p>Foster volunteer engagement and maintain clear communication with powerful messaging features.</p>
          
          <div class="feature-list">
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Email Campaigns</h4>
                <p>Create and send targeted email campaigns to specific volunteer segments with our built-in email tools.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>SMS Notifications</h4>
                <p>Send text message updates and alerts to volunteers for time-sensitive communications.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Community Message Board</h4>
                <p>Build community and encourage interaction with a dedicated space for announcements and discussions.</p>
              </div>
            </div>
          </div>
          
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Integration Options Section -->
  <section class="feature-section">
    <div class="container">
      <div class="feature-container reverse">
        <div class="feature-image">
          <img src="/api/placeholder/500/350" alt="Integration Options">
        </div>
        <div class="feature-content">
          <h2>Integration Options</h2>
          <p>Connect VoluniFy with your existing software ecosystem for a seamless workflow.</p>
          
          <div class="feature-list">
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>API Access</h4>
                <p>Leverage our robust API to create custom integrations tailored to your organization's needs.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Pre-built Integrations</h4>
                <p>Connect with popular CRM, email marketing, and fundraising platforms with just a few clicks.</p>
              </div>
            </div>
            <div class="feature-list-item">
              <div class="feature-icon">✓</div>
              <div class="feature-list-content">
                <h4>Data Import/Export</h4>
                <p>Easily move data in and out of VoluniFy with comprehensive import and export capabilities.</p>
              </div>
            </div>
          </div>
          
          <a href="#" class="btn btn-primary">Learn More</a>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="cta">
    <div class="container">
      <h2>Ready to Transform Your Volunteer Program?</h2>
      <p>Experience all these features and more with VoluniFy. Join thousands of organizations already using our platform to recruit, engage, and manage volunteers effectively.</p>
      <div class="cta-buttons">
        <a href="#" class="btn btn-secondary">Get Started Free</a>
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
        <div class="footer-links">
          <h4>Platform</h4>
          <ul>
            <li><a href="${pageContext.request.contextPath}/features.jsp">Features</a></li>
            <li><a href="${pageContext.request.contextPath}/pricing.jsp">Pricing</a></li>
            <li><a href="#">Integrations</a></li>
            <li><a href="#">Case Studies</a></li>
          </ul>
        </div>
        <div class="footer-links">
          <h4>Resources</h4>
          <ul>
            <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
            <li><a href="#">Guides</a></li>
            <li><a href="#">Webinars</a></li>
            <li><a href="#">Support</a></li>
          </ul>
        </div>
        <div class="footer-links">
          <h4>Company</h4>
          <ul>
            <li><a href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/privacy.jsp">Privacy Policy</a></li>
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