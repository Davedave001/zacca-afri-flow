import { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import { Menu, X } from "lucide-react";
import zaccaLogo from "@/assets/Zacca new.png";

export const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const location = useLocation();

  const scrollToSolutions = () => {
    setIsMenuOpen(false);
    if (location.pathname === "/") {
      document.getElementById("solutions")?.scrollIntoView({ behavior: "smooth" });
    }
  };

  const scrollToAbout = () => {
    setIsMenuOpen(false);
    if (location.pathname === "/") {
      document.getElementById("about")?.scrollIntoView({ behavior: "smooth" });
    }
  };

  const scrollToContact = () => {
    setIsMenuOpen(false);
    if (location.pathname === "/") {
      document.getElementById("contact")?.scrollIntoView({ behavior: "smooth" });
    }
  };

  const navigationItems = [
    { name: "Zacca.ai Platform", href: "/", isHome: true },
    { name: "About", href: "/#about", isAbout: true },
    { name: "Solutions", href: "/#solutions", isSolutions: true },
  ];

  const fontStyle = {
    fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif,
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-white border-b border-gray-200">
      <div className="container mx-auto px-4 sm:px-6">
        <div className="flex items-center justify-between h-16 sm:h-18">
          {/* Logo - Left */}
          <div className="flex items-center flex-shrink-0 pl-6 lg:pl-8">
            <Link to="/" className="flex items-center group">
              <img
                src={zaccaLogo}
                alt="Zacca.ai Logo"
                className="h-12 sm:h-14 lg:h-16 w-auto object-contain transition-all duration-300 group-hover:opacity-80"
              />
            </Link>
          </div>

          {/* Desktop Navigation */}
          <nav className="hidden lg:flex items-center ml-4 lg:ml-6">
            <ul className="flex items-center gap-6 lg:gap-8">
              {navigationItems.map((item) => (
                <li key={item.name}>
                  <Link
                    to={item.href}
                    onClick={
                      item.isSolutions ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToSolutions(); } } :
                      item.isAbout ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToAbout(); } } : undefined
                    }
                    className={`text-base lg:text-lg font-medium transition-colors ${
                      item.isHome ? "text-[#3117ce]" : "text-black hover:text-[#3117ce]"
                    }`}
                    style={fontStyle}
                  >
                    {item.name}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          {/* CTA Link - Right */}
          <div className="hidden lg:flex items-center flex-shrink-0">
            <Link
              to="/#contact"
              onClick={(e) => { if (location.pathname === "/") { e.preventDefault(); scrollToContact(); } }}
              className="text-sm lg:text-base font-medium text-[#3117ce] hover:text-[#3117ce]/80 transition-colors border-b-2 border-[#3117ce] pb-1"
              style={fontStyle}
            >
              Contact Us
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <button
            className="lg:hidden p-2 rounded-lg text-black hover:text-[#3117ce] hover:bg-gray-100 transition-colors"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? <X className="w-5 h-5 sm:w-6 sm:h-6" /> : <Menu className="w-5 h-5 sm:w-6 sm:h-6" />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="lg:hidden border-t border-gray-200 bg-white">
            <div className="py-3 sm:py-4 space-y-2 sm:space-y-3">
              {navigationItems.map((item) => (
                <Link
                  key={item.name}
                  to={item.href}
                  onClick={item.isSolutions ? scrollToSolutions : item.isAbout ? scrollToAbout : () => setIsMenuOpen(false)}
                  className={`block px-4 py-3 text-base font-medium rounded-lg transition-colors duration-200 ${
                    item.isHome ? "text-[#3117ce]" : "text-black hover:text-[#3117ce] hover:bg-gray-50"
                  }`}
                  style={fontStyle}
                >
                  {item.name}
                </Link>
              ))}
              <div className="px-3 sm:px-4 pt-2">
                <Link
                  to="/#contact"
                  onClick={scrollToContact}
                  className="block text-center text-sm sm:text-base font-medium text-[#3117ce] border-b-2 border-[#3117ce] pb-2"
                  style={fontStyle}
                >
                  Contact Us
                </Link>
              </div>
            </div>
          </div>
        )}
      </div>
    </header>
  );
};
