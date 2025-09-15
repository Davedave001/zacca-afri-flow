import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { ArrowRight, Smartphone, Users, Zap, MessageCircle } from "lucide-react";
import blockchainImage from "@/assets/blockchain-network.jpg";

export const CTASection = () => {
  return (
    <section className="py-24 relative overflow-hidden">
      {/* Background */}
      <div className="absolute inset-0">
        <img 
          src={blockchainImage} 
          alt="Blockchain network visualization"
          className="w-full h-full object-cover opacity-10"
        />
        <div className="absolute inset-0 bg-gradient-to-br from-background/95 via-background/90 to-background/95" />
      </div>

      {/* Animated Background Elements */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(8)].map((_, i) => (
          <div
            key={i}
            className="absolute w-2 h-2 bg-primary/30 rounded-full animate-pulse"
            style={{
              top: `${Math.random() * 100}%`,
              left: `${Math.random() * 100}%`,
              animationDelay: `${i * 0.3}s`,
              animationDuration: `${2 + Math.random() * 2}s`,
            }}
          />
        ))}
      </div>

      <div className="container mx-auto px-6 relative z-10">
        <Card className="feature-card max-w-4xl mx-auto p-8 lg:p-12 text-center">
          {/* AI Assistant Animation */}
          <div className="mb-8">
            <div className="w-20 h-20 bg-gradient-to-br from-primary/20 to-terracotta/20 rounded-full flex items-center justify-center mx-auto mb-6 animate-float">
              <Zap className="w-10 h-10 text-primary animate-pulse-glow" />
            </div>
            <div className="flex items-center justify-center gap-2 text-primary mb-4">
              <MessageCircle className="w-5 h-5 animate-pulse" />
              <span className="text-sm font-medium animate-fade-up">AI Assistant Speaking</span>
            </div>
          </div>

          {/* Main CTA Content */}
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            Ready to Unlock Your 
            <span className="text-gradient-primary"> Business Potential</span>?
          </h2>
          
          <p className="text-xl text-muted-foreground mb-8 max-w-3xl mx-auto leading-relaxed">
            Join thousands of African entrepreneurs who've transformed their informal businesses into 
            credit-worthy enterprises. Your journey to financial freedom starts with a simple chat.
          </p>

          {/* Features Highlight */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-6 mb-12">
            <div className="flex flex-col items-center p-4">
              <div className="w-12 h-12 bg-primary/10 rounded-xl flex items-center justify-center mb-3">
                <MessageCircle className="w-6 h-6 text-primary" />
              </div>
              <h3 className="font-semibold text-foreground mb-1">Chat to Credit</h3>
              <p className="text-sm text-muted-foreground">WhatsApp to creditworthiness</p>
            </div>
            
            <div className="flex flex-col items-center p-4">
              <div className="w-12 h-12 bg-terracotta/10 rounded-xl flex items-center justify-center mb-3">
                <Zap className="w-6 h-6 text-terracotta" />
              </div>
              <h3 className="font-semibold text-foreground mb-1">Instant Assessment</h3>
              <p className="text-sm text-muted-foreground">30-second credit scoring</p>
            </div>
            
            <div className="flex flex-col items-center p-4">
              <div className="w-12 h-12 bg-gold/10 rounded-xl flex items-center justify-center mb-3">
                <Users className="w-6 h-6 text-gold" />
              </div>
              <h3 className="font-semibold text-foreground mb-1">Smart Network</h3>
              <p className="text-sm text-muted-foreground">Connect with lenders</p>
            </div>
          </div>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-8">
            <Button 
              size="lg" 
              className="bg-primary hover:bg-primary/90 text-background font-semibold px-10 py-6 rounded-xl glow-on-hover group text-lg"
            >
              <Smartphone className="w-6 h-6 mr-3" />
              Download Zacca.ai App
              <ArrowRight className="w-6 h-6 ml-3 group-hover:translate-x-1 transition-transform" />
            </Button>
            
            <Button 
              variant="outline" 
              size="lg"
              className="border-primary/30 text-primary hover:bg-primary/10 font-semibold px-10 py-6 rounded-xl text-lg"
            >
              Watch Demo Video
            </Button>
          </div>

          {/* Trust Indicators */}
          <div className="border-t border-border pt-8">
            <p className="text-sm text-muted-foreground mb-4">Trusted by leading institutions</p>
            <div className="flex items-center justify-center gap-8 opacity-60">
              <span className="text-lg font-bold">Kenya Commercial Bank</span>
              <span className="text-lg font-bold">Equity Bank</span>
              <span className="text-lg font-bold">Safaricom</span>
            </div>
          </div>

          {/* Security Badge */}
          <div className="mt-8 inline-flex items-center gap-2 bg-muted/30 rounded-full px-4 py-2">
            <div className="w-2 h-2 bg-primary rounded-full animate-pulse" />
            <span className="text-sm text-muted-foreground">Bank-grade security & full compliance</span>
          </div>
        </Card>
      </div>
    </section>
  );
};