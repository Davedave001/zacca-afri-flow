import { useEffect } from "react";
import { useLocation } from "react-router-dom";
import { Header } from "@/components/Header";
import { HeroSection } from "@/components/HeroSection";
import { AccordionSection } from "@/components/AccordionSection";
import { ScrollableCardsSection } from "@/components/ScrollableCardsSection";
import { HowItWorksSection } from "@/components/HowItWorksSection";
import { FeaturesSection } from "@/components/FeaturesSection";
import { CTADownloadSection } from "@/components/CTADownloadSection";
import { Footer } from "@/components/Footer";

const Index = () => {
  const { hash } = useLocation();

  useEffect(() => {
    const scrollToHash = () => {
      if (hash === "#hero") {
        document.getElementById("hero")?.scrollIntoView({ behavior: "smooth" });
      } else if (hash === "#solutions") {
        document.getElementById("solutions")?.scrollIntoView({ behavior: "smooth" });
      } else if (hash === "#about") {
        document.getElementById("about")?.scrollIntoView({ behavior: "smooth" });
      } else if (hash === "#contact") {
        document.getElementById("contact")?.scrollIntoView({ behavior: "smooth" });
      }
    };
    if (hash) {
      requestAnimationFrame(() => requestAnimationFrame(scrollToHash));
    }
  }, [hash]);

  return (
    <main className="min-h-screen" style={{ background: "#FFFDFA" }}>
      <Header />
      <HeroSection />
      <AccordionSection />
      <ScrollableCardsSection />
      <HowItWorksSection />
      <FeaturesSection />
      <CTADownloadSection />
      <Footer />
    </main>
  );
};

export default Index;