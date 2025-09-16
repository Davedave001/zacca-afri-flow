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
      href: "#",
      isClickable: false
    },
    {
      title: "Zacca Smart Wallet",
      description: "An AI wallet that works while you sleep, optimizing liquidity and investments.",
      href: "#",
      isClickable: false
    },
    {
      title: "LiquiChain DAO",
      description: "Decentralized marketplace connecting lenders with verified borrowers.",
      href: "#",
      isClickable: false
    },
    {
      title: "Tokenized Collateral",
      description: "Turn your stock, equipment, and receivables into digital collateral.",
      href: "#",
      isClickable: false
    },
    {
      title: "Analytics-as-a-Service",
      description: "Our data ownership infrastructure will enable us to offer data analytics from our suite of services and lab for thought leadership in the industry.",
      href: "#",
      isClickable: false
    }
  ];

  const navigationItems = [
    { name: "Zacca.ai Platform", href: "/", isHome: true },
    { name: "Solutions", href: "/solutions", hasDropdown: true },
    { name: "Industries", href: "/industries" },
    { name: "About", href: "/about" },
  ];

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-sm border-b border-gray-200 shadow-sm">
      <div className="container mx-auto px-6">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <div className="flex items-center">
            <a href="/" className="text-2xl font-bold text-primary">
              Zacca.ai
            </a>
          </div>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center justify-center flex-1 mx-8">
            <div className="flex items-center justify-between w-full max-w-2xl">
              {navigationItems.map((item) => (
                item.hasDropdown ? (
                  <DropdownMenu key={item.name}>
                    <DropdownMenuTrigger asChild>
                      <button className="text-base font-medium px-4 py-2 rounded-lg transition-all duration-200 hover:bg-primary/10 text-gray-700 hover:text-primary flex items-center gap-1">
                        {item.name}
                        <ChevronDown className="w-4 h-4" />
                      </button>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent className="w-screen p-0 bg-white border-0 shadow-lg rounded-none">
                      <div className="w-full bg-gray-50 py-16 px-8">
                        <div className="max-w-7xl mx-auto">
                          <div className="grid grid-cols-4 gap-12">
                            {/* Column 1 - Technology Solutions */}
                            <div className="space-y-8">
                              <div>
                                <h2 className="text-2xl font-bold text-gray-900 mb-4">
                                  Technology Solutions
                                </h2>
                                <p className="text-base text-gray-600 leading-relaxed">
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
                                      <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-primary/20">
                                        <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-primary transition-colors">
                                          {solution.title}
                                        </h3>
                                        <p className="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors">
                                          {solution.description}
                                        </p>
                                      </div>
                                    </Link>
                                  ) : (
                                    <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-primary/20">
                                      <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-primary transition-colors">
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
                                      <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-primary/20">
                                        <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-primary transition-colors">
                                          {solution.title}
                                        </h3>
                                        <p className="text-gray-600 leading-relaxed group-hover:text-gray-700 transition-colors">
                                          {solution.description}
                                        </p>
                                      </div>
                                    </Link>
                                  ) : (
                                    <div className="w-full p-4 rounded-lg hover:bg-white hover:shadow-md transition-all duration-300 cursor-pointer group border border-transparent hover:border-primary/20">
                                      <h3 className="font-bold text-gray-900 mb-2 text-lg group-hover:text-primary transition-colors">
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
                              <div className="w-full h-64 rounded-lg overflow-hidden mb-4 border border-primary/20 hover:border-primary/40 transition-all duration-300 group">
                                <img
                                  src={dataAnalyticsImage}
                                  alt="Data Analytics and Credit Scoring Technology"
                                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                                  onError={(e) => {
                                    // Fallback to gradient background if image fails to load
                                    e.currentTarget.style.display = 'none';
                                    e.currentTarget.parentElement.innerHTML = `
                                      <div class="w-full h-full bg-gradient-to-br from-primary/20 via-accent/20 to-primary/10 flex items-center justify-center">
                                        <div class="text-center">
                                          <div class="w-16 h-16 bg-gradient-to-br from-primary to-accent rounded-full mx-auto mb-3 flex items-center justify-center">
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
                  <a
                    key={item.name}
                    href={item.href}
                    className={`text-base font-medium px-4 py-2 rounded-lg transition-all duration-200 hover:bg-primary/10 ${
                      item.isHome 
                        ? "text-primary font-semibold bg-primary/10" 
                        : "text-gray-700 hover:text-primary"
                    }`}
                  >
                    {item.name}
                  </a>
                )
              ))}
            </div>
          </nav>

          {/* Contact Us Button */}
          <div className="hidden md:flex items-center">
            <Button 
              className="bg-primary hover:bg-primary/90 text-white font-semibold px-6 py-2 rounded-lg transition-all duration-300 shadow-sm hover:shadow-md"
            >
              Contact Us
            </Button>
          </div>

          {/* Mobile Menu Button */}
          <button
            className="md:hidden p-2 rounded-lg text-gray-700 hover:text-primary hover:bg-gray-100 transition-colors"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="md:hidden border-t border-gray-200 bg-white">
            <div className="py-4 space-y-3">
              {navigationItems.map((item) => (
                item.hasDropdown ? (
                  <div key={item.name} className="px-4">
                    <div className="text-base font-medium text-gray-700 mb-2">
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
                  <a
                    key={item.name}
                    href={item.href}
                    className={`block px-4 py-3 text-base font-medium rounded-lg transition-colors duration-200 ${
                      item.isHome 
                        ? "text-primary bg-primary/10 font-semibold" 
                        : "text-gray-700 hover:text-primary hover:bg-gray-50"
                    }`}
                    onClick={() => setIsMenuOpen(false)}
                  >
                    {item.name}
                  </a>
                )
              ))}
              <div className="px-4 pt-2">
                <Button 
                  className="w-full bg-primary hover:bg-primary/90 text-white font-semibold py-2 rounded-lg transition-all duration-300"
                >
                  Contact Us
                </Button>
              </div>
            </div>
          </div>
        )}
      </div>
    </header>
  );
};
