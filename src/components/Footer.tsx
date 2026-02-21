import { Link } from "react-router-dom";
import { 
  Twitter, 
  Linkedin, 
  Facebook,
  Instagram,
  Youtube
} from "lucide-react";
import footerLogo from "@/assets/Footer Logo.png";

export const Footer = () => {
  return (
    <footer id="contact" className="relative scroll-mt-20" style={{ backgroundColor: '#4a2dd4' }}>
      <div className="container mx-auto px-4 sm:px-6 py-12 sm:py-16 lg:py-20 relative z-10">
        {/* Top Section */}
        <div className="grid lg:grid-cols-2 gap-8 mb-12">
          {/* Left Side - Logo and Address */}
          <div className="space-y-6">
            {/* Logo */}
            <div>
              <img 
                src={footerLogo} 
                alt="Zacca.ai Logo" 
                className="h-10 lg:h-12 w-auto object-contain"
              />
            </div>
            
            {/* Address */}
            <div 
              className="text-white/90 space-y-1 text-sm lg:text-base"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
            >
              <p>Westlands, Nairobi, Kenya</p>
              <p>P.O. Box 12345-00100</p>
              <p>Nairobi, Kenya</p>
            </div>
          </div>

          {/* Right Side - Social Media Icons */}
          <div className="flex items-start justify-end lg:justify-end">
            <div className="flex gap-3">
              {[
                { icon: Facebook, href: "#", label: "Facebook" },
                { icon: Twitter, href: "#", label: "X (Twitter)" },
                { icon: Instagram, href: "#", label: "Instagram" },
                { icon: Youtube, href: "#", label: "YouTube" },
                { icon: Linkedin, href: "#", label: "LinkedIn" }
              ].map(({ icon: Icon, href, label }) => (
                <a
                  key={label}
                  href={href}
                  aria-label={label}
                  className="w-10 h-10 rounded-full bg-white flex items-center justify-center text-[#4a2dd4] hover:bg-white/90 transition-colors"
                >
                  <Icon className="w-5 h-5" />
                </a>
              ))}
            </div>
          </div>
        </div>

        {/* Middle Section */}
        <div className="grid lg:grid-cols-2 gap-8 mb-12 pb-8 border-b border-white/20">
          {/* Left Side - App Download */}
          <div className="space-y-4">
            <h3 
              className="text-white text-lg lg:text-xl font-semibold"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
            >
              Download the app
            </h3>
            <div className="flex flex-col sm:flex-row gap-4">
              <button className="flex items-center justify-center gap-3 px-6 py-3 bg-white hover:bg-gray-50 text-gray-900 rounded-lg transition-colors">
                <svg className="w-6 h-6" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,12L6.05,2.66Z"/>
                </svg>
                <span 
                  className="text-sm font-medium"
                  style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                >
                  Google Play
                </span>
              </button>
              
              <button className="flex items-center justify-center gap-3 px-6 py-3 bg-gray-800 hover:bg-gray-700 text-white rounded-lg transition-colors">
                <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M17.05 20.28c-.98.95-2.05.88-3.08.4-1.09-.5-2.08-.48-3.24 0-1.44.62-2.2.44-3.06-.4C1.79 15.25 2.51 7.59 9.05 7.31c1.35.07 2.29.74 3.08.8 1.18-.24 2.31-.93 3.57-.84 1.51.12 2.65.72 3.4 1.8-3.12 1.87-2.38 5.98.48 7.13-.57 1.5-1.31 2.99-2.54 4.09l.01-.01zM12.03 7.25c-.15-2.23 1.66-4.07 3.74-4.25.29 2.58-2.34 4.5-3.74 4.25z"/>
                </svg>
                <span 
                  className="text-sm font-medium"
                  style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                >
                  App Store
                </span>
              </button>
            </div>
          </div>

          {/* Right Side - Legal Links */}
          <div className="flex flex-col lg:items-end space-y-2">
            <Link 
              to="#privacy" 
              className="text-white/90 hover:text-white transition-colors text-sm lg:text-base"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
            >
              Privacy notices
            </Link>
            <Link 
              to="#terms" 
              className="text-white/90 hover:text-white transition-colors text-sm lg:text-base"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
            >
              Terms and Conditions
            </Link>
            <Link 
              to="#regulatory" 
              className="text-white/90 hover:text-white transition-colors text-sm lg:text-base"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
            >
              Regulatory Information
            </Link>
            <Link 
              to="#compliance" 
              className="text-white/90 hover:text-white transition-colors text-sm lg:text-base"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
            >
              Compliance & Licensing
            </Link>
          </div>
        </div>

        {/* Bottom Section */}
        <div className="relative">
          <p 
            className="text-white/80 text-xs lg:text-sm leading-relaxed max-w-4xl"
            style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
          >
            Zacca.ai, a financial technology company operating in Kenya, is subject to the supervision of the Central Bank of Kenya and other relevant regulatory authorities. Zacca.ai ©. All rights reserved. Total or partial reproduction of the content of this site is prohibited. *Data obtained from analyses performed by Zacca.ai using AI and machine learning technologies.
          </p>
        </div>
      </div>
    </footer>
  );
};
