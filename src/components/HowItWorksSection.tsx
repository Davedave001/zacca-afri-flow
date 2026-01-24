import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { MessageSquare, Brain, Wallet, Users, ArrowRight, CheckCircle, Zap } from "lucide-react";

export const HowItWorksSection = () => {
  const steps = [
    {
      icon: MessageSquare,
      title: "Sync Your Chats",
      description: "Connect your WhatsApp, M-Pesa, and business communications",
      details: "Our AI securely analyzes your business conversations, transactions, and payment patterns to understand your real business activity.",
      color: "text-primary",
      bgColor: "bg-primary/20"
    },
    {
      icon: Brain,
      title: "AI Creates Records",
      description: "Advanced AI verifies and transforms chats into business data",
      details: "Machine learning algorithms identify genuine business transactions, calculate cash flows, and assess creditworthiness from real activity.",
      color: "text-accent",
      bgColor: "bg-accent/20"
    },
    {
      icon: Wallet,
      title: "Unlock Liquidity",
      description: "Get your dynamic credit score and smart wallet access",
      details: "Access fair credit scores based on actual business performance, plus an AI wallet that automatically optimizes your financial opportunities.",
      color: "text-gold",
      bgColor: "bg-gold/20"
    },
    {
      icon: Users,
      title: "Connect & Grow",
      description: "Join the LiquiChain DAO marketplace ecosystem",
      details: "Connect with smart lenders, insurers, and business partners. Auto-deductions, transparent profiles, and blockchain security included.",
      color: "text-terracotta",
      bgColor: "bg-terracotta/20"
    }
  ];

  return (
    <section className="py-24 relative bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-16">
          <Button 
            variant="outline" 
            className="mb-6 border-white/20 text-white/80 hover:bg-white/10 rounded-full px-6"
          >
            Productivity
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-white mb-6">
            How It <span className="text-accent">Works</span>
          </h2>
          <p className="text-xl text-white/80 max-w-4xl mx-auto leading-relaxed">
            Transform your business conversations into verifiable credit history in four simple steps.
          </p>
        </div>

        {/* Steps Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-7xl mx-auto mb-12">
          {steps.map((step, index) => {
            const Icon = step.icon;
            return (
              <div key={index} className="group relative">
                <Card className="bg-white/5 backdrop-blur-md rounded-2xl p-8 border border-white/10 hover:border-accent/50 transition-all duration-300 hover:shadow-2xl hover:shadow-accent/20 h-full">
                  <div className="space-y-6">
                    {/* Step Number */}
                    <div className="flex items-center justify-between">
                      <div className={`w-12 h-12 ${step.bgColor} rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform`}>
                        <Icon className={`w-6 h-6 ${step.color}`} />
                      </div>
                      <div className="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center border border-white/20">
                        <span className="text-white font-bold text-sm">{index + 1}</span>
                      </div>
                    </div>
                    
                    {/* Content */}
                    <div className="space-y-3">
                      <h3 className="text-xl font-semibold text-white group-hover:text-accent transition-colors">
                        {step.title}
                      </h3>
                      <p className="text-white/70 leading-relaxed">
                        {step.description}
                      </p>
                    </div>
                  </div>
                </Card>
              </div>
            );
          })}
        </div>

        {/* CTA */}
        <div className="text-center">
          <Button 
            size="lg" 
            className="bg-gradient-to-r from-primary to-accent hover:from-primary/90 hover:to-accent/90 text-white font-semibold px-8 py-6 rounded-xl shadow-2xl hover:shadow-primary/30 transition-all duration-300 group"
          >
            Start Your Journey
            <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>
      </div>
    </section>
  );
};
