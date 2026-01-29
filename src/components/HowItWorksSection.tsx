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
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Brain,
      title: "AI Creates Records",
      description: "Advanced AI verifies and transforms chats into business data",
      details: "Machine learning algorithms identify genuine business transactions, calculate cash flows, and assess creditworthiness from real activity.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Wallet,
      title: "Unlock Liquidity",
      description: "Get your dynamic credit score and smart wallet access",
      details: "Access fair credit scores based on actual business performance, plus an AI wallet that automatically optimizes your financial opportunities.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Users,
      title: "Connect & Grow",
      description: "Join the LiquiChain DAO marketplace ecosystem",
      details: "Connect with smart lenders, insurers, and business partners. Auto-deductions, transparent profiles, and blockchain security included.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    }
  ];

  return (
    <section className="py-24 relative bg-white">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-16">
          <Button 
            variant="outline" 
            className="mb-6 border-[#3117ce] text-[#3117ce] hover:bg-[#3117ce]/10 rounded-full px-6"
          >
            Productivity
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-gray-900 mb-6">
            How It <span className="text-[#3117ce]">Works</span>
          </h2>
          <p className="text-xl text-gray-700 max-w-4xl mx-auto leading-relaxed">
            Transform your business conversations into verifiable credit history in four simple steps.
                    </p>
                  </div>
                  
        {/* Steps Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-7xl mx-auto mb-12">
          {steps.map((step, index) => {
            const Icon = step.icon;
            return (
              <div key={index} className="group relative">
                <Card className="bg-white rounded-2xl p-8 border-2 border-gray-200 hover:border-[#3117ce] transition-all duration-300 hover:shadow-2xl hover:shadow-[#3117ce]/20 h-full">
                  <div className="space-y-6">
                    {/* Step Number */}
                    <div className="flex items-center justify-between">
                      <div className={`w-12 h-12 ${step.bgColor} rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform`}>
                        <Icon className={`w-6 h-6 ${step.color}`} />
                </div>
                      <div className="w-8 h-8 rounded-full bg-[#3117ce]/10 flex items-center justify-center border-2 border-[#3117ce]">
                        <span className="text-[#3117ce] font-bold text-sm">{index + 1}</span>
        </div>
                </div>
                
                {/* Content */}
                <div className="space-y-3">
                      <h3 className="text-xl font-semibold text-gray-900 group-hover:text-[#3117ce] transition-colors">
                        {step.title}
                  </h3>
                      <p className="text-gray-700 leading-relaxed">
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
            className="bg-[#3117ce] hover:bg-[#3117ce]/90 text-white font-semibold px-8 py-6 rounded-xl shadow-2xl hover:shadow-[#3117ce]/30 transition-all duration-300 group"
          >
            Start Your Journey
            <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>
      </div>
    </section>
  );
};
