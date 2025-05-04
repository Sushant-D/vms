<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us - VoluniFy</title>
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
      padding: 150px 0 50px;
      text-align: center;
      background-color: white;
    }
    
    .page-header h1 {
      font-size: 42px;
      margin-bottom: 20px;
      color: #333;
    }
    
    .page-header p {
      font-size: 18px;
      color: #666;
      max-width: 600px;
      margin: 0 auto;
      line-height: 1.6;
    }
    
    /* Contact Section */
    .contact-section {
      padding: 60px 0;
      background-color: #FFFAF5;
    }
    
    .contact-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 50px;
    }
    
    .contact-info {
      padding: 20px;
    }
    
    .contact-info h2 {
      font-size: 28px;
      margin-bottom: 30px;
      color: #333;
    }
    
    .contact-info-item {
      margin-bottom: 30px;
      display: flex;
      align-items: flex-start;
    }
    
    .contact-icon {
      font-size: 24px;
      color: #6A5ACD;
      margin-right: 15px;
      min-width: 30px;
      text-align: center;
    }
    
    .contact-details h3 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #333;
    }
    
    .contact-details p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
    }
    
    .social-links {
      margin-top: 40px;
    }
    
    .social-links h3 {
      font-size: 18px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .social-icons {
      display: flex;
      gap: 15px;
    }
    
    .social-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      background-color: #6A5ACD;
      color: white;
      border-radius: 50%;
      text-decoration: none;
      font-size: 18px;
      transition: background-color 0.3s;
    }
    
    .social-icon:hover {
      background-color: #FF8C00;
    }
    
    /* Contact Form */
    .contact-form {
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }
    
    .contact-form h2 {
      font-size: 28px;
      margin-bottom: 30px;
      color: #333;
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    .form-group label {
      display: block;
      font-size: 16px;
      margin-bottom: 8px;
      color: #333;
      font-weight: 500;
    }
    
    .form-control {
      width: 100%;
      padding: 12px 15px;
      font-size: 16px;
      border: 1px solid #ddd;
      border-radius: 8px;
      transition: border-color 0.3s;
    }
    
    .form-control:focus {
      border-color: #6A5ACD;
      outline: none;
    }
    
    textarea.form-control {
      min-height: 150px;
      resize: vertical;
    }
    
    /* FAQ Section */
    .faq-section {
      padding: 60px 0;
      background-color: white;
    }
    
    .faq-section h2 {
      font-size: 36px;
      text-align: center;
      margin-bottom: 40px;
    }
    
    .faq-container {
      max-width: 800px;
      margin: 0 auto;
    }
    
    .faq-item {
      margin-bottom: 20px;
      border-bottom: 1px solid #eee;
      padding-bottom: 20px;
    }
    
    .faq-question {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 10px;
      color: #333;
    }
    
    .faq-answer {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
    }
    
    /* Office Locations */
    .locations-section {
      padding: 60px 0;
      background-color: #FFFAF5;
    }
    
    .locations-section h2 {
      font-size: 36px;
      text-align: center;
      margin-bottom: 40px;
    }
    
    .locations-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
    }
    
    .location-card {
      background-color: white;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      text-align: center;
    }
    
    .location-icon {
      font-size: 30px;
      color: #6A5ACD;
      margin-bottom: 20px;
    }
    
    .location-card h3 {
      font-size: 20px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .location-card p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
      margin-bottom: 20px;
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
      .contact-container,
      .locations-grid {
        grid-template-columns: 1fr;
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
      .footer-content {
        grid-template-columns: 1fr;
      }
      
      .contact-form {
        padding: 30px 20px;
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

  <!-- Page Header -->
  <section class="page-header">
    <div class="container">
      <h1>Contact Us</h1>
      <p>Have questions about VoluniFy? Our team is here to help. Reach out to us through any of the methods below.</p>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="contact-section">
    <div class="container">
      <div class="contact-container">
        <div class="contact-info">
          <h2>Get in Touch</h2>
          <div class="contact-info-item">
            <div class="contact-icon">📍</div>
            <div class="contact-details">
              <h3>Our Address</h3>
              <p>123 Volunteer Way, Suite 200<br>San Francisco, CA 94107</p>
            </div>
          </div>
          <div class="contact-info-item">
            <div class="contact-icon">📱</div>
            <div class="contact-details">
              <h3>Phone</h3>
              <p>+1 (800) 123-4567</p>
            </div>
          </div>
          <div class="contact-info-item">
            <div class="contact-icon">✉️</div>
            <div class="contact-details">
              <h3>Email</h3>
              <p>support@volunify.com</p>
            </div>
          </div>
          <div class="contact-info-item">
            <div class="contact-icon">⏰</div>
            <div class="contact-details">
              <h3>Working Hours</h3>
              <p>Monday - Friday: 9:00 AM - 6:00 PM PST<br>Saturday: 10:00 AM - 2:00 PM PST</p>
            </div>
          </div>
          <div class="social-links">
            <h3>Follow Us</h3>
            <div class="social-icons">
              <a href="#" class="social-icon">f</a>
              <a href="#" class="social-icon">in</a>
              <a href="#" class="social-icon">tw</a>
              <a href="#" class="social-icon">ig</a>
            </div>
          </div>
        </div>
        <div class="contact-form">
          <h2>Send Us a Message</h2>
          <form action="${pageContext.request.contextPath}/submitcontact" method="post">
            <div class="form-group">
              <label for="name">Full Name</label>
              <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
              <label for="email">Email Address</label>
              <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
              <label for="phone">Phone Number</label>
              <input type="tel" class="form-control" id="phone" name="phone">
            </div>
            <div class="form-group">
              <label for="subject">Subject</label>
              <input type="text" class="form-control" id="subject" name="subject" required>
            </div>
            <div class="form-group">
              <label for="message">Message</label>
              <textarea class="form-control" id="message" name="message" required></textarea>
            </div>
            <button type="submit" class="btn btn-secondary">Send Message</button>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQ Section -->
  <section class="faq-section">
    <div class="container">
      <h2>Frequently Asked Questions</h2>
      <div class="faq-container">
        <div class="faq-item">
          <div class="faq-question">How can I schedule a demo of VoluniFy?</div>
          <div class="faq-answer">You can schedule a demo by clicking the "Schedule a Demo" button on our homepage or by contacting our sales team directly at sales@volunify.com. We'll set up a time that works for you to walk through our platform.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Is there a free trial available?</div>
          <div class="faq-answer">Yes! We offer a 14-day free trial with full access to all features. No credit card is required to start your trial. Simply sign up on our website to get started.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Do you offer discounts for small nonprofits?</div>
          <div class="faq-answer">We do offer special pricing for small nonprofits with limited budgets. Please contact our sales team to discuss your organization's needs and learn about our nonprofit discount program.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">How long does implementation typically take?</div>
          <div class="faq-answer">Most organizations are up and running with VoluniFy within 1-2 weeks. Our customer success team provides personalized onboarding assistance to ensure a smooth transition.</div>
        </div>
        <div class="faq-item">
          <div class="faq-question">Can I import volunteer data from our current system?</div>
          <div class="faq-answer">Yes, VoluniFy makes it easy to import your existing volunteer database. We support imports from Excel, CSV, and several popular volunteer management platforms.</div>
        </div>
      </div>
    </div>
  </section>

  <!-- Office Locations -->
  <section class="locations-section">
    <div class="container">
      <h2>Our Offices</h2>
      <div class="locations-grid">
        <div class="location-card">
          <div class="location-icon">🏙️</div>
          <h3>San Francisco</h3>
          <p>123 Volunteer Way, Suite 200<br>San Francisco, CA 94107<br>United States</p>
          <a href="#" class="btn btn-outline">View on Map</a>
        </div>
        <div class="location-card">
          <div class="location-icon">🏙️</div>
          <h3>New York</h3>
          <p>456 Community Ave, 5th Floor<br>New York, NY 10013<br>United States</p>
          <a href="#" class="btn btn-outline">View on Map</a>
        </div>
        <div class="location-card">
          <div class="location-icon">🏙️</div>
          <h3>London</h3>
          <p>78 Charity Lane<br>London, EC1V 4PW<br>United Kingdom</p>
          <a href="#" class="btn btn-outline">View on Map</a>
        </div>
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
        <p>&copy; 2025 VoluniFy. All rights reserved.</p>
      </div>
    </div>
  </footer>
</body>
</html>