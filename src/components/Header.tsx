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

  const scrollToHero = () => {
    setIsMenuOpen(false);
    if (location.pathname === "/") {
      document.getElementById("hero")?.scrollIntoView({ behavior: "smooth" });
    } else {
      window.location.href = "/#hero";
    }
  };

  const navLinkStyle = {
    fontFamily: "'Noto Sans Hebrew', 'Inter', sans-serif",
    fontWeight: 400,
    fontSize: "21.3833px",
    lineHeight: "29px",
    color: "#FFFFFF",
  };

  const buttonStyle = {
    fontFamily: "'DM Sans', 'Inter', sans-serif",
    fontWeight: 500,
    fontSize: "21.3833px",
    lineHeight: "28px",
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 px-4 pt-4 lg:pt-6">
      <div className="container mx-auto max-w-[1200px]">
        {/* Desktop: Dark floating bar - Figma Frame 1000005093 */}
        <div
          className="hidden lg:flex flex-row justify-center items-center px-8 py-6 gap-16 rounded-[23px]"
          style={{
            background: "#13151B",
            backdropFilter: "blur(12.4583px)",
          }}
        >
          {/* Logo */}
          <Link to="/" className="flex items-center gap-1.5 flex-shrink-0">
            <img src={zaccaLogo} alt="Zacca.ai" className="h-10 w-auto object-contain" />
            <span
              className="text-white"
              style={{
                fontFamily: "'Noto Sans Hebrew', 'Inter', sans-serif",
                fontWeight: 400,
                fontSize: "25.5487px",
                lineHeight: "35px",
              }}
            >
              Zacca.Ai
            </span>
          </Link>

          {/* Nav links */}
          <nav className="flex items-center gap-12">
            <Link
              to="/"
              className="hover:opacity-80 transition-opacity"
              style={navLinkStyle}
            >
              Platform
            </Link>
            <Link
              to="/#about"
              onClick={(e) => { if (location.pathname === "/") { e.preventDefault(); scrollToAbout(); } }}
              className="hover:opacity-80 transition-opacity"
              style={navLinkStyle}
            >
              About
            </Link>
            <Link
              to="/#solutions"
              onClick={(e) => { if (location.pathname === "/") { e.preventDefault(); scrollToSolutions(); } }}
              className="hover:opacity-80 transition-opacity"
              style={navLinkStyle}
            >
              Solutions
            </Link>
          </nav>

          {/* CTA Buttons */}
          <div className="flex items-center gap-8">
            <button
              onClick={scrollToHero}
              className="px-5 py-2.5 rounded-[16px] text-white hover:opacity-90 transition-opacity"
              style={{ ...buttonStyle, background: "#1F1C1C" }}
            >
              Sign Up
            </button>
            <Link
              to="/#contact"
              onClick={(e) => { if (location.pathname === "/") { e.preventDefault(); scrollToContact(); } }}
              className="px-5 py-2.5 rounded-[16px] text-white hover:opacity-90 transition-opacity"
              style={{ ...buttonStyle, background: "linear-gradient(0deg, #2C14DD, #2C14DD)" }}
            >
              Contact Us
            </Link>
          </div>
        </div>

        {/* Mobile: Simplified header */}
        <div className="flex lg:hidden items-center justify-between py-4 px-4 rounded-2xl" style={{ background: "#13151B" }}>
          <Link to="/" className="flex items-center gap-2">
            <img src={zaccaLogo} alt="Zacca.ai" className="h-8 w-auto" />
            <span className="text-white font-medium" style={{ fontFamily: "'Noto Sans Hebrew', sans-serif" }}>
              Zacca.Ai
            </span>
          </Link>
          <button
            className="p-2 text-white hover:opacity-80"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>

        {/* Mobile menu */}
        {isMenuOpen && (
          <div className="lg:hidden mt-2 rounded-2xl py-4 px-4" style={{ background: "#13151B" }}>
            <div className="flex flex-col gap-3">
              <Link to="/" onClick={() => setIsMenuOpen(false)} className="text-white py-2" style={navLinkStyle}>
                Platform
              </Link>
              <Link to="/#about" onClick={scrollToAbout} className="text-white py-2" style={navLinkStyle}>
                About
              </Link>
              <Link to="/#solutions" onClick={scrollToSolutions} className="text-white py-2" style={navLinkStyle}>
                Solutions
              </Link>
              <button onClick={scrollToHero} className="text-white py-2 text-left" style={{ ...buttonStyle, background: "#1F1C1C", padding: "8px 16px", borderRadius: "16px" }}>
                Sign Up
              </button>
              <Link to="/#contact" onClick={scrollToContact} className="text-white py-2 text-center" style={{ ...buttonStyle, background: "#2C14DD", padding: "8px 16px", borderRadius: "16px" }}>
                Contact Us
              </Link>
            </div>
          </div>
        )}
      </div>
    </header>
  );
};
