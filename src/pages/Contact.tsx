import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Checkbox } from "@/components/ui/checkbox";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Mail, 
  Phone, 
  MapPin, 
  Clock, 
  Send,
  MessageSquare,
  Users,
  Calendar,
  Handshake,
  ArrowUp
} from "lucide-react";
import { useState } from "react";

export default function Contact() {
  const [formData, setFormData] = useState({
    name: '',
    country: '',
    email: '',
    requestTypes: {
      scheduleDemo: false,
      explorePartnership: false,
      scheduleChat: false,
      others: false
    },
    message: ''
  });

  const handleInputChange = (field: string, value: string) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }));
  };

  const handleCheckboxChange = (field: string, checked: boolean) => {
    setFormData(prev => ({
      ...prev,
      requestTypes: {
        ...prev.requestTypes,
        [field]: checked
      }
    }));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle form submission here
    console.log('Form submitted:', formData);
    // You can add your form submission logic here
  };

  const contactInfo = [
    {
      icon: <Mail className="w-6 h-6 text-primary" />,
      title: "Email Us",
      details: "hello@zacca.ai",
      description: "Send us an email anytime"
    },
    {
      icon: <Phone className="w-6 h-6 text-primary" />,
      title: "Call Us",
      details: "+254 700 000 000",
      description: "Mon-Fri from 8am to 6pm"
    },
    {
      icon: <MapPin className="w-6 h-6 text-primary" />,
      title: "Visit Us",
      details: "Nairobi, Kenya",
      description: "Come say hello at our office"
    },
    {
      icon: <Clock className="w-6 h-6 text-primary" />,
      title: "Business Hours",
      details: "Mon - Fri: 8:00 - 18:00",
      description: "EAT (East Africa Time)"
    }
  ];

  const requestTypes = [
    {
      id: 'scheduleDemo',
      label: 'Schedule a demo',
      description: 'See our solutions in action'
    },
    {
      id: 'explorePartnership',
      label: 'Explore partnership consultancy',
      description: 'Discuss partnership opportunities'
    },
    {
      id: 'scheduleChat',
      label: 'Schedule a chat with country manager',
      description: 'Connect with our local team'
    },
    {
      id: 'others',
      label: 'Others',
      description: 'Any other inquiries'
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-primary/5">
      <Header />
      
      {/* Hero Section */}
      <section className="relative pt-32 pb-20 bg-gradient-to-br from-primary via-primary/90 to-primary/80 overflow-hidden">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto text-center">
            <Badge className="mb-6 bg-accent text-primary font-semibold px-4 py-2">
              <MessageSquare className="w-4 h-4 mr-2" />
              Contact Us
            </Badge>
            <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
              Get in Touch
            </h1>
            <p className="text-xl text-white/90 leading-relaxed mb-8 max-w-4xl mx-auto">
              Ready to transform your financial services? Reach out to schedule a demo, explore partnership opportunities, 
              or connect with our team to learn more about Zacca.ai's solutions.
            </p>
          </div>
        </div>
      </section>

      {/* Contact Form Section */}
      <section className="py-20 bg-gradient-to-br from-green-50 to-green-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-12 items-start">
              {/* Left Side - Content */}
              <div className="space-y-8">
                <div>
                  <h2 className="text-4xl font-bold text-foreground mb-6">
                    Want to learn more about our solutions?
                  </h2>
                  <p className="text-xl text-muted-foreground leading-relaxed">
                    Reach out to schedule a demo/chat with our country managers or to explore partnership 
                    consultancy with our PnC team.
                  </p>
                </div>

                {/* Contact Information */}
                <div className="space-y-6">
                  {contactInfo.map((info, index) => (
                    <div key={index} className="flex items-start gap-4">
                      <div className="text-primary mt-1">
                        {info.icon}
                      </div>
                      <div>
                        <h3 className="text-lg font-semibold text-foreground mb-1">{info.title}</h3>
                        <p className="text-foreground font-medium mb-1">{info.details}</p>
                        <p className="text-muted-foreground text-sm">{info.description}</p>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Right Side - Contact Form */}
              <Card className="p-8 border-2 border-green-200 bg-white shadow-lg">
                <form onSubmit={handleSubmit} className="space-y-6">
                  {/* Name and Country */}
                  <div className="grid md:grid-cols-2 gap-4">
                    <div>
                      <label htmlFor="name" className="block text-sm font-medium text-foreground mb-2">
                        Name *
                      </label>
                      <Input
                        id="name"
                        type="text"
                        value={formData.name}
                        onChange={(e) => handleInputChange('name', e.target.value)}
                        className="border-gray-300 focus:border-primary focus:ring-primary"
                        required
                      />
                    </div>
                    <div>
                      <label htmlFor="country" className="block text-sm font-medium text-foreground mb-2">
                        Country
                      </label>
                      <Input
                        id="country"
                        type="text"
                        value={formData.country}
                        onChange={(e) => handleInputChange('country', e.target.value)}
                        className="border-gray-300 focus:border-primary focus:ring-primary"
                      />
                    </div>
                  </div>

                  {/* Email */}
                  <div>
                    <label htmlFor="email" className="block text-sm font-medium text-foreground mb-2">
                      Email *
                    </label>
                    <Input
                      id="email"
                      type="email"
                      value={formData.email}
                      onChange={(e) => handleInputChange('email', e.target.value)}
                      className="border-gray-300 focus:border-primary focus:ring-primary"
                      required
                    />
                  </div>

                  {/* Types of Request */}
                  <div>
                    <label className="block text-sm font-medium text-foreground mb-3">
                      Types of request
                    </label>
                    <div className="space-y-3">
                      {requestTypes.map((type) => (
                        <div key={type.id} className="flex items-start space-x-3">
                          <Checkbox
                            id={type.id}
                            checked={formData.requestTypes[type.id as keyof typeof formData.requestTypes]}
                            onCheckedChange={(checked) => handleCheckboxChange(type.id, checked as boolean)}
                            className="mt-1"
                          />
                          <div className="flex-1">
                            <label htmlFor={type.id} className="text-sm font-medium text-foreground cursor-pointer">
                              {type.label}
                            </label>
                            <p className="text-xs text-muted-foreground mt-1">{type.description}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>

                  {/* Message */}
                  <div>
                    <label htmlFor="message" className="block text-sm font-medium text-foreground mb-2">
                      Leave a message
                    </label>
                    <Textarea
                      id="message"
                      value={formData.message}
                      onChange={(e) => handleInputChange('message', e.target.value)}
                      className="border-gray-300 focus:border-primary focus:ring-primary min-h-[120px]"
                      placeholder="Tell us more about your needs..."
                    />
                  </div>

                  {/* Submit Button */}
                  <Button 
                    type="submit" 
                    className="w-full bg-primary hover:bg-primary/90 text-white py-3"
                    size="lg"
                  >
                    <Send className="w-5 h-5 mr-2" />
                    Send Message
                  </Button>
                </form>
              </Card>
            </div>
          </div>
        </div>
      </section>

      {/* Additional Information */}
      <section className="py-20 bg-gradient-to-br from-blue-50 to-blue-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-blue-500 text-white font-semibold px-4 py-2">
                <Users className="w-4 h-4 mr-2" />
                Our Team
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Ready to <span className="text-blue-600">Help You Succeed</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our experienced team is here to help you understand how Zacca.ai can transform your business. 
                Whether you're an SME looking to grow or a financial institution seeking better insights, 
                we're ready to support your journey.
              </p>
            </div>

            <div className="grid md:grid-cols-3 gap-8">
              <Card className="p-6 text-center border-2 border-blue-200 hover:border-blue-300 transition-all duration-300">
                <Calendar className="w-12 h-12 text-blue-500 mx-auto mb-4" />
                <h3 className="text-xl font-bold text-foreground mb-3">Schedule a Demo</h3>
                <p className="text-muted-foreground leading-relaxed">
                  See our solutions in action with a personalized demonstration tailored to your business needs.
                </p>
              </Card>

              <Card className="p-6 text-center border-2 border-blue-200 hover:border-blue-300 transition-all duration-300">
                <Handshake className="w-12 h-12 text-blue-500 mx-auto mb-4" />
                <h3 className="text-xl font-bold text-foreground mb-3">Partnership Opportunities</h3>
                <p className="text-muted-foreground leading-relaxed">
                  Explore how we can work together to serve your customers better and grow your business.
                </p>
              </Card>

              <Card className="p-6 text-center border-2 border-blue-200 hover:border-blue-300 transition-all duration-300">
                <MessageSquare className="w-12 h-12 text-blue-500 mx-auto mb-4" />
                <h3 className="text-xl font-bold text-foreground mb-3">Expert Consultation</h3>
                <p className="text-muted-foreground leading-relaxed">
                  Get personalized advice from our country managers and technical experts.
                </p>
              </Card>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action */}
      <section className="py-20 bg-gradient-to-br from-primary to-primary/80">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl font-bold text-white mb-6">
              Ready to Transform Your <span className="text-accent">Financial Services?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Don't wait to get started. Contact us today and let's discuss how Zacca.ai can help you 
              build Africa's financial future together.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <MessageSquare className="w-5 h-5 mr-2" />
                Contact Us Now
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <Calendar className="w-5 h-5 mr-2" />
                Schedule Demo
              </Button>
            </div>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
}
