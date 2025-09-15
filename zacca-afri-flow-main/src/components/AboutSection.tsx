import { Card } from "@/components/ui/card";
import { Brain, MessageCircle, Coins, Shield, Heart, Target, Users, Zap } from "lucide-react";
import aboutImage from "@/assets/mama-mboga-ai.jpg";

export const AboutSection = () => {
  return (
    <section className="py-24 relative bg-gray-50">
      <div className="container mx-auto px-6">
        {/* Section Header - Human-Centered */}
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            Building <span className="text-primary">Financial Bridges</span>
            <br />
            <span className="text-muted-foreground">Across Kenya</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            We believe every Kenyan entrepreneur deserves a fair chance at growth. Our AI doesn't judge by traditional metrics – 
            it sees the hustle, the community trust, and the real business happening in WhatsApp groups and M-Pesa transactions.
          </p>
        </div>

        {/* Real Story - Mama Mboga */}
        <div className="mb-20">
          <Card className="bg-white border-0 shadow-lg p-8 lg:p-12">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div className="space-y-6">
                <div className="inline-flex items-center gap-2 bg-primary/10 rounded-full px-4 py-2 mb-4">
                  <Heart className="w-4 h-4 text-primary" />
                  <span className="text-sm font-semibold text-primary">Real Impact Story</span>
                </div>
                <h3 className="text-3xl font-bold text-foreground">
                  Meet Grace: From <span className="text-primary">Market Stall</span> to <span className="text-accent">Business Owner</span>
                </h3>
                <p className="text-lg text-muted-foreground leading-relaxed">
                  Grace runs a vegetable stall in Nairobi's Eastleigh market. Through her WhatsApp business group and M-Pesa transactions, 
                  our AI recognized her consistent cash flow and community trust. Within 24 hours, she received her first business loan 
                  – no collateral, no lengthy paperwork.
                </p>
                <div className="bg-primary/5 rounded-xl p-6">
                  <p className="text-primary font-semibold mb-2">"Zacca saw my business before I even knew I had one."</p>
                  <p className="text-sm text-muted-foreground">- Grace, Mama Mboga, Eastleigh Market</p>
                </div>
              </div>
              <div className="relative">
                <img 
                  src={aboutImage} 
                  alt="Grace, a mama mboga entrepreneur, using her smartphone for business"
                  className="w-full rounded-xl shadow-xl"
                />
                <div className="absolute -bottom-4 -right-4 bg-white rounded-xl p-4 shadow-lg border">
                  <div className="flex items-center gap-2">
                    <div className="w-3 h-3 bg-green-500 rounded-full animate-pulse"></div>
                    <span className="text-sm font-semibold text-foreground">Live Business Data</span>
                  </div>
                </div>
              </div>
            </div>
          </Card>
        </div>

        {/* Our Mission */}
        <div className="text-center mb-16">
          <h3 className="text-3xl font-bold text-foreground mb-6">
            Our <span className="text-gradient-primary">Mission</span>
          </h3>
          <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
            To democratize access to credit by recognizing the real value in informal African business networks, 
            powered by AI that understands context, culture, and community.
          </p>
        </div>

        {/* Core Values */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <Card className="bg-white border-0 shadow-sm hover:shadow-lg transition-all duration-300 p-8 text-center group">
            <div className="w-16 h-16 bg-primary/10 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-primary/20 transition-colors">
              <Target className="w-8 h-8 text-primary" />
            </div>
            <h4 className="text-xl font-semibold text-foreground mb-3">Fair Access</h4>
            <p className="text-muted-foreground text-sm leading-relaxed">
              No bias based on location, education, or traditional credit history. We see the entrepreneur in everyone.
            </p>
          </Card>

          <Card className="bg-white border-0 shadow-sm hover:shadow-lg transition-all duration-300 p-8 text-center group">
            <div className="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-accent/20 transition-colors">
              <Brain className="w-8 h-8 text-accent" />
            </div>
            <h4 className="text-xl font-semibold text-foreground mb-3">Smart AI</h4>
            <p className="text-muted-foreground text-sm leading-relaxed">
              Advanced algorithms that understand African business patterns, cultural context, and informal economies.
            </p>
          </Card>

          <Card className="bg-white border-0 shadow-sm hover:shadow-lg transition-all duration-300 p-8 text-center group">
            <div className="w-16 h-16 bg-terracotta/10 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-terracotta/20 transition-colors">
              <Users className="w-8 h-8 text-terracotta" />
            </div>
            <h4 className="text-xl font-semibold text-foreground mb-3">Community First</h4>
            <p className="text-muted-foreground text-sm leading-relaxed">
              Built for Kenyans, by Kenyans. We understand the power of community networks and social capital.
            </p>
          </Card>

          <Card className="bg-white border-0 shadow-sm hover:shadow-lg transition-all duration-300 p-8 text-center group">
            <div className="w-16 h-16 bg-gold/10 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-gold/20 transition-colors">
              <Zap className="w-8 h-8 text-gold" />
            </div>
            <h4 className="text-xl font-semibold text-foreground mb-3">Instant Impact</h4>
            <p className="text-muted-foreground text-sm leading-relaxed">
              From application to funding in hours, not weeks. Because opportunity waits for no one.
            </p>
          </Card>
        </div>
      </div>
    </section>
  );
};