import { useState } from "react";
import accordionImage1 from "@/assets/accordion image.png";
import accordionImage2 from "@/assets/accordion image 3.png";
import accordionImage3 from "@/assets/accordion image 5.png";

export const AccordionSection = () => {
  const [activeTab, setActiveTab] = useState(0);

  const tabs = [
    {
      id: 0,
      title: "SME Onboarding and Business Setup",
      heading: "SME Onboarding and Business Setup",
      image: accordionImage1,
      steps: [
        {
          number: 1,
          title: "Set up your business profile",
          description: "Enter your current stock items or services, supplier names, and typical quantity and price ranges to establish your business baseline."
        },
        {
          number: 2,
          title: "Connect your mobile money",
          description: "Link your M-Pesa account to enable automatic transaction processing. Every incoming message becomes machine-readable fuel for your business."
        },
        {
          number: 3,
          title: "Activate AI mapping",
          description: "Our NLP/ML engine automatically parses transaction amounts and probabilistically maps them to stock items or services sold."
        }
      ]
    },
    {
      id: 1,
      title: "Business Automation on Zacca App",
      heading: "Business Automation on Zacca App",
      image: accordionImage2,
      steps: [
        {
          number: 1,
          title: "Automatic inventory updates",
          description: "Every transaction automatically updates your inventory, recording sales in real-time with zero manual effort."
        },
        {
          number: 2,
          title: "Customer analytics tracking",
          description: "Capture payer metadata to compute repeat customers, order frequency, and basket size—building comprehensive daily records."
        },
        {
          number: 3,
          title: "Continuous insights",
          description: "Transform everyday mobile money transactions, inventory behavior, and service income into continuously updated business insights."
        }
      ]
    },
    {
      id: 2,
      title: "Credit Approval and Automation",
      heading: "Credit Approval and Automation",
      image: accordionImage3,
      steps: [
        {
          number: 1,
          title: "Build your credit profile",
          description: "Continuous transaction-driven data feeds your Dynamic Credit Score (DCS), creating a real-time credit profile based on actual business performance."
        },
        {
          number: 2,
          title: "Get dynamic credit limits",
          description: "Credit limits are automatically adjusted to your transaction velocity and settlement behavior, aligned to your cash-flow realities."
        },
        {
          number: 3,
          title: "Access performance-linked credit",
          description: "From daily turnover credit to inventory financing and seasonal credit lines—each product is dynamically sized, priced, and repaid based on your business performance."
        }
      ]
    }
  ];

  const activeContent = tabs[activeTab];

  return (
    <section className="py-16 lg:py-24 bg-white">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8 xl:px-12 2xl:px-16">
        <div className="max-w-6xl mx-auto">
          {/* Top Navigation Tabs */}
          <div className="flex flex-wrap gap-4 lg:gap-8 mb-12 border-b border-gray-200 pb-4">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`text-base lg:text-lg font-semibold transition-colors pb-2 border-b-2 ${
                activeTab === tab.id
                  ? "text-[#3117ce] border-[#3117ce]"
                  : "text-black border-transparent hover:text-[#3117ce]"
              }`}
            >
              {tab.title}
            </button>
          ))}
        </div>

        {/* Main Content Area */}
        <div className="grid lg:grid-cols-2 gap-8 lg:gap-12 items-center">
          {/* Left Section - Circular Image */}
          <div className="flex justify-center lg:justify-start">
            <div className="relative w-full max-w-md">
              <div className="aspect-square rounded-full overflow-hidden shadow-2xl">
                <img
                  src={activeContent.image}
                  alt={activeContent.heading}
                  className="w-full h-full object-cover"
                />
              </div>
            </div>
          </div>

          {/* Right Section - Steps */}
          <div className="space-y-6">
            {/* Main Heading */}
            <h2 className="text-base lg:text-lg font-semibold text-[#3117ce] leading-tight mb-6">
              {activeContent.heading}
            </h2>

            {/* Steps */}
            <div className="space-y-6">
              {activeContent.steps.map((step, index) => (
                <div key={index} className="flex items-start gap-4">
                  {/* Numbered Circle Icon */}
                  <div className="flex-shrink-0 w-9 h-9 rounded-full bg-[#3117ce] flex items-center justify-center">
                    <span className="text-white font-semibold text-sm">{step.number}</span>
                  </div>
                  
                  {/* Step Content */}
                  <div className="flex-1">
                    <h3 className="text-sm lg:text-base font-semibold text-black mb-1">
                      {step.title}
                    </h3>
                    <p className="text-sm lg:text-base text-black leading-relaxed">
                      {step.description}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
        </div>
      </div>
    </section>
  );
};
