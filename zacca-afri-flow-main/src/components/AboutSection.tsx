import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Brain, MessageCircle, Coins, Shield, Heart, Target, Users, Zap, MessageSquare, Wallet, ArrowRight, CheckCircle, BarChart3, Zap as Lightning } from "lucide-react";
import vegetableVendorImage from "@/assets/Vegetable Vender at City Market.png";

export const AboutSection = () => {
  const steps = [
    {
      icon: MessageSquare,
      title: "Sync Your Chats",
      description: "Connect your WhatsApp, M-Pesa, and business communications",
      details: "Our AI securely analyzes your business conversations, transactions, and payment patterns to understand your real business activity.",
      color: "text-primary"
    },
    {
      icon: Brain,
      title: "AI Creates Records",
      description: "Advanced AI verifies and transforms chats into business data",
      details: "Machine learning algorithms identify genuine business transactions, calculate cash flows, and assess creditworthiness from real activity.",
      color: "text-terracotta"
    },
    {
      icon: Wallet,
      title: "Unlock Liquidity",
      description: "Get your dynamic credit score and smart wallet access",
      details: "Access fair credit scores based on actual business performance, plus an AI wallet that automatically optimizes your financial opportunities.",
      color: "text-gold"
    },
    {
      icon: Users,
      title: "Connect & Grow",
      description: "Join the LiquiChain DAO marketplace ecosystem",
      details: "Connect with smart lenders, insurers, and business partners. Auto-deductions, transparent profiles, and blockchain security included.",
      color: "text-primary"
    }
  ];

  return (
    <section className="py-24 relative bg-gray-50">
      <div className="container mx-auto px-6">
        {/* Section Header - Human-Centered */}
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            Bridging <span className="text-primary">The Credit Gap</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            Zacca.ai leverages cutting-edge AI and blockchain to create fair financial access for every African business, 
            turning everyday transactions into powerful credit opportunities.
          </p>
        </div>

        {/* How Zacca.ai Works Section */}
        <div className="mb-20">

          {/* Interactive Steps */}
          <div className="space-y-16">
            {steps.map((step, index) => (
              <div key={index} className="relative group">
                {/* Enhanced Connection Line */}
                {index < steps.length - 1 && (
                  <div className="absolute left-1/2 transform -translate-x-1/2 top-full w-1 h-16 bg-gradient-to-b from-primary via-accent to-primary/30 hidden md:block animate-pulse" />
                )}
                
                <Card className="feature-card p-8 lg:p-12 border-2 border-primary/20 hover:border-primary/40 transition-all duration-500 hover:shadow-2xl hover:shadow-primary/20 hover:scale-[1.02] group-hover:bg-gradient-to-br group-hover:from-white group-hover:to-primary/5">
                  <div className={`grid lg:grid-cols-2 gap-12 items-center ${index % 2 === 1 ? 'lg:grid-flow-col-dense' : ''}`}>
                    <div className={`space-y-8 ${index % 2 === 1 ? 'lg:col-start-2' : ''}`}>
                      <div className="flex items-center gap-6">
                        <div className={`w-20 h-20 rounded-3xl bg-gradient-to-br from-primary to-accent border-2 border-primary/30 flex items-center justify-center animate-pulse-glow group-hover:animate-bounce`}>
                          <step.icon className={`w-10 h-10 text-white`} />
                        </div>
                        <div>
                          <div className="text-lg font-bold text-primary mb-2 bg-primary/10 px-3 py-1 rounded-full inline-block">Step {index + 1}</div>
                          <h3 className="text-3xl lg:text-4xl font-bold text-foreground group-hover:text-primary transition-colors">{step.title}</h3>
                        </div>
                      </div>
                      
                      <p className="text-xl text-muted-foreground leading-relaxed font-medium">
                        {step.description}
                      </p>
                      
                      <p className="text-lg text-foreground/90 leading-relaxed">
                        {step.details}
                      </p>

                      <div className="flex items-center gap-4 text-primary bg-primary/10 px-4 py-3 rounded-xl border border-primary/20">
                        <CheckCircle className="w-6 h-6 animate-pulse" />
                        <span className="text-base font-semibold">Secured by blockchain technology</span>
                      </div>
                    </div>
                    
                    <div className={`relative ${index % 2 === 1 ? 'lg:col-start-1' : ''}`}>
                      <div className="w-full h-80 lg:h-96 bg-gradient-to-br from-primary/10 via-accent/10 to-primary/5 rounded-3xl border-2 border-primary/20 flex items-center justify-center relative overflow-hidden group-hover:border-primary/40 transition-all duration-500">
                        <step.icon className={`w-32 h-32 ${step.color} opacity-80 animate-float group-hover:scale-110 transition-transform duration-500`} />
                        
                        {/* Enhanced Animated Elements */}
                        <div className="absolute inset-0">
                          {[...Array(5)].map((_, i) => (
                            <div
                              key={i}
                              className="absolute w-4 h-4 bg-gradient-to-r from-primary to-accent rounded-full animate-pulse"
                              style={{
                                top: `${20 + i * 15}%`,
                                left: `${15 + i * 20}%`,
                                animationDelay: `${i * 0.3}s`,
                                animationDuration: '2s'
                              }}
                            />
                          ))}
                          
                          {/* Floating particles */}
                          {[...Array(8)].map((_, i) => (
                            <div
                              key={`particle-${i}`}
                              className="absolute w-2 h-2 bg-accent/60 rounded-full animate-bounce"
                              style={{
                                top: `${10 + (i * 12)}%`,
                                left: `${5 + (i * 12)}%`,
                                animationDelay: `${i * 0.4}s`,
                                animationDuration: '3s'
                              }}
                            />
                          ))}
                        </div>
                        
                        {/* Glow effect */}
                        <div className="absolute inset-0 bg-gradient-to-r from-transparent via-primary/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
                      </div>
                    </div>
                  </div>
                </Card>
              </div>
            ))}
          </div>

          {/* Enhanced CTA */}
          <div className="text-center mt-20">
            <Button 
              size="lg" 
              className="bg-gradient-to-r from-primary to-accent hover:from-primary/90 hover:to-accent/90 text-white font-bold px-12 py-6 rounded-2xl shadow-2xl hover:shadow-primary/30 transition-all duration-300 group transform hover:scale-105"
            >
              Start Your Journey
              <ArrowRight className="w-6 h-6 ml-3 group-hover:translate-x-2 transition-transform duration-300" />
            </Button>
            <p className="text-sm text-muted-foreground mt-4">
              Join thousands of entrepreneurs already transforming their businesses
            </p>
          </div>
        </div>

        {/* Next-Gen Lending Platform Section */}
        <div className="mb-20 bg-gradient-to-br from-primary to-primary/80 py-24 rounded-3xl">
          <div className="container mx-auto px-6">
            <div className="text-center mb-16">
              <h2 className="text-4xl md:text-5xl font-bold text-white mb-6">
                Next-Gen <span className="text-accent">Lending Platform</span>
              </h2>
              <p className="text-xl text-white/90 max-w-3xl mx-auto">
                Join the future of African lending with AI-powered risk assessment, real-time analytics, and blockchain security.
              </p>
            </div>

            {/* Feature Cards Grid */}
            <div className="grid md:grid-cols-2 gap-8 max-w-6xl mx-auto">
              {/* Enhanced Risk Assessment */}
              <Card className="bg-gray-800/50 border-gray-700 p-8 hover:bg-[#08f5f8]/10 transition-all duration-300 hover:shadow-2xl hover:shadow-[#08f5f8]/30 group">
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 bg-accent/20 rounded-xl flex items-center justify-center group-hover:bg-[#08f5f8]/30 transition-colors">
                    <Shield className="w-6 h-6 text-accent group-hover:text-[#08f5f8] transition-colors" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-white mb-2 group-hover:text-[#08f5f8] transition-colors">Enhanced Risk Assessment</h3>
                    <p className="text-white/80 mb-4">AI-powered credit verification reduces default rates by 60%</p>
                    <div className="inline-flex items-center gap-2 bg-accent/20 rounded-full px-3 py-1 group-hover:bg-[#08f5f8]/20 transition-colors">
                      <span className="text-sm font-semibold text-accent group-hover:text-[#08f5f8] transition-colors">60% lower defaults</span>
                    </div>
                  </div>
                </div>
              </Card>

              {/* Real-time Debtor Analytics */}
              <Card className="bg-gray-800/50 border-gray-700 p-8 hover:bg-[#08f5f8]/10 transition-all duration-300 hover:shadow-2xl hover:shadow-[#08f5f8]/30 group">
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 bg-terracotta/20 rounded-xl flex items-center justify-center group-hover:bg-[#08f5f8]/30 transition-colors">
                    <BarChart3 className="w-6 h-6 text-terracotta group-hover:text-[#08f5f8] transition-colors" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-white mb-2 group-hover:text-[#08f5f8] transition-colors">Real-time Debtor Analytics</h3>
                    <p className="text-white/80 mb-4">Live business performance data and payment behavior tracking</p>
                    <div className="inline-flex items-center gap-2 bg-gray-700/50 rounded-full px-3 py-1 group-hover:bg-[#08f5f8]/20 transition-colors">
                      <span className="text-sm font-semibold text-white group-hover:text-[#08f5f8] transition-colors">24/7 monitoring</span>
                    </div>
                  </div>
                </div>
              </Card>

              {/* Automated Collections */}
              <Card className="bg-gray-800/50 border-gray-700 p-8 hover:bg-[#08f5f8]/10 transition-all duration-300 hover:shadow-2xl hover:shadow-[#08f5f8]/30 group">
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 bg-gold/20 rounded-xl flex items-center justify-center group-hover:bg-[#08f5f8]/30 transition-colors">
                    <Lightning className="w-6 h-6 text-gold group-hover:text-[#08f5f8] transition-colors" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-white mb-2 group-hover:text-[#08f5f8] transition-colors">Automated Collections</h3>
                    <p className="text-white/80">Smart contract-based automatic deductions and payment scheduling</p>
                  </div>
                </div>
              </Card>

              {/* Verified Borrower Profiles */}
              <Card className="bg-gray-800/50 border-gray-700 p-8 hover:bg-[#08f5f8]/10 transition-all duration-300 hover:shadow-2xl hover:shadow-[#08f5f8]/30 group">
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 bg-accent/20 rounded-xl flex items-center justify-center group-hover:bg-[#08f5f8]/30 transition-colors">
                    <Users className="w-6 h-6 text-accent group-hover:text-[#08f5f8] transition-colors" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-white mb-2 group-hover:text-[#08f5f8] transition-colors">Verified Borrower Profiles</h3>
                    <p className="text-white/80">Blockchain-secured business records and transaction histories</p>
                  </div>
                </div>
              </Card>
            </div>
          </div>
        </div>

        {/* Real Story - Mama Mboga */}
        <div className="mb-8">
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
                  src={vegetableVendorImage} 
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

      </div>
    </section>
  );
};