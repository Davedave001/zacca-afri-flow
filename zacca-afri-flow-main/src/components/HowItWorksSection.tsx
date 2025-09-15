import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { MessageSquare, Brain, Wallet, Users, ArrowRight, CheckCircle } from "lucide-react";

export const HowItWorksSection = () => {
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
    <section className="py-24 relative">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            How <span className="text-gradient-primary">Zacca.ai</span> Works
          </h2>
          <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
            Four simple steps to transform your informal business activities into formal financial opportunities
          </p>
        </div>

        {/* Interactive Steps */}
        <div className="space-y-12">
          {steps.map((step, index) => (
            <div key={index} className="relative">
              {/* Connection Line */}
              {index < steps.length - 1 && (
                <div className="absolute left-1/2 transform -translate-x-1/2 top-full w-px h-12 bg-gradient-to-b from-primary/50 to-transparent hidden md:block" />
              )}
              
              <Card className="feature-card p-8 lg:p-12">
                <div className={`grid lg:grid-cols-2 gap-8 items-center ${index % 2 === 1 ? 'lg:grid-flow-col-dense' : ''}`}>
                  <div className={`space-y-6 ${index % 2 === 1 ? 'lg:col-start-2' : ''}`}>
                    <div className="flex items-center gap-4">
                      <div className={`w-16 h-16 rounded-2xl bg-card border border-primary/20 flex items-center justify-center animate-pulse-glow`}>
                        <step.icon className={`w-8 h-8 ${step.color}`} />
                      </div>
                      <div>
                        <div className="text-sm font-medium text-primary mb-1">Step {index + 1}</div>
                        <h3 className="text-2xl lg:text-3xl font-bold text-foreground">{step.title}</h3>
                      </div>
                    </div>
                    
                    <p className="text-lg text-muted-foreground leading-relaxed">
                      {step.description}
                    </p>
                    
                    <p className="text-foreground/80 leading-relaxed">
                      {step.details}
                    </p>

                    <div className="flex items-center gap-3 text-primary">
                      <CheckCircle className="w-5 h-5" />
                      <span className="text-sm font-medium">Secured by blockchain technology</span>
                    </div>
                  </div>
                  
                  <div className={`relative ${index % 2 === 1 ? 'lg:col-start-1' : ''}`}>
                    <div className="w-full h-64 lg:h-80 bg-gradient-to-br from-card to-muted/20 rounded-2xl border border-primary/10 flex items-center justify-center relative overflow-hidden">
                      <step.icon className={`w-24 h-24 ${step.color} opacity-20 animate-float`} />
                      
                      {/* Animated Elements */}
                      <div className="absolute inset-0">
                        {[...Array(3)].map((_, i) => (
                          <div
                            key={i}
                            className="absolute w-2 h-2 bg-primary/30 rounded-full animate-pulse"
                            style={{
                              top: `${30 + i * 20}%`,
                              left: `${20 + i * 25}%`,
                              animationDelay: `${i * 0.5}s`,
                            }}
                          />
                        ))}
                      </div>
                    </div>
                  </div>
                </div>
              </Card>
            </div>
          ))}
        </div>

        {/* CTA */}
        <div className="text-center mt-16">
          <Button 
            size="lg" 
            className="bg-primary hover:bg-primary/90 text-background font-semibold px-8 py-4 rounded-xl glow-on-hover group"
          >
            Start Your Journey
            <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>
      </div>
    </section>
  );
};