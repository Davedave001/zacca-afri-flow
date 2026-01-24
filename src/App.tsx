import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Index from "./pages/Index";
import DynamicCreditScoring from "./pages/DynamicCreditScoring";
import ManagerAI from "./pages/ManagerAI";
import ZaccaSmartWallet from "./pages/ZaccaSmartWallet";
import LiquiChainDAO from "./pages/LiquiChainDAO";
import TokenizedCollateral from "./pages/TokenizedCollateral";
import AnalyticsAsAService from "./pages/AnalyticsAsAService";
import Industry from "./pages/Industry";
import About from "./pages/About";
import Contact from "./pages/Contact";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/solutions/dynamic-credit-scoring" element={<DynamicCreditScoring />} />
          <Route path="/solutions/manager-ai" element={<ManagerAI />} />
          <Route path="/solutions/zacca-smart-wallet" element={<ZaccaSmartWallet />} />
          <Route path="/solutions/liquichain-dao" element={<LiquiChainDAO />} />
          <Route path="/solutions/tokenized-collateral" element={<TokenizedCollateral />} />
          <Route path="/solutions/analytics-as-a-service" element={<AnalyticsAsAService />} />
          <Route path="/industry" element={<Industry />} />
          <Route path="/about" element={<About />} />
          <Route path="/contact" element={<Contact />} />
          {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
