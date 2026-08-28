import { Link } from "react-router-dom";
import { Icon } from "@iconify/react";
import logoNew from "@/assets/logo-newa.png";

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
              <Link to="/" className="flex items-center group">
                <img
                  src={logoNew}
                  alt="Zacca"
                  className="h-10 sm:h-11 lg:h-12 w-auto object-contain transition-all duration-300 group-hover:opacity-80"
                />
              </Link>
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
                { icon: "lucide:facebook", href: "#", label: "Facebook" },
                { icon: "lucide:twitter", href: "#", label: "X (Twitter)" },
                { icon: "lucide:instagram", href: "#", label: "Instagram" },
                { icon: "lucide:youtube", href: "#", label: "YouTube" },
                { icon: "lucide:linkedin", href: "#", label: "LinkedIn" }
              ].map(({ icon, href, label }) => (
                <a
                  key={label}
                  href={href}
                  aria-label={label}
                  className="w-10 h-10 rounded-full bg-white flex items-center justify-center text-[#4a2dd4] hover:bg-white/90 transition-colors"
                >
                  <Icon icon={icon} className="w-5 h-5" />
                </a>
              ))}
            </div>
          </div>
        </div>

        {/* Middle Section */}
        <div className="flex justify-end mb-12 pb-8 border-b border-white/20">
          {/* Legal Links */}
          <div className="flex flex-col items-end space-y-2">
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
