import { Header } from "@/components/Header";
import { HeroSection } from "@/components/HeroSection";
import { AccordionSection } from "@/components/AccordionSection";
import { ScrollableCardsSection } from "@/components/ScrollableCardsSection";
import { HowItWorksSection } from "@/components/HowItWorksSection";
import { AboutSection } from "@/components/AboutSection";
import { CTASection } from "@/components/CTASection";
import { Footer } from "@/components/Footer";

const Index = () => {
  return (
    <main className="min-h-screen bg-white">
      <Header />
      <HeroSection />
      <AccordionSection />
      <ScrollableCardsSection />
      <HowItWorksSection />
      <AboutSection />
      <CTASection />
      <Footer />
    </main>
  );
};

export default Index;