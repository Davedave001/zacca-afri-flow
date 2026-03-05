import { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import { Menu, X } from "lucide-react";
import logoIcon from "@/assets/Logo Icon.png";

/** Header - Figma design: dark blue bar, Euclid font */
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
    fontFamily: "Euclid Circular B, Inter, -apple-system, BlinkMacSystemFont, sans-serif",
    fontWeight: 400,
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 flex flex-col">
      {/* Main row: logo + nav - compact height */}
      <div className="flex h-14 relative">
      {/* Left: White logo section - narrower to extend blue nav further left */}
      <div className="flex-shrink-0 w-36 sm:w-44 lg:w-[260px] h-full bg-white flex items-center pl-4 lg:pl-6">
        <Link to="/" className="flex items-center gap-1 group">
          <img
            src={logoIcon}
            alt=""
            className="h-8 sm:h-9 lg:h-10 w-auto object-contain transition-all duration-300 group-hover:opacity-80"
          />
          <span
            className="text-lg sm:text-xl lg:text-[1.25rem] font-extrabold uppercase tracking-tight transition-opacity duration-300 group-hover:opacity-80"
            style={{ fontFamily: "Euclid Circular B, Inter, -apple-system, BlinkMacSystemFont, sans-serif", color: "#2C14DD", fontWeight: 800 }}
          >
            Zacca
          </span>
        </Link>
      </div>

      {/* Right: Blue nav section (#2C14DD) */}
      <div
        className="flex-1 h-full flex items-center px-3 sm:px-4 lg:px-6 py-0"
        style={{ backgroundColor: "#2C14DD" }}
      >
        {/* Desktop: centered nav with Contact Us on right */}
        <div className="hidden lg:flex flex-1 items-center">
          <div className="flex-1" aria-hidden />
          <nav className="flex items-center gap-4 xl:gap-6">
            {navigationItems.map((item) => (
              <Link
                key={item.name}
                to={item.href}
                onClick={
                  item.isSolutions ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToSolutions(); } } :
                  item.isAbout ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToAbout(); } } : undefined
                }
                className="text-base lg:text-lg font-normal text-white hover:text-white/90 transition-colors"
                style={fontStyle}
              >
                {item.name}
              </Link>
            ))}
          </nav>
          <div className="flex-1 flex justify-end items-center">
            <Link
              to="/#contact"
              onClick={(e) => { if (location.pathname === "/") { e.preventDefault(); scrollToContact(); } }}
              className="text-sm font-normal text-white hover:text-white/90 transition-colors border-b-2 border-white pb-0.5"
              style={fontStyle}
            >
              Contact Us
            </Link>
          </div>
        </div>

        {/* Mobile Menu Button */}
        <button
          className="lg:hidden p-2 rounded-lg text-white hover:text-white/90 hover:bg-white/10 transition-colors"
          onClick={() => setIsMenuOpen(!isMenuOpen)}
        >
          {isMenuOpen ? <X className="w-5 h-5 sm:w-6 sm:h-6" /> : <Menu className="w-5 h-5 sm:w-6 sm:h-6" />}
        </button>
      </div>
      </div>

      {/* White gap between menu and bottom line */}
      <div className="h-2 bg-white" />

      {/* Thin blue bottom line */}
      <div className="h-px bg-[#2C14DD] flex-shrink-0" />

      {/* Mobile Navigation */}
      {isMenuOpen && (
        <div
          className="lg:hidden absolute top-[65px] left-0 right-0 border-t border-[#2C14DD]/30 py-4"
          style={{ backgroundColor: "#2C14DD" }}
        >
            <div className="py-3 sm:py-4 space-y-2 sm:space-y-3">
              {navigationItems.map((item) => (
                <Link
                  key={item.name}
                  to={item.href}
                  onClick={item.isSolutions ? scrollToSolutions : item.isAbout ? scrollToAbout : () => setIsMenuOpen(false)}
                  className="block px-4 py-3 text-base font-normal text-white hover:text-white/90 hover:bg-white/10 rounded-lg transition-colors duration-200"
                  style={fontStyle}
                >
                  {item.name}
                </Link>
              ))}
              <div className="px-3 sm:px-4 pt-2">
                <Link
                  to="/#contact"
                  onClick={scrollToContact}
                  className="block text-center text-sm sm:text-base font-normal text-white border-b-2 border-white pb-2"
                  style={fontStyle}
                >
                  Contact Us
                </Link>
              </div>
            </div>
        </div>
        )}
    </header>
  );
};
