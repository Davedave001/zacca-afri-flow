import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Icon } from "@iconify/react";

export const HowItWorksSection = () => {
  const steps = [
    {
      icon: "lucide:message-square",
      title: "A Case Comes In",
      description: "A flagged case shows up on the underwriter's list, nothing hidden or pre-selected",
      details: "The system pulls in the borrower's transaction and relationship data, with permission, and with personal details kept private.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: "lucide:brain",
      title: "The Checks Run",
      description: "We check for mismatched information, unusual connections, and risky guarantor chains, on this specific case, not a demo",
      details: "The system looks for suspicious connections between people, risky guarantor chains, and mismatches between what was said and what actually happened, all in real time.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: "lucide:wallet",
      title: "The Underwriter Reviews Everything",
      description: "Every flag, connection, and risk summary is laid out clearly for the underwriter to review",
      details: "The underwriter can trace exactly how each flag or connection was found, step by step.",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: "lucide:users",
      title: "A Person Decides, Always",
      description: "The underwriter makes the final call. Zacca never approves, denies, or scores a loan on its own",
      details: "Every decision is logged, so it can be reviewed later by regulators or funders.",
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
            How It Works
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-gray-900 mb-6">
            How It <span className="text-[#3117ce]">Works</span>
          </h2>
          <p className="text-xl text-gray-700 max-w-4xl mx-auto leading-relaxed">
            One simple screen for underwriters to review flagged cases, see the full picture, and get help from an
            assistant, all backed by checks that run on the real case in front of them.
                    </p>
                  </div>
                  
        {/* Steps Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-7xl mx-auto mb-12">
          {steps.map((step, index) => {
            return (
              <div key={index} className="group relative">
                <div
                  className="rounded-2xl h-full transition-all duration-300 hover:shadow-2xl hover:shadow-[#3117ce]/20"
                  style={{
                    background: "linear-gradient(135deg, #2512a8 0%, #3117ce 50%, #4a2dd4 100%)",
                    padding: "1px",
                  }}
                >
                <Card className="bg-white rounded-[15px] p-8 border-0 h-full">
                  <div className="space-y-6">
                    {/* Step Number */}
                    <div className="flex items-center justify-between">
                      <div className={`w-12 h-12 ${step.bgColor} rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform`}>
                        <Icon icon={step.icon} className={`w-6 h-6 ${step.color}`} />
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
            <Icon icon="lucide:arrow-right" className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>
      </div>
    </section>
  );
};
