import { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import { Icon } from "@iconify/react";
import logoNew from "@/assets/logo-newa.png";

/** Header - Figma design: dark blue bar, Euclid font */
export const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const location = useLocation();
  const hash = location.hash || "";

  const scrollToSection = (sectionId: string) => {
    setIsMenuOpen(false);
    if (location.pathname === "/") {
      window.history.replaceState(null, "", `/#${sectionId}`);
      document.getElementById(sectionId)?.scrollIntoView({ behavior: "smooth" });
    }
  };

  const navigationItems = [
    { name: "Zacca.ai Platform", href: "/", isHome: true },
    { name: "About", href: "/#about", isAbout: true },
    { name: "Solutions", href: "/#solutions", isSolutions: true },
    { name: "Contact Us", href: "/#contact", isContact: true },
  ];

  const socialLinks = [
    { icon: "lucide:linkedin", href: "#", label: "LinkedIn" },
    { icon: "lucide:facebook", href: "#", label: "Facebook" },
  ];

  const fontStyle = {
    fontFamily: "Euclid Circular B, Inter, -apple-system, BlinkMacSystemFont, sans-serif",
    fontWeight: 400,
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 flex flex-col bg-white">
      {/* Main row: logo | blue nav | social icons */}
      <div className="flex h-16 relative items-stretch">
      {/* Left: Logo section */}
      <div className="flex-shrink-0 w-36 sm:w-44 lg:w-[260px] h-full flex items-center pl-4 lg:pl-6">
        <Link to="/" className="flex items-center group">
          <img
            src={logoNew}
            alt="Zacca"
            className="h-8 sm:h-9 lg:h-10 w-auto object-contain transition-all duration-300 group-hover:opacity-80"
          />
        </Link>
      </div>

      {/* Center: Nav section - no background, black text, blue when active */}
      <div className="flex-1 min-w-0 flex items-center justify-center px-4 lg:px-8 py-2 my-2 mr-6 lg:mr-10 rounded-sm">
        <div className="hidden lg:flex items-center gap-6 xl:gap-8">
          {navigationItems.map((item) => {
            const isActive =
              (item.isHome && location.pathname === "/" && !hash) ||
              (item.isAbout && hash === "#about") ||
              (item.isSolutions && hash === "#solutions") ||
              (item.isContact && hash === "#contact");
            return (
              <Link
                key={item.name}
                to={item.href}
                onClick={
                  item.isSolutions ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToSection("solutions"); } } :
                  item.isAbout ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToSection("about"); } } :
                  item.isContact ? (e) => { if (location.pathname === "/") { e.preventDefault(); scrollToSection("contact"); } } : undefined
                }
                className={`text-base lg:text-lg font-normal transition-all duration-200 pb-0.5 border-b-2 ${
                  isActive ? "text-[#2c14dd] border-[#2c14dd]" : "text-black border-transparent hover:text-black/80"
                }`}
                style={fontStyle}
              >
                {item.name}
              </Link>
            );
          })}
        </div>

        {/* Mobile Menu Button */}
        <button
          className="lg:hidden p-2 rounded-lg text-black hover:text-black/80 hover:bg-black/5 transition-colors"
          onClick={() => setIsMenuOpen(!isMenuOpen)}
        >
          {isMenuOpen ? <Icon icon="lucide:x" className="w-5 h-5 sm:w-6 sm:h-6" /> : <Icon icon="lucide:menu" className="w-5 h-5 sm:w-6 sm:h-6" />}
        </button>
      </div>

      {/* Right: Login + social icons */}
      <div className="hidden lg:flex flex-shrink-0 items-center gap-4 pr-4 lg:pr-6">
        <Link
          to="/login"
          className="px-4 py-1.5 rounded-full border border-[#2c14dd] text-[#2c14dd] text-sm font-medium hover:bg-[#2c14dd]/10 transition-colors"
          style={fontStyle}
        >
          Log In
        </Link>
        <div className="flex items-center gap-2">
        {socialLinks.map(({ icon, href, label }) => (
          <a
            key={label}
            href={href}
            aria-label={label}
            className="w-9 h-9 flex items-center justify-center hover:opacity-90 transition-opacity"
            style={{ color: "#2c14dd" }}
          >
            <Icon icon={icon} className="w-4 h-4" />
          </a>
        ))}
        </div>
      </div>
      </div>

      {/* Gap between menu and bottom line */}
      <div className="h-2 bg-white" />

      {/* Thin bottom line */}
      <div className="h-px flex-shrink-0" style={{ backgroundColor: "#2c14dd" }} />

      {/* Mobile Navigation */}
      {isMenuOpen && (
        <div className="lg:hidden absolute top-[73px] left-0 right-0 border-t border-black/10 py-4 bg-white shadow-lg">
            <div className="py-3 sm:py-4 space-y-2 sm:space-y-3">
              {navigationItems.map((item) => {
                const isActive =
                  (item.isHome && location.pathname === "/" && !hash) ||
                  (item.isAbout && hash === "#about") ||
                  (item.isSolutions && hash === "#solutions") ||
                  (item.isContact && hash === "#contact");
                return (
                  <Link
                    key={item.name}
                    to={item.href}
                    onClick={item.isSolutions ? () => scrollToSection("solutions") : item.isAbout ? () => scrollToSection("about") : item.isContact ? () => scrollToSection("contact") : () => setIsMenuOpen(false)}
                    className={`block px-4 py-3 text-base font-normal rounded-lg transition-colors duration-200 w-fit border-b-2 ${
                      isActive ? "text-[#2c14dd] border-[#2c14dd]" : "text-black border-transparent hover:text-[#2c14dd] hover:bg-black/5"
                    }`}
                    style={fontStyle}
                  >
                    {item.name}
                  </Link>
                );
              })}
              <Link
                to="/login"
                onClick={() => setIsMenuOpen(false)}
                className="block mt-2 px-4 py-3 text-base font-medium rounded-lg w-fit border border-[#2c14dd] text-[#2c14dd] hover:bg-[#2c14dd]/10 transition-colors"
                style={fontStyle}
              >
                Log In
              </Link>
            </div>
        </div>
        )}
    </header>
  );
};
