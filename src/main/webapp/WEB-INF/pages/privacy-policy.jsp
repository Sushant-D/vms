<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Privacy Policy - VoluniFy</title>
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
      max-width: 700px;
      margin: 0 auto;
      line-height: 1.6;
    }
    
    /* Privacy Policy Content */
    .policy-content {
      padding: 60px 0;
      background-color: #FFFAF5;
    }
    
    .policy-container {
      background-color: white;
      border-radius: 10px;
      padding: 40px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      max-width: 900px;
      margin: 0 auto;
    }
    
    .last-updated {
      font-size: 14px;
      color: #666;
      margin-bottom: 30px;
      text-align: right;
    }
    
    .policy-section {
      margin-bottom: 40px;
    }
    
    .policy-section h2 {
      font-size: 28px;
      margin-bottom: 20px;
      color: #333;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .policy-section h3 {
      font-size: 22px;
      margin: 25px 0 15px;
      color: #333;
    }
    
    .policy-section p, .policy-section li {
      font-size: 16px;
      color: #666;
      line-height: 1.7;
      margin-bottom: 15px;
    }
    
    .policy-section ul, .policy-section ol {
      margin-left: 20px;
      margin-bottom: 20px;
    }
    
    .policy-section li {
      margin-bottom: 10px;
    }
    
    .policy-section a {
      color: #6A5ACD;
      text-decoration: none;
    }
    
    .policy-section a:hover {
      text-decoration: underline;
    }
    
    .table-of-contents {
      background-color: #f9f6ff;
      padding: 20px 30px;
      border-radius: 8px;
      margin-bottom: 30px;
    }
    
    .table-of-contents h3 {
      font-size: 18px;
      margin-bottom: 15px;
      color: #333;
    }
    
    .table-of-contents ul {
      list-style-type: none;
      margin-left: 0;
    }
    
    .table-of-contents li {
      margin-bottom: 8px;
    }
    
    .table-of-contents a {
      color: #6A5ACD;
      text-decoration: none;
      transition: color 0.3s;
    }
    
    .table-of-contents a:hover {
      color: #FF8C00;
    }
    
    .contact-section {
      background-color: #f9f6ff;
      padding: 30px;
      border-radius: 8px;
      margin-top: 50px;
    }
    
    .contact-section h3 {
      margin-top: 0;
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
    
    /* Print Styles */
    @media print {
      header, footer, .page-header {
        display: none;
      }
      
      .policy-container {
        box-shadow: none;
        padding: 0;
      }
      
      .policy-section h2 {
        page-break-after: avoid;
      }
      
      .policy-section {
        page-break-inside: avoid;
      }
    }
    
    /* Responsive */
    @media (max-width: 992px) {
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
      
      .policy-container {
        padding: 30px;
      }
    }
    
    @media (max-width: 768px) {
      .footer-content {
        grid-template-columns: 1fr;
      }
      
      .policy-container {
        padding: 20px;
      }
      
      .policy-section h2 {
        font-size: 24px;
      }
      
      .policy-section h3 {
        font-size: 20px;
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
      <h1>Privacy Policy</h1>
      <p>At VoluniFy, we take your privacy seriously. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our volunteer management platform.</p>
    </div>
  </section>

  <!-- Privacy Policy Content -->
  <section class="policy-content">
    <div class="container">
      <div class="policy-container">
        <div class="last-updated">Last Updated: May 1, 2025</div>
        
        <div class="table-of-contents">
          <h3>Contents</h3>
          <ul>
            <li><a href="#introduction">1. Introduction</a></li>
            <li><a href="#information-collection">2. Information We Collect</a></li>
            <li><a href="#use-of-information">3. How We Use Your Information</a></li>
            <li><a href="#information-sharing">4. Sharing Your Information</a></li>
            <li><a href="#data-security">5. Data Security</a></li>
            <li><a href="#cookies">6. Cookies and Similar Technologies</a></li>
            <li><a href="#your-choices">7. Your Privacy Choices</a></li>
            <li><a href="#children">8. Children's Privacy</a></li>
            <li><a href="#international">9. International Data Transfers</a></li>
            <li><a href="#changes">10. Changes to This Privacy Policy</a></li>
            <li><a href="#contact">11. Contact Us</a></li>
          </ul>
        </div>
        
        <div id="introduction" class="policy-section">
          <h2>1. Introduction</h2>
          <p>VoluniFy ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website at www.volunify.com or use our volunteer management platform (collectively, the "Service").</p>
          <p>By accessing or using our Service, you agree to this Privacy Policy. If you do not agree with the terms of this Privacy Policy, please do not access the Service.</p>
          <p>We reserve the right to make changes to this Privacy Policy at any time and for any reason. We will alert you about any changes by updating the "Last Updated" date of this Privacy Policy. You are encouraged to periodically review this Privacy Policy to stay informed of updates.</p>
        </div>
        
        <div id="information-collection" class="policy-section">
          <h2>2. Information We Collect</h2>
          
          <h3>Personal Information</h3>
          <p>We may collect personal information that you voluntarily provide to us when you register for an account, express interest in obtaining information about us or our products and services, participate in activities on the Service, or otherwise contact us. The personal information we collect may include:</p>
          <ul>
            <li>Name, email address, phone number, and mailing address</li>
            <li>Account credentials, such as passwords and password hints</li>
            <li>Profile information, such as profile pictures, skills, interests, and availability</li>
            <li>Volunteer history, hours logged, and impact metrics</li>
            <li>Communications preference information</li>
            <li>Payment information (if applicable)</li>
            <li>Any other information you choose to provide</li>
          </ul>
          
          <h3>Information Automatically Collected</h3>
          <p>When you access the Service, we may automatically collect certain information about your device and usage of the Service, including:</p>
          <ul>
            <li>Device information such as your IP address, browser type, operating system, and device identifier</li>
            <li>Usage data such as pages visited, time spent on pages, links clicked, and actions taken within the Service</li>
            <li>Location information based on your IP address or more precise location if you grant permission</li>
            <li>Information collected through cookies and similar technologies (see "Cookies and Similar Technologies" below)</li>
          </ul>
        </div>
        
        <div id="use-of-information" class="policy-section">
          <h2>3. How We Use Your Information</h2>
          <p>We may use the information we collect for various purposes, including to:</p>
          <ul>
            <li>Provide, maintain, and improve our Service</li>
            <li>Process and fulfill your requests, such as registering for volunteer opportunities</li>
            <li>Create and maintain your account</li>
            <li>Track and manage volunteer hours and activities</li>
            <li>Generate reports and analytics about volunteer impact</li>
            <li>Communicate with you about your account, volunteer opportunities, updates, and other relevant information</li>
            <li>Respond to your inquiries and provide customer support</li>
            <li>Send you technical notices, updates, security alerts, and administrative messages</li>
            <li>Personalize your experience and deliver content relevant to your interests</li>
            <li>Monitor and analyze usage patterns and trends</li>
            <li>Detect, investigate, and prevent fraudulent transactions and other illegal activities</li>
            <li>Protect the rights, property, or safety of our users and others</li>
            <li>Comply with legal obligations</li>
          </ul>
        </div>
        
        <div id="information-sharing" class="policy-section">
          <h2>4. Sharing Your Information</h2>
          <p>We may share your information in the following situations:</p>
          <ul>
            <li><strong>With Organizations:</strong> If you volunteer with or express interest in an organization using our platform, we share your information with that organization as necessary to facilitate your volunteer activities.</li>
            <li><strong>With Service Providers:</strong> We may share your information with third-party vendors, service providers, contractors, or agents who perform services for us or on our behalf.</li>
            <li><strong>For Business Transfers:</strong> We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.</li>
            <li><strong>With Affiliates:</strong> We may share your information with our affiliates, in which case we will require those affiliates to honor this Privacy Policy.</li>
            <li><strong>With Business Partners:</strong> We may share your information with our business partners to offer you certain products, services, or promotions.</li>
            <li><strong>With Your Consent:</strong> We may disclose your personal information for any other purpose with your consent.</li>
            <li><strong>As Required by Law:</strong> We may disclose your information when we believe disclosure is appropriate to comply with the law, to enforce our agreements, or to protect the rights, property, or safety of VoluniFy, our users, or others.</li>
          </ul>
        </div>
        
        <div id="data-security" class="policy-section">
          <h2>5. Data Security</h2>
          <p>We implement appropriate technical and organizational security measures designed to protect the security of any personal information we process. However, despite our safeguards, no security system is impenetrable. We cannot guarantee the security of our databases, nor can we guarantee that the information you supply will not be intercepted while being transmitted to us over the Internet.</p>
          <p>We retain personal information only for as long as necessary to fulfill the purposes for which it was collected, including for the purposes of satisfying any legal, accounting, or reporting requirements, to establish or defend legal claims, or for fraud prevention purposes.</p>
        </div>
        
        <div id="cookies" class="policy-section">
          <h2>6. Cookies and Similar Technologies</h2>
          <p>We may use cookies, web beacons, tracking pixels, and other tracking technologies on the Service to help customize the Service and improve your experience. When you access the Service, your personal information is not collected through the use of tracking technology. Most browsers are set to accept cookies by default. You can remove or reject cookies, but be aware that such action could affect the availability and functionality of the Service.</p>
          <p>We may use the following types of cookies:</p>
          <ul>
            <li><strong>Essential Cookies:</strong> These cookies are necessary for the website to function and cannot be switched off in our systems.</li>
            <li><strong>Performance Cookies:</strong> These cookies allow us to count visits and traffic sources so we can measure and improve the performance of our site.</li>
            <li><strong>Functional Cookies:</strong> These cookies enable the website to provide enhanced functionality and personalization.</li>
            <li><strong>Targeting Cookies:</strong> These cookies may be set through our site by our advertising partners.</li>
          </ul>
        </div>
        
        <div id="your-choices" class="policy-section">
          <h2>7. Your Privacy Choices</h2>
          <p>You have certain rights regarding your personal information. These may include:</p>
          <ul>
            <li><strong>Access and Update:</strong> You can review and change your personal information by logging into your account settings.</li>
            <li><strong>Opt-Out:</strong> You can opt-out of receiving our marketing communications by following the unsubscribe instructions included in such communications.</li>
            <li><strong>Cookies:</strong> Most web browsers are set to accept cookies by default. You can usually choose to set your browser to remove or reject cookies.</li>
            <li><strong>Do Not Track:</strong> We do not currently respond to Do Not Track signals.</li>
          </ul>
          
          <h3>Your Rights Under GDPR (for European Users)</h3>
          <p>If you are a resident of the European Economic Area (EEA), you have certain data protection rights. VoluniFy aims to take reasonable steps to allow you to correct, amend, delete, or limit the use of your personal information. If you wish to be informed what personal information we hold about you and if you want it to be removed from our systems, please contact us.</p>
          <p>In certain circumstances, you have the following data protection rights:</p>
          <ul>
            <li>The right to access, update, or delete the personal information we have on you</li>
            <li>The right of rectification</li>
            <li>The right to object</li>
            <li>The right of restriction</li>
            <li>The right to data portability</li>
            <li>The right to withdraw consent</li>
          </ul>
          
          <h3>Your Rights Under CCPA (for California Residents)</h3>
          <p>If you are a California resident, you have specific rights regarding access to your personal information. California Civil Code Section 1798.83 permits California residents to request information about our disclosure of personal information to third parties for their direct marketing purposes. To make such a request, please contact us using the information provided below.</p>
        </div>
        
        <div id="children" class="policy-section">
          <h2>8. Children's Privacy</h2>
          <p>The Service is not directed to children under 13 years of age, and we do not knowingly collect personal information from children under 13. If we learn we have collected or received personal information from a child under 13 without verification of parental consent, we will delete that information. If you believe we might have any information from or about a child under 13, please contact us immediately.</p>
        </div>
        
        <div id="international" class="policy-section">
          <h2>9. International Data Transfers</h2>
          <p>We are based in the United States and the information we collect is governed by U.S. law. If you are accessing the Service from outside the United States, please be aware that information collected through the Service may be transferred to, processed, stored, and used in the United States and other jurisdictions. Your use of the Service or provision of any information constitutes your consent to the transfer, processing, usage, sharing, and storage of your information in the United States and other jurisdictions, which may have different data protection laws than those in your country.</p>
        </div>
        
        <div id="changes" class="policy-section">
          <h2>10. Changes to This Privacy Policy</h2>
          <p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date at the top of this Privacy Policy. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>
        </div>
        
        <div id="contact" class="policy-section">
          <h2>11. Contact Us</h2>
          <p>If you have any questions about this Privacy Policy, please contact us at:</p>
          
          <div class="contact-section">
            <h3>VoluniFy Privacy Team</h3>
            <p>Email: privacy@volunify.com</p>
            <p>Phone: +1 (800) 123-4567</p>
            <p>Address: 123 Volunteer Way, Suite 200, San Francisco, CA 94107</p>
          </div>
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
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/privacy-policy" class="active">Privacy Policy</a></li>
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