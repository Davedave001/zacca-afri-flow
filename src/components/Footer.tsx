import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Link } from "react-router-dom";
import { 
  Mail, 
  Phone, 
  MapPin, 
  Twitter, 
  Linkedin, 
  Facebook,
  Instagram,
  ArrowUp,
  Zap
} from "lucide-react";

export const Footer = () => {
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const footerLinks = {
    solutions: [
      { label: "Dynamic Credit Scoring", href: "/solutions/dynamic-credit-scoring" },
      { label: "ManagER.ai", href: "/solutions/manager-ai" },
      { label: "Zacca Smart Wallet", href: "/solutions/zacca-smart-wallet" },
      { label: "LiquiChain DAO", href: "/solutions/liquichain-dao" },
      { label: "Tokenized Collateral", href: "/solutions/tokenized-collateral" },
      { label: "Analytics-as-a-Service", href: "/solutions/analytics-as-a-service" }
    ],
    company: [
      { label: "About Us", href: "/about" },
      { label: "Industry", href: "/industry" },
      { label: "Contact Us", href: "/contact" }
    ],
    support: [
      { label: "Contact Support", href: "/contact" },
      { label: "Help Center", href: "/contact" }
    ],
    legal: [
      { label: "Privacy Policy", href: "#privacy" },
      { label: "Terms of Service", href: "#terms" }
    ]
  };

  return (
    <footer className="relative" style={{ backgroundColor: '#3117ce' }}>
      {/* Subtle gradient overlay */}
      <div className="absolute inset-0 bg-gradient-to-t from-black/10 to-transparent"></div>
      
      <div className="container mx-auto px-4 sm:px-6 py-12 sm:py-16 lg:py-20 relative z-10">
        {/* Main Footer Content */}
        <div className="grid lg:grid-cols-4 gap-8 sm:gap-10 lg:gap-12">
          {/* Company Info */}
          <div className="lg:col-span-2 space-y-6">
            <div>
              <div className="flex items-center gap-3 mb-4">
                {/* Logo Icon */}
                <div className="relative">
                  <div className="w-10 h-10 bg-white/10 backdrop-blur-sm rounded-xl flex items-center justify-center border border-white/20">
                    {/* AI Brain/Neural Network */}
                    <div className="relative">
                      <div className="w-6 h-6 border-2 border-white rounded-full flex items-center justify-center animate-spin" style={{animationDuration: '3s'}}>
                        <div className="w-2 h-2 rounded-full animate-spin" style={{animationDuration: '2s', animationDirection: 'reverse', backgroundColor: '#08f5f8'}}></div>
                      </div>
                      {/* Neural connections */}
                      <div className="absolute -top-1 -right-1 w-2 h-2 bg-white rounded-full opacity-60"></div>
                      <div className="absolute -bottom-1 -left-1 w-2 h-2 bg-white rounded-full opacity-60"></div>
                    </div>
                  </div>
                </div>
                
                {/* Logo Text */}
                <div className="flex flex-col">
                  <span className="text-xl lg:text-2xl font-bold text-white">Zacca.ai</span>
                  <span className="text-xs text-white/70 font-medium -mt-1">Financial OS</span>
                </div>
              </div>
              <p className="text-sm sm:text-base text-white/80 leading-relaxed max-w-md">
                Transforming African finance through AI and blockchain technology. 
                We make credit accessible, fair, and transparent for every business.
              </p>
            </div>

            {/* Contact Info */}
            <div className="space-y-3">
              <div className="flex items-center gap-3 text-white/80">
                <Mail className="w-4 h-4 text-white/90" />
                <span className="text-sm">hello@zacca.ai</span>
              </div>
              <div className="flex items-center gap-3 text-white/80">
                <Phone className="w-4 h-4 text-white/90" />
                <span className="text-sm">+254 700 123 456</span>
              </div>
              <div className="flex items-center gap-3 text-white/80">
                <MapPin className="w-4 h-4 text-white/90" />
                <span className="text-sm">Nairobi, Kenya</span>
              </div>
            </div>

            {/* Social Links */}
            <div className="flex gap-3">
              {[
                { icon: Twitter, href: "#", label: "Twitter" },
                { icon: Linkedin, href: "#", label: "LinkedIn" },
                { icon: Facebook, href: "#", label: "Facebook" },
                { icon: Instagram, href: "#", label: "Instagram" }
              ].map(({ icon: Icon, href, label }) => (
                <Button
                  key={label}
                  variant="outline"
                  size="sm"
                  className="w-10 h-10 p-0 border-white/20 text-white hover:bg-white/10 hover:border-white/30 transition-all duration-200"
                  asChild
                >
                  <a href={href} aria-label={label}>
                    <Icon className="w-4 h-4" />
                  </a>
                </Button>
              ))}
            </div>
          </div>

          {/* Links Columns */}
          <div>
            <h4 className="font-semibold text-white mb-4 text-sm">Solutions</h4>
            <ul className="space-y-3">
              {footerLinks.solutions.map((link) => (
                <li key={link.label}>
                  <Link 
                    to={link.href}
                    className="text-sm text-white/70 hover:text-white transition-colors duration-200"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          <div>
            <h4 className="font-semibold text-white mb-4 text-sm">Company</h4>
            <ul className="space-y-3">
              {footerLinks.company.map((link) => (
                <li key={link.label}>
                  <Link 
                    to={link.href}
                    className="text-sm text-white/70 hover:text-white transition-colors duration-200"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="mt-12 pt-8 border-t border-white/20">
          <div className="flex flex-col sm:flex-row items-center justify-between gap-4">
            <div className="flex flex-col sm:flex-row items-center gap-4 text-sm">
              <p className="text-white/70">
                © 2024 Zacca.ai. All rights reserved.
              </p>
              <div className="flex gap-4">
                {footerLinks.legal.map((link) => (
                  <Link
                    key={link.label}
                    to={link.href}
                    className="text-white/70 hover:text-white transition-colors duration-200 text-sm"
                  >
                    {link.label}
                  </Link>
                ))}
              </div>
            </div>

            <div className="flex items-center gap-4">
              <Badge 
                variant="secondary" 
                className="bg-white/10 text-white border-white/20 text-sm px-3 py-1"
              >
                <div className="w-2 h-2 bg-green-400 rounded-full mr-2 animate-pulse" />
                All systems operational
              </Badge>
              
              <Button
                variant="outline"
                size="sm"
                onClick={scrollToTop}
                className="border-white/20 text-white hover:bg-white/10 hover:border-white/30 w-10 h-10 p-0 transition-all duration-200"
              >
                <ArrowUp className="w-4 h-4" />
              </Button>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};