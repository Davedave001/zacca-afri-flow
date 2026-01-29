import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Brain, Shield, Target, Users, Zap, BarChart3, CheckCircle } from "lucide-react";

export const AboutSection = () => {
  const solutions = [
    {
      icon: Brain,
      title: "Dynamic Credit Scoring",
      description: "AI-powered credit verification reduces default rates by 60%",
      badge: "60% lower defaults",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: BarChart3,
      title: "Real-time Analytics",
      description: "Live business performance data and payment behavior tracking",
      badge: "24/7 monitoring",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Zap,
      title: "Automated Collections",
      description: "Smart contract-based automatic deductions and payment scheduling",
      badge: "Smart Contracts",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Users,
      title: "Verified Profiles",
      description: "Blockchain-secured business records and transaction histories",
      badge: "Blockchain Secured",
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
            Top-notch Solutions
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-gray-900 mb-6">
            Next-Gen <span className="text-[#3117ce]">Lending Platform</span>
              </h2>
          <p className="text-xl text-gray-700 max-w-3xl mx-auto">
                Join the future of African lending with AI-powered risk assessment, real-time analytics, and blockchain security.
              </p>
            </div>

        {/* Solutions Grid */}
            <div className="grid md:grid-cols-2 gap-8 max-w-6xl mx-auto">
          {solutions.map((solution, index) => {
            const Icon = solution.icon;
            return (
              <Card 
                key={index}
                className="bg-white border-2 border-gray-200 p-8 hover:border-[#3117ce] transition-all duration-300 hover:shadow-2xl hover:shadow-[#3117ce]/20 group"
              >
                <div className="flex items-start gap-4">
                  <div className={`w-14 h-14 ${solution.bgColor} rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform`}>
                    <Icon className={`w-7 h-7 ${solution.color}`} />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-semibold text-gray-900 mb-2 group-hover:text-[#3117ce] transition-colors">
                      {solution.title}
                    </h3>
                    <p className="text-gray-700 mb-4 leading-relaxed">
                      {solution.description}
                    </p>
                    <div className="inline-flex items-center gap-2 bg-[#3117ce]/10 rounded-full px-3 py-1 border border-[#3117ce]/20">
                      <CheckCircle className="w-4 h-4 text-[#3117ce]" />
                      <span className="text-sm font-semibold text-gray-900">
                        {solution.badge}
                      </span>
                    </div>
                  </div>
                </div>
              </Card>
            );
          })}
        </div>
      </div>
    </section>
  );
};
