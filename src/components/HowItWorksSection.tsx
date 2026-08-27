import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { MessageSquare, Brain, Wallet, Users, ArrowRight, CheckCircle, Zap } from "lucide-react";

export const HowItWorksSection = () => {
  const steps = [
    {
      icon: MessageSquare,
      title: "Case Enters the Queue",
      description: "A live Queue surfaces flagged cases as they come in — nothing pre-selected or hidden",
      details: "Consent-gated retrieval pulls the case's transaction and relationship data, PII-redacted, ready for the wedges to run.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Brain,
      title: "Wedges Run Against the Case",
      description: "Deterministic wedges check for contradictions, linkage, and cascade risk — not a canned demo",
      details: "Fraud-ring linkage graphs, SACCO/chama cascade-risk, and stated-vs-observed contradiction detection all run in real time against the live case.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Wallet,
      title: "Underwriter Reviews the Evidence",
      description: "Cluster, Cascade, Contradiction, and Portfolio views lay out every flag, graph, and risk map",
      details: "Every output is reconstructable line by line — the underwriter can trace exactly how a flag or graph was produced.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Users,
      title: "Human Decides, Always",
      description: "The underwriter makes the call — Zacca never returns an approve/deny decision or a score",
      details: "Every decision is logged to a W3C PROV-O audit trail — reviewable by regulators and funders independently.",
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
            The Console
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-gray-900 mb-6">
            How It <span className="text-[#3117ce]">Works</span>
          </h2>
          <p className="text-xl text-gray-700 max-w-4xl mx-auto leading-relaxed">
            One console for underwriters — a live Queue of flagged cases, full Cluster/Cascade/Contradiction/Portfolio
            views, and a chat agent, backed by wedges that run against the case in front of them.
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
