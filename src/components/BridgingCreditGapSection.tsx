import { Button } from "@/components/ui/button";
import { Brain, Shield, TrendingUp, Zap, CheckCircle } from "lucide-react";

export const BridgingCreditGapSection = () => {
  const perks = [
    {
      icon: Brain,
      title: "Deterministic Wedges",
      description: "Fraud-ring linkage graphs, SACCO/chama guarantor cascade-risk, and stated-vs-observed contradiction detection — transparent, threshold-based, and reconstructable by a reviewer line by line.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Shield,
      title: "Governance & Audit",
      description: "Consent-gated at every read, PII-redacted, and logged to a W3C PROV-O decision graph — the same enforced path for a human upload, an automated file drop, or an agent tool call.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: TrendingUp,
      title: "Portfolio & Real-Time Risk",
      description: "Macro-adjusted Monte Carlo loss simulation for a whole book, layered with live event shocks — aggregate-only, never an individual borrower's number.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Zap,
      title: "Bounded Learned Layer",
      description: "A trained confidence estimator and a segment-level PD model — scoped to calibration and portfolio segments, never an individual credit score, by design and by test.",
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
            Signal, Not Verdict
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-gray-900 mb-6">
            Four Layers, <span className="text-[#3117ce]">One Boundary</span>
          </h2>
          <p className="text-xl text-gray-700 max-w-4xl mx-auto leading-relaxed">
            Each layer is independently tested, and each one stops short of a decision — deterministic wedges,
            portfolio-level risk, a bounded learned layer, and full governance, all reviewed by a human underwriter.
          </p>
        </div>

        {/* Perks Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-7xl mx-auto">
          {perks.map((perk, index) => {
            const Icon = perk.icon;
            return (
              <div
                key={index}
                className="bg-white rounded-2xl p-8 border-2 border-gray-200 hover:border-[#3117ce] transition-all duration-300 hover:shadow-2xl hover:shadow-[#3117ce]/20 group"
              >
                <div className={`w-14 h-14 ${perk.bgColor} rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                  <Icon className={`w-7 h-7 ${perk.color}`} />
                </div>
                <h3 className="text-xl font-semibold text-gray-900 mb-3 group-hover:text-[#3117ce] transition-colors">
                  {perk.title}
                </h3>
                <p className="text-gray-700 leading-relaxed">
                  {perk.description}
                </p>
              </div>
            );
          })}
        </div>

        {/* Bottom CTA */}
        <div className="text-center mt-16">
          <div className="inline-flex items-center gap-2 bg-[#3117ce]/10 rounded-full px-6 py-3 border border-[#3117ce]/20">
            <CheckCircle className="w-5 h-5 text-[#3117ce]" />
            <span className="text-gray-900 font-semibold">A Flag, a Graph, or a Risk Map — Never a Score</span>
          </div>
        </div>
      </div>
    </section>
  );
};
