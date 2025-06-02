<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoluniFy - Pricing</title>
  <style>
   
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
      text-align: center;
      background-color: #FFFAF5;
    }
    
    .page-header h1 {
      font-size: 48px;
      margin-bottom: 20px;
      color: #333;
    }
    
    .page-header p {
      font-size: 18px;
      color: #666;
      max-width: 700px;
      margin: 0 auto 30px;
      line-height: 1.6;
    }
    
    /* Pricing Section */
    .pricing-section {
      padding: 80px 0;
      background-color: white;
    }
    
    .pricing-toggle {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-bottom: 50px;
    }
    
    .toggle-text {
      font-size: 18px;
      font-weight: 500;
      margin: 0 15px;
    }
    
    .toggle-switch {
      position: relative;
      display: inline-block;
      width: 60px;
      height: 34px;
    }
    
    .toggle-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }
    
    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: .4s;
      border-radius: 34px;
    }
    
    .slider:before {
      position: absolute;
      content: "";
      height: 26px;
      width: 26px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }
    
    input:checked + .slider {
      background-color: #6A5ACD;
    }
    
    input:checked + .slider:before {
      transform: translateX(26px);
    }
    
    .pricing-cards {
      display: flex;
      justify-content: center;
      gap: 30px;
      margin-top: 30px;
    }
    
    .pricing-card {
      background-color: #FFFAF5;
      border-radius: 10px;
      padding: 40px 30px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      text-align: center;
      width: 350px;
      transition: transform 0.3s, box-shadow 0.3s;
    }
    
    .pricing-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0,0,0,0.1);
    }
    
    .pricing-card.popular {
      border: 2px solid #6A5ACD;
      position: relative;
    }
    
    .popular-badge {
      position: absolute;
      top: -15px;
      left: 50%;
      transform: translateX(-50%);
      background-color: #6A5ACD;
      color: white;
      padding: 5px 15px;
      border-radius: 20px;
      font-size: 14px;
      font-weight: 500;
    }
    
    .pricing-card h3 {
      font-size: 24px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .pricing-price {
      margin-bottom: 30px;
    }
    
    .price {
      font-size: 48px;
      font-weight: bold;
      color: #6A5ACD;
    }
    
    .price-period {
      font-size: 16px;
      color: #666;
    }
    
    .pricing-features {
      margin-bottom: 30px;
      text-align: left;
    }
    
    .feature-item {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
      font-size: 16px;
      color: #666;
    }
    
    .feature-icon {
      margin-right: 10px;
      color: #6A5ACD;
    }
    
    /* FAQ Section */
    .faq-section {
      padding: 80px 0;
      background-color: #FFFAF5;
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
    
    .faq-container {
      max-width: 800px;
      margin: 0 auto;
    }
    
    .faq-item {
      margin-bottom: 20px;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    .faq-question {
      padding: 20px;
      background-color: white;
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: 500;
    }
    
    .faq-answer {
      padding: 0 20px;
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.3s, padding 0.3s;
      background-color: #f9f9f9;
    }
    
    .faq-answer p {
      margin: 20px 0;
      line-height: 1.6;
      color: #666;
    }
    
    .faq-item.active .faq-answer {
      max-height: 500px;
      padding: 0 20px 20px;
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
    
    /* Guarantee Section */
    .guarantee {
      padding: 60px 0;
      text-align: center;
      background-color: white;
    }
    
    .guarantee-content {
      max-width: 700px;
      margin: 0 auto;
      padding: 30px;
      border: 2px dashed #6A5ACD;
      border-radius: 10px;
    }
    
    .guarantee-icon {
      font-size: 48px;
      color: #6A5ACD;
      margin-bottom: 20px;
    }
    
    .guarantee h3 {
      font-size: 24px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .guarantee p {
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
      .pricing-cards {
        flex-direction: column;
        align-items: center;
      }
      
      .pricing-card {
        width: 100%;
        max-width: 400px;
        margin-bottom: 30px;
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
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
          <li><a href="#">Features</a></li>
          <li><a href="#">Nonprofits</a></li>
          <li><a href="#">Volunteers</a></li>
          <li><a href="#">Schools</a></li>
          <li><a href="#">Companies</a></li>
          <li><a href="#">Pricing</a></li>
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
      <h1>Simple, Transparent Pricing</h1>
      <p>Choose the plan that fits your organization's needs. All plans include our core volunteer management features.</p>
    </div>
  </section>

  <!-- Pricing Section -->
  <section class="pricing-section">
    <div class="container">
      <div class="pricing-toggle">
        <span class="toggle-text">Monthly</span>
        <label class="toggle-switch">
          <input type="checkbox" id="billing-toggle">
          <span class="slider"></span>
        </label>
        <span class="toggle-text">Annual (Save 20%)</span>
      </div>
      
      <div class="pricing-cards">
        <div class="pricing-card">
          <h3>Basic</h3>
          <div class="pricing-price">
            <span class="price">$49</span>
            <span class="price-period">/month</span>
          </div>
          <div class="pricing-features">
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Up to 250 volunteers</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Volunteer registration forms</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Event management</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Hour tracking</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Basic reports</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Email notifications</span>
            </div>
          </div>
          <a href="#" class="btn btn-outline">Get Started</a>
        </div>
        
        <div class="pricing-card popular">
          <div class="popular-badge">Most Popular</div>
          <h3>Professional</h3>
          <div class="pricing-price">
            <span class="price">$99</span>
            <span class="price-period">/month</span>
          </div>
          <div class="pricing-features">
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Up to 1,000 volunteers</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Custom registration forms</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Advanced event management</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Hour tracking and approval</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Advanced analytics</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Email and SMS notifications</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Volunteer mobile app</span>
            </div>
          </div>
          <a href="#" class="btn btn-primary">Get Started</a>
        </div>
        
        <div class="pricing-card">
          <h3>Enterprise</h3>
          <div class="pricing-price">
            <span class="price">$199</span>
            <span class="price-period">/month</span>
          </div>
          <div class="pricing-features">
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Unlimited volunteers</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>All Professional features</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>API access</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Custom integrations</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Dedicated account manager</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>Priority support</span>
            </div>
            <div class="feature-item">
              <span class="feature-icon">✓</span>
              <span>White labeling options</span>
            </div>
          </div>
          <a href="#" class="btn btn-outline">Contact Sales</a>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQ Section -->
  <section class="faq-section">
    <div class="container">
      <div class="section-header">
        <h2>Frequently Asked Questions</h2>
        <p>Find answers to common questions about our pricing and plans</p>
      </div>
      
      <div class="faq-container">
        <div class="faq-item">
          <div class="faq-question">
            <span>Can I change plans later?</span>
            <span>+</span>
          </div>
          <div class="faq-answer">
            <p>Yes, you can upgrade or downgrade your plan at any time. When upgrading, you'll be charged the prorated difference immediately. When downgrading, the new rate will apply at the start of your next billing cycle.</p>
          </div>
        </div>
        
        <div class="faq-item">
          <div class="faq-question">
            <span>Is there a free trial available?</span>
            <span>+</span>
          </div>
          <div class="faq-answer">
            <p>Yes, all plans come with a 14-day free trial. No credit card required to start your trial. You can explore all features of the plan you select before making a commitment.</p>
          </div>
        </div>
        
        <div class="faq-item">
          <div class="faq-question">
            <span>Do you offer discounts for nonprofits?</span>
            <span>+</span>
          </div>
          <div class="faq-answer">
            <p>Yes, we offer special nonprofit pricing. Registered 501(c)(3) organizations receive a 15% discount on all plans. Please contact our sales team with proof of your nonprofit status to apply this discount.</p>
          </div>
        </div>
        
        <div class="faq-item">
          <div class="faq-question">
            <span>Can I cancel my subscription anytime?</span>
            <span>+</span>
          </div>
          <div class="faq-answer">
            <p>Yes, you can cancel your subscription at any time. If you cancel, you'll retain access to your plan until the end of your current billing period. We don't offer refunds for partial months of service.</p>
          </div>
        </div>
        
        <div class="faq-item">
          <div class="faq-question">
            <span>What payment methods do you accept?</span>
            <span>+</span>
          </div>
          <div class="faq-answer">
            <p>We accept all major credit cards, including Visa, Mastercard, American Express, and Discover. For Enterprise plans, we can also accommodate invoicing and purchase orders.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Guarantee Section -->
  <section class="guarantee">
    <div class="container">
      <div class="guarantee-content">
        <div class="guarantee-icon">🛡️</div>
        <h3>30-Day Money-Back Guarantee</h3>
        <p>If you're not completely satisfied with VoluniFy within the first 30 days, let us know and we'll refund your payment. No questions asked. We're confident you'll love our platform!</p>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="cta">
    <div class="container">
      <h2>Ready to Transform Your Volunteer Program?</h2>
      <p>Join thousands of organizations already using VoluniFy to recruit, engage, and manage volunteers effectively.</p>
      <div class="hero-buttons">
        <a href="#" class="btn btn-secondary">Get Started Free</a>
        <a href="#" class="btn btn-outline" style="color: white; border-color: white;">Schedule a Demo</a>
      </div>
    </div>
  </section>


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

  <script>
    
    document.querySelectorAll('.faq-question').forEach(question => {
      question.addEventListener('click', () => {
        const item = question.parentNode;
        item.classList.toggle('active');
        
        
        const sign = question.querySelector('span:last-child');
        sign.textContent = item.classList.contains('active') ? '-' : '+';
      });
    });
    
   
    const billingToggle = document.getElementById('billing-toggle');
    const prices = document.querySelectorAll('.price');
    const originalPrices = Array.from(prices).map(price => price.textContent.replace('$', ''));
    
    billingToggle.addEventListener('change', () => {
      if (billingToggle.checked) {
        
        prices.forEach((price, index) => {
          const annualPrice = Math.round(originalPrices[index] * 0.8);
          price.textContent = '$' + annualPrice;
        });
        document.querySelectorAll('.price-period').forEach(period => {
          period.textContent = '/month (billed annually)';
        });
      } else {
        
        prices.forEach((price, index) => {
          price.textContent = '$' + originalPrices[index];
        });
        document.querySelectorAll('.price-period').forEach(period => {
          period.textContent = '/month';
        });
      }
    });
  </script>
</body>
</html>