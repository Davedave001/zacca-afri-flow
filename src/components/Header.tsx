import { useState } from "react";
import { Link } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Menu, X, ChevronDown } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import dataAnalyticsImage from "@/assets/data-analytics-hero.png.png";
import zaccaLogo from "@/assets/Zacca new.png";

export const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const solutionsItems = [
    {
      title: "Dynamic Credit Scoring",
      description: "AI creates fair credit scores from real-life transactions and business patterns.",
      href: "/solutions/dynamic-credit-scoring",
      isClickable: true
    },
    {
      title: "ManagER.ai",
      description: "Run your business like S&P500 with AI insights, automation, and strategic guidance.",
      href: "/solutions/manager-ai",
      isClickable: true
    },
    {
      title: "Zacca Smart Wallet",
      description: "An AI wallet that works while you sleep, optimizing liquidity and investments.",
      href: "/solutions/zacca-smart-wallet",
      isClickable: true
    },
    {
      title: "LiquiChain DAO",
      description: "Decentralized marketplace connecting lenders with verified borrowers.",
      href: "/solutions/liquichain-dao",
      isClickable: true
    },
    {
      title: "Tokenized Collateral",
      description: "Turn your stock, equipment, and receivables into digital collateral.",
      href: "/solutions/tokenized-collateral",
      isClickable: true
    },
    {
      title: "Analytics-as-a-Service",
      description: "Our data ownership infrastructure will enable us to offer data analytics from our suite of services and lab for thought leadership in the industry.",
      href: "/solutions/analytics-as-a-service",
      isClickable: true
    }
  ];

  const navigationItems = [
    { name: "Zacca.ai Platform", href: "/", isHome: true },
    { name: "Solutions", href: "/solutions", hasDropdown: true },
    { name: "Industry", href: "/industry" },
    { name: "About", href: "/about" },
  ];

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

          {/* Desktop Navigation - Left aligned closer to logo */}
          <nav className="hidden lg:flex items-center ml-4 lg:ml-6">
            <ul className="flex items-center gap-6 lg:gap-8">
              {navigationItems.map((item) => (
                <li key={item.name}>
                  {item.hasDropdown ? (
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <button 
                          className="text-base lg:text-lg font-medium text-black hover:text-[#3117ce] transition-colors flex items-center gap-1"
                          style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                        >
                          {item.name}
                          <ChevronDown className="w-3 h-3 lg:w-4 lg:h-4 text-[#3117ce]" />
                        </button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent className="w-screen p-0 bg-white border-0 shadow-lg rounded-none">
                        <div className="w-full bg-gray-50 py-8 lg:py-16 px-4 lg:px-8">
                          <div className="max-w-7xl mx-auto">
                            <div className="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-12">
                              {/* Column 1 - Technology Solutions */}
                              <div className="space-y-8">
                                <div>
                                  <h2 className="text-xl lg:text-2xl font-bold text-gray-900 mb-3 lg:mb-4">
                                    Technology Solutions
                                  </h2>
                                  <p className="text-sm lg:text-base text-gray-600 leading-relaxed">
                                    Zacca.ai offers a full array of advanced solutions engineered for the complete alternative credit lifecycle.
                                  </p>
                                </div>
                              </div>

                              {/* Column 2 - Solutions List (First 3) */}
                              <div className="space-y-6">
                                {solutionsItems.slice(0, 3).map((solution, index) => (
                                  <DropdownMenuItem key={index} className="p-0 focus:bg-transparent">
                                    {solution.isClickable ? (
                                      <Link to={solution.href} className="w-full">
                                        <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-[#3117ce]/20">
                                          <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-[#3117ce] transition-colors">
                                            {solution.title}
                                          </h3>
                                          <p className="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors">
                                            {solution.description}
                                          </p>
                                        </div>
                                      </Link>
                                    ) : (
                                      <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-[#3117ce]/20">
                                        <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-[#3117ce] transition-colors">
                                          {solution.title}
                                        </h3>
                                        <p className="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors">
                                          {solution.description}
                                        </p>
                                      </div>
                                    )}
                                  </DropdownMenuItem>
                                ))}
                              </div>

                              {/* Column 3 - Solutions List (Last 3) */}
                              <div className="space-y-6">
                                {solutionsItems.slice(3, 6).map((solution, index) => (
                                  <DropdownMenuItem key={index + 3} className="p-0 focus:bg-transparent">
                                    {solution.isClickable ? (
                                      <Link to={solution.href} className="w-full">
                                        <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-[#3117ce]/20">
                                          <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-[#3117ce] transition-colors">
                                            {solution.title}
                                          </h3>
                                          <p className="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors">
                                            {solution.description}
                                          </p>
                                        </div>
                                      </Link>
                                    ) : (
                                      <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-[#3117ce]/20">
                                        <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-[#3117ce] transition-colors">
                                          {solution.title}
                                        </h3>
                                        <p className="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors">
                                          {solution.description}
                                        </p>
                                      </div>
                                    )}
                                  </DropdownMenuItem>
                                ))}
                              </div>

                              {/* Column 4 - Image with Text */}
                              <div className="space-y-6">
                                {/* Image */}
                                <div className="w-full h-64 rounded-lg overflow-hidden mb-4 border border-[#3117ce]/20 hover:border-[#3117ce]/40 transition-all duration-300 group">
                                  <img
                                    src={dataAnalyticsImage}
                                    alt="Data Analytics and Credit Scoring Technology"
                                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                                    onError={(e) => {
                                      // Fallback to gradient background if image fails to load
                                      e.currentTarget.style.display = 'none';
                                      e.currentTarget.parentElement.innerHTML = `
                                        <div class="w-full h-full bg-gradient-to-br from-[#3117ce]/20 via-[#3117ce]/20 to-[#3117ce]/10 flex items-center justify-center">
                                          <div class="text-center">
                                            <div class="w-16 h-16 bg-gradient-to-br from-[#3117ce] to-[#3117ce] rounded-full mx-auto mb-3 flex items-center justify-center">
                                              <span class="text-white text-2xl font-bold">AI</span>
                                            </div>
                                            <span class="text-gray-600 text-sm font-medium">Data Analytics</span>
                                          </div>
                                        </div>
                                      `;
                                    }}
                                  />
                                </div>
                                
                                {/* Text Below Image */}
                                <p className="text-gray-700 leading-relaxed font-medium">
                                  Eliminate credit risk assessment friction, increase liquidity, and scale your alternative credit-scoring with a smarter approach to data.
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </DropdownMenuContent>
                    </DropdownMenu>
                  ) : (
                    <Link
                      to={item.href}
                      className={`text-base lg:text-lg font-medium transition-colors ${
                        item.isHome 
                          ? "text-[#3117ce]" 
                          : "text-black hover:text-[#3117ce]"
                      }`}
                      style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                    >
                      {item.name}
                    </Link>
                  )}
                </li>
              ))}
            </ul>
          </nav>

          {/* CTA Link - Right */}
          <div className="hidden lg:flex items-center flex-shrink-0">
            <Link 
              to="/contact" 
              className="text-sm lg:text-base font-medium text-[#3117ce] hover:text-[#3117ce]/80 transition-colors border-b-2 border-[#3117ce] pb-1"
              style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
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
                item.hasDropdown ? (
                  <div key={item.name} className="px-3 sm:px-4">
                    <div className="text-sm sm:text-base font-medium text-black mb-2">
                      {item.name}
                    </div>
                    <div className="ml-4 space-y-2">
                      {solutionsItems.map((solution, index) => (
                        solution.isClickable ? (
                          <Link key={index} to={solution.href} onClick={() => setIsMenuOpen(false)}>
                            <div className="p-3 rounded-lg bg-gray-50 hover:bg-gray-100 transition-colors">
                              <h3 className="font-semibold text-gray-900 mb-1 text-sm">
                                {solution.title}
                              </h3>
                              <p className="text-xs text-gray-600 leading-relaxed">
                                {solution.description}
                              </p>
                            </div>
                          </Link>
                        ) : (
                          <div key={index} className="p-3 rounded-lg bg-gray-50">
                            <h3 className="font-semibold text-gray-900 mb-1 text-sm">
                              {solution.title}
                            </h3>
                            <p className="text-xs text-gray-600 leading-relaxed">
                              {solution.description}
                            </p>
                          </div>
                        )
                      ))}
                    </div>
                  </div>
                ) : (
                  <Link
                    key={item.name}
                    to={item.href}
                    className={`block px-4 py-3 text-base font-medium rounded-lg transition-colors duration-200 ${
                      item.isHome 
                        ? "text-[#3117ce]" 
                        : "text-black hover:text-[#3117ce] hover:bg-gray-50"
                    }`}
                    onClick={() => setIsMenuOpen(false)}
                    style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                  >
                    {item.name}
                  </Link>
                )
              ))}
              <div className="px-3 sm:px-4 pt-2">
                <Link 
                  to="/contact" 
                  onClick={() => setIsMenuOpen(false)} 
                  className="block text-center text-sm sm:text-base font-medium text-[#3117ce] border-b-2 border-[#3117ce] pb-2"
                  style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
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
