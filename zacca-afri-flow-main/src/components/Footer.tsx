import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
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
    product: [
      { label: "Features", href: "#features" },
      { label: "How It Works", href: "#how-it-works" },
      { label: "Pricing", href: "#pricing" },
      { label: "API Documentation", href: "#api" },
      { label: "Mobile App", href: "#app" }
    ],
    company: [
      { label: "About Us", href: "#about" },
      { label: "Impact Stories", href: "#stories" },
      { label: "Careers", href: "#careers" },
      { label: "Press Kit", href: "#press" },
      { label: "Blog", href: "#blog" }
    ],
    support: [
      { label: "Help Center", href: "#help" },
      { label: "Contact Support", href: "#support" },
      { label: "Developer Docs", href: "#docs" },
      { label: "Status Page", href: "#status" },
      { label: "Security", href: "#security" }
    ],
    legal: [
      { label: "Privacy Policy", href: "#privacy" },
      { label: "Terms of Service", href: "#terms" },
      { label: "Cookie Policy", href: "#cookies" },
      { label: "Compliance", href: "#compliance" },
      { label: "Data Protection", href: "#data" }
    ]
  };

  return (
    <footer className="relative bg-gradient-to-br from-background to-muted/20 border-t border-border">
      {/* Background Pattern */}
      <div className="absolute inset-0 overflow-hidden opacity-5">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-primary rounded-full blur-3xl" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-terracotta rounded-full blur-3xl" />
      </div>

      <div className="container mx-auto px-6 relative z-10">
        {/* Main Footer Content */}
        <div className="py-16">
          <div className="grid lg:grid-cols-5 gap-12">
            {/* Company Info */}
            <div className="lg:col-span-2 space-y-6">
              <div>
                <div className="flex items-center gap-3 mb-4">
                  <div className="w-10 h-10 bg-primary rounded-xl flex items-center justify-center">
                    <Zap className="w-6 h-6 text-background" />
                  </div>
                  <span className="text-2xl font-bold text-gradient-primary">Zacca.ai</span>
                </div>
                <p className="text-muted-foreground leading-relaxed">
                  Transforming African finance through AI and blockchain technology. 
                  We make credit accessible, fair, and transparent for every business.
                </p>
              </div>

              {/* Contact Info */}
              <div className="space-y-3">
                <div className="flex items-center gap-3 text-muted-foreground">
                  <Mail className="w-5 h-5 text-primary" />
                  <span>hello@zacca.ai</span>
                </div>
                <div className="flex items-center gap-3 text-muted-foreground">
                  <Phone className="w-5 h-5 text-primary" />
                  <span>+254 700 123 456</span>
                </div>
                <div className="flex items-center gap-3 text-muted-foreground">
                  <MapPin className="w-5 h-5 text-primary" />
                  <span>Nairobi, Kenya</span>
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
                    className="w-10 h-10 p-0 border-primary/20 text-primary hover:bg-primary/10 glow-on-hover"
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
              <h4 className="font-semibold text-foreground mb-4">Product</h4>
              <ul className="space-y-3">
                {footerLinks.product.map((link) => (
                  <li key={link.label}>
                    <a 
                      href={link.href}
                      className="text-muted-foreground hover:text-primary transition-colors"
                    >
                      {link.label}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            <div>
              <h4 className="font-semibold text-foreground mb-4">Company</h4>
              <ul className="space-y-3">
                {footerLinks.company.map((link) => (
                  <li key={link.label}>
                    <a 
                      href={link.href}
                      className="text-muted-foreground hover:text-primary transition-colors"
                    >
                      {link.label}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            <div>
              <h4 className="font-semibold text-foreground mb-4">Support</h4>
              <ul className="space-y-3 mb-6">
                {footerLinks.support.map((link) => (
                  <li key={link.label}>
                    <a 
                      href={link.href}
                      className="text-muted-foreground hover:text-primary transition-colors"
                    >
                      {link.label}
                    </a>
                  </li>
                ))}
              </ul>
              
              {/* Newsletter */}
              <div>
                <h5 className="font-medium text-foreground mb-3">Stay Updated</h5>
                <p className="text-sm text-muted-foreground mb-3">
                  Get the latest fintech insights
                </p>
                <div className="flex gap-2">
                  <input
                    type="email"
                    placeholder="Enter email"
                    className="flex-1 px-3 py-2 text-sm bg-muted/30 border border-border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50"
                  />
                  <Button size="sm" className="bg-primary hover:bg-primary/90 text-background">
                    <Mail className="w-4 h-4" />
                  </Button>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="py-8 border-t border-border">
          <div className="flex flex-col md:flex-row items-center justify-between gap-4">
            <div className="flex items-center gap-6 text-sm">
              <p className="text-muted-foreground">
                © 2024 Zacca.ai. All rights reserved.
              </p>
              <div className="flex gap-4">
                {footerLinks.legal.slice(0, 3).map((link) => (
                  <a
                    key={link.label}
                    href={link.href}
                    className="text-muted-foreground hover:text-primary transition-colors"
                  >
                    {link.label}
                  </a>
                ))}
              </div>
            </div>

            <div className="flex items-center gap-4">
              <Badge 
                variant="secondary" 
                className="bg-primary/10 text-primary border-primary/20"
              >
                <div className="w-2 h-2 bg-primary rounded-full mr-2 animate-pulse" />
                All systems operational
              </Badge>
              
              <Button
                variant="outline"
                size="sm"
                onClick={scrollToTop}
                className="border-primary/20 text-primary hover:bg-primary/10"
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