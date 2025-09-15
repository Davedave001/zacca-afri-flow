import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { ArrowRight, Smartphone, Users, Zap, MessageCircle, Shield, Clock, Heart } from "lucide-react";
import blockchainImage from "@/assets/blockchain-network.jpg";

export const CTASection = () => {
  return (
    <section className="py-24 relative bg-gradient-to-br from-primary/5 to-accent/5 overflow-hidden">
      {/* Background */}
      <div className="absolute inset-0">
        <img 
          src={blockchainImage} 
          alt="Blockchain network visualization"
          className="w-full h-full object-cover opacity-5"
        />
        <div className="absolute inset-0 bg-gradient-to-br from-white/95 via-white/90 to-white/95" />
      </div>

      {/* Subtle AI-inspired Background Elements */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {/* Floating gradient orbs */}
        <div className="absolute top-1/4 -right-32 w-96 h-96 bg-gradient-to-br from-primary/5 to-accent/5 rounded-full blur-3xl animate-float" />
        <div className="absolute bottom-1/4 -left-32 w-96 h-96 bg-gradient-to-br from-terracotta/5 to-gold/5 rounded-full blur-3xl animate-float" style={{ animationDelay: '2s' }} />
        
        {/* Data-inspired dots */}
        {[...Array(12)].map((_, i) => (
          <div
            key={i}
            className="absolute w-1 h-1 bg-primary/20 rounded-full animate-pulse"
            style={{
              top: `${10 + (i % 4) * 20}%`,
              left: `${15 + (i % 3) * 25}%`,
              animationDelay: `${i * 0.3}s`,
            }}
          />
        ))}
      </div>

      <div className="container mx-auto px-6 relative z-10">
        <Card className="bg-white border-0 shadow-xl max-w-5xl mx-auto p-8 lg:p-12 text-center">
          {/* Trust Badge */}
          <div className="inline-flex items-center gap-2 bg-primary/10 rounded-full px-6 py-3 mb-8">
            <Shield className="w-4 h-4 text-primary" />
            <span className="text-sm font-semibold text-primary">Licensed & Regulated by CBK</span>
          </div>

          {/* Main CTA Content */}
          <h2 className="text-4xl md:text-6xl font-bold text-foreground mb-8">
            Your <span className="text-primary">Dream Business</span>
            <br />
            <span className="text-muted-foreground">Starts Here</span>
          </h2>
          
          <p className="text-xl text-muted-foreground mb-12 max-w-4xl mx-auto leading-relaxed">
            Join thousands of Kenyan entrepreneurs who've transformed their informal businesses into 
            credit-worthy enterprises. <span className="font-semibold text-primary">No collateral needed. No bias. Just opportunity.</span>
          </p>

          {/* Features Highlight */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-8 mb-12">
            <div className="flex flex-col items-center p-6 bg-white rounded-2xl shadow-sm border border-gray-100">
              <div className="w-16 h-16 bg-primary/10 rounded-2xl flex items-center justify-center mb-4">
                <MessageCircle className="w-8 h-8 text-primary" />
              </div>
              <h3 className="font-bold text-foreground mb-2 text-lg">Chat to Credit</h3>
              <p className="text-sm text-muted-foreground text-center">Transform your WhatsApp business conversations into verifiable credit history</p>
            </div>
            
            <div className="flex flex-col items-center p-6 bg-white rounded-2xl shadow-sm border border-gray-100">
              <div className="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mb-4">
                <Clock className="w-8 h-8 text-accent" />
              </div>
              <h3 className="font-bold text-foreground mb-2 text-lg">Instant Approval</h3>
              <p className="text-sm text-muted-foreground text-center">Get credit decisions in minutes, not months. Because opportunity waits for no one</p>
            </div>
            
            <div className="flex flex-col items-center p-6 bg-white rounded-2xl shadow-sm border border-gray-100">
              <div className="w-16 h-16 bg-terracotta/10 rounded-2xl flex items-center justify-center mb-4">
                <Heart className="w-8 h-8 text-terracotta" />
              </div>
              <h3 className="font-bold text-foreground mb-2 text-lg">Fair & Transparent</h3>
              <p className="text-sm text-muted-foreground text-center">Built for Kenyans, by Kenyans. We see the entrepreneur in everyone</p>
            </div>
          </div>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-6 justify-center mb-12">
            <Button 
              size="lg" 
              className="bg-primary hover:bg-primary/90 text-white font-semibold px-12 py-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 group text-lg"
            >
              <Smartphone className="w-6 h-6 mr-3" />
              Get Started Today
              <ArrowRight className="w-6 h-6 ml-3 group-hover:translate-x-1 transition-transform" />
            </Button>
            
            <Button 
              variant="outline" 
              size="lg"
              className="border-primary text-primary hover:bg-primary hover:text-white font-semibold px-12 py-6 rounded-xl transition-all duration-300 text-lg"
            >
              Watch Success Stories
            </Button>
          </div>

          {/* Trust Indicators */}
          <div className="border-t border-gray-200 pt-8">
            <p className="text-sm text-muted-foreground mb-6 font-medium">Trusted by leading institutions across Kenya</p>
            <div className="flex flex-wrap items-center justify-center gap-8 opacity-60">
              <div className="flex items-center gap-2">
                <span className="text-2xl">🏦</span>
                <span className="text-lg font-bold text-foreground">Kenya Commercial Bank</span>
              </div>
              <div className="flex items-center gap-2">
                <span className="text-2xl">🏛️</span>
                <span className="text-lg font-bold text-foreground">Equity Bank</span>
              </div>
              <div className="flex items-center gap-2">
                <span className="text-2xl">📱</span>
                <span className="text-lg font-bold text-foreground">Safaricom</span>
              </div>
            </div>
          </div>

          {/* Security Badge */}
          <div className="mt-8 inline-flex items-center gap-3 bg-gray-50 rounded-full px-6 py-3 border border-gray-200">
            <div className="w-3 h-3 bg-green-500 rounded-full animate-pulse" />
            <span className="text-sm text-muted-foreground font-medium">Bank-grade security & full CBK compliance</span>
          </div>
        </Card>
      </div>
    </section>
  );
};