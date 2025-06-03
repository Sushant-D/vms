<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VoluniFy - Blog</title>
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

    /* Blog Header */
    .blog-header {
      padding: 150px 0 60px;
      text-align: center;
      background-color: #6A5ACD;
      color: white;
    }
    
    .blog-header h1 {
      font-size: 48px;
      margin-bottom: 20px;
    }
    
    .blog-header p {
      font-size: 18px;
      max-width: 700px;
      margin: 0 auto 30px;
    }

    /* Blog Features */
    .blog-features {
      padding: 50px 0;
      background-color: white;
    }

    .blog-categories {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 15px;
      margin-bottom: 50px;
    }

    .category-tag {
      padding: 8px 16px;
      background-color: #FFFAF5;
      border-radius: 30px;
      font-size: 14px;
      font-weight: 500;
      color: #6A5ACD;
      cursor: pointer;
      transition: all 0.3s;
    }

    .category-tag:hover, .category-tag.active {
      background-color: #6A5ACD;
      color: white;
    }

    /* Featured Posts */
    .featured-post {
      display: flex;
      margin-bottom: 60px;
      background-color: #FFFAF5;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    .featured-image {
      flex: 1;
      min-height: 400px;
      background-color: #eee;
    }

    .featured-content {
      flex: 1;
      padding: 40px;
    }

    .post-meta {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
      font-size: 14px;
      color: #666;
    }

    .post-category {
      color: #6A5ACD;
      font-weight: 600;
      margin-right: 15px;
    }

    .post-date {
      color: #999;
    }

    .featured-content h2 {
      font-size: 28px;
      margin-bottom: 15px;
      color: #333;
    }

    .featured-content p {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
      margin-bottom: 20px;
    }

    /* Blog Posts Grid */
    .blog-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
    }

    .blog-card {
      background-color: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      transition: transform 0.3s;
    }

    .blog-card:hover {
      transform: translateY(-5px);
    }

    .blog-card-image {
      height: 200px;
      background-color: #eee;
    }

    .blog-card-content {
      padding: 25px;
    }

    .blog-card h3 {
      font-size: 20px;
      margin-bottom: 15px;
      color: #333;
    }

    .blog-card p {
      font-size: 15px;
      color: #666;
      line-height: 1.6;
      margin-bottom: 20px;
    }

    .read-more {
      color: #6A5ACD;
      font-weight: 500;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
    }

    .read-more::after {
      content: "→";
      margin-left: 5px;
      transition: margin-left 0.3s;
    }

    .read-more:hover::after {
      margin-left: 10px;
    }

    /* Newsletter */
    .newsletter {
      padding: 80px 0;
      background-color: #FFFAF5;
      text-align: center;
    }

    .newsletter h2 {
      font-size: 32px;
      margin-bottom: 20px;
      color: #333;
    }

    .newsletter p {
      font-size: 18px;
      color: #666;
      max-width: 600px;
      margin: 0 auto 30px;
    }

    .newsletter-form {
      display: flex;
      max-width: 500px;
      margin: 0 auto;
    }

    .newsletter-form input {
      flex: 1;
      padding: 15px;
      border: 1px solid #ddd;
      border-radius: 30px 0 0 30px;
      font-size: 16px;
    }

    .newsletter-form button {
      padding: 15px 30px;
      background-color: #6A5ACD;
      color: white;
      border: none;
      border-radius: 0 30px 30px 0;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .newsletter-form button:hover {
      background-color: #5849b5;
    }

    /* Pagination */
    .pagination {
      display: flex;
      justify-content: center;
      margin-top: 50px;
    }

    .pagination-item {
      width: 40px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 5px;
      border-radius: 50%;
      background-color: white;
      color: #333;
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s;
      border: 1px solid #ddd;
    }

    .pagination-item:hover, .pagination-item.active {
      background-color: #6A5ACD;
      color: white;
      border-color: #6A5ACD;
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
      .featured-post {
        flex-direction: column;
      }
      
      .blog-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      
      .footer-content {
        grid-template-columns: 1fr 1fr;
      }
    }
    
    @media (max-width: 768px) {
      .blog-grid {
        grid-template-columns: 1fr;
      }
      
      .newsletter-form {
        flex-direction: column;
      }
      
      .newsletter-form input {
        border-radius: 30px;
        margin-bottom: 10px;
      }
      
      .newsletter-form button {
        border-radius: 30px;
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
          <li><a href="${pageContext.request.contextPath}/volunteers">Volunteers</a></li>
          <li><a href="${pageContext.request.contextPath}/pricing">Pricing</a></li>
          <li><a href="${pageContext.request.contextPath}/blog" class="active">Blog</a></li>
        </ul>
        <div class="auth-buttons">
          <a href="${pageContext.request.contextPath}/login" class="btn btn-outline">Log In</a>
          <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Sign Up</a>
        </div>
      </nav>
    </div>
  </header>


  <section class="blog-header">
    <div class="container">
      <h1>VoluniFy Blog</h1>
      <p>Insights, tips, and success stories to help you maximize volunteer engagement and impact</p>
    </div>
  </section>


  <section class="blog-features">
    <div class="container">
      <div class="blog-categories">
        <div class="category-tag active">All Posts</div>
        <div class="category-tag">Volunteer Management</div>
        <div class="category-tag">Recruitment</div>
        <div class="category-tag">Retention</div>
        <div class="category-tag">Impact Measurement</div>
        <div class="category-tag">Best Practices</div>
        <div class="category-tag">Success Stories</div>
      </div>
      
     
      <div class="featured-post">
        <div class="featured-image">
          <img src="/api/placeholder/600/400" alt="Featured Blog Post">
        </div>
        <div class="featured-content">
          <div class="post-meta">
            <span class="post-category">Volunteer Management</span>
            <span class="post-date">May 2, 2025</span>
          </div>
          <h2>5 Strategies to Boost Volunteer Retention in 2025</h2>
          <p>Volunteer retention is crucial for maintaining a sustainable volunteer program. Research shows that organizations spend five times more resources recruiting new volunteers than retaining existing ones. This comprehensive guide explores proven strategies to keep your volunteers engaged, satisfied, and committed to your cause long-term.</p>
          <p>We'll dive into creating meaningful recognition programs, building community among volunteers, providing professional development opportunities, and gathering actionable feedback.</p>
          <a href="#" class="btn btn-primary">Read Full Article</a>
        </div>
      </div>
      
    
      <div class="blog-grid">
       
        <div class="blog-card">
          <div class="blog-card-image">
            <img src="/api/placeholder/400/200" alt="Blog Post">
          </div>
          <div class="blog-card-content">
            <div class="post-meta">
              <span class="post-category">Recruitment</span>
              <span class="post-date">April 28, 2025</span>
            </div>
            <h3>How to Create Compelling Volunteer Opportunity Descriptions</h3>
            <p>Learn how to craft volunteer role descriptions that attract qualified candidates and clearly communicate expectations.</p>
            <a href="#" class="read-more">Read More</a>
          </div>
        </div>
        
        <!-- Blog Card 2 -->
        <div class="blog-card">
          <div class="blog-card-image">
            <img src="/api/placeholder/400/200" alt="Blog Post">
          </div>
          <div class="blog-card-content">
            <div class="post-meta">
              <span class="post-category">Impact Measurement</span>
              <span class="post-date">April 25, 2025</span>
            </div>
            <h3>Measuring Volunteer Impact: Beyond Hours Served</h3>
            <p>Discover meaningful metrics and frameworks to accurately capture and communicate the true impact of your volunteer program.</p>
            <a href="#" class="read-more">Read More</a>
          </div>
        </div>
        
        <!-- Blog Card 3 -->
        <div class="blog-card">
          <div class="blog-card-image">
            <img src="/api/placeholder/400/200" alt="Blog Post">
          </div>
          <div class="blog-card-content">
            <div class="post-meta">
              <span class="post-category">Best Practices</span>
              <span class="post-date">April 21, 2025</span>
            </div>
            <h3>Digital Onboarding for Volunteers: A Step-by-Step Guide</h3>
            <p>Learn how to create an efficient and engaging digital onboarding process that prepares volunteers for success.</p>
            <a href="#" class="read-more">Read More</a>
          </div>
        </div>
        
        <!-- Blog Card 4 -->
        <div class="blog-card">
          <div class="blog-card-image">
            <img src="/api/placeholder/400/200" alt="Blog Post">
          </div>
          <div class="blog-card-content">
            <div class="post-meta">
              <span class="post-category">Success Stories</span>
              <span class="post-date">April 18, 2025</span>
            </div>
            <h3>How City Food Bank Increased Volunteer Engagement by 75%</h3>
            <p>An inspiring case study showing how one organization transformed their volunteer program with strategic changes.</p>
            <a href="#" class="read-more">Read More</a>
          </div>
        </div>
        
        <!-- Blog Card 5 -->
        <div class="blog-card">
          <div class="blog-card-image">
            <img src="/api/placeholder/400/200" alt="Blog Post">
          </div>
          <div class="blog-card-content">
            <div class="post-meta">
              <span class="post-category">Retention</span>
              <span class="post-date">April 15, 2025</span>
            </div>
            <h3>Recognition Programs That Work: Celebrating Volunteer Contributions</h3>
            <p>Explore effective recognition strategies that make volunteers feel valued and motivated to continue their service.</p>
            <a href="#" class="read-more">Read More</a>
          </div>
        </div>
        
        <!-- Blog Card 6 -->
        <div class="blog-card">
          <div class="blog-card-image">
            <img src="/api/placeholder/400/200" alt="Blog Post">
          </div>
          <div class="blog-card-content">
            <div class="post-meta">
              <span class="post-category">Volunteer Management</span>
              <span class="post-date">April 12, 2025</span>
            </div>
            <h3>Building an Inclusive Volunteer Program: Best Practices</h3>
            <p>Learn strategies to create a diverse and inclusive environment where all volunteers can thrive and contribute meaningfully.</p>
            <a href="#" class="read-more">Read More</a>
          </div>
        </div>
      </div>
      
      <!-- Pagination -->
      <div class="pagination">
        <a href="#" class="pagination-item">1</a>
        <a href="#" class="pagination-item">2</a>
        <a href="#" class="pagination-item">3</a>
        <a href="#" class="pagination-item">4</a>
        <a href="#" class="pagination-item">→</a>
      </div>
    </div>
  </section>

  <!-- Newsletter -->
  <section class="newsletter">
    <div class="container">
      <h2>Subscribe to Our Newsletter</h2>
      <p>Get the latest volunteer management insights, tips, and resources delivered directly to your inbox</p>
      <form class="newsletter-form">
        <input type="email" placeholder="Your email address">
        <button type="submit">Subscribe</button>
      </form>
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