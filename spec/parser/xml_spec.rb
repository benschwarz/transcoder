require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::XML do
  it "should parse the xml and return a ruby object" do
    Transcoder.for("application/xml").parse("<key>value</key>").should == {"key" => "value"}
  end
  
  describe "generate" do
    it "xml from a ruby object" do
      Transcoder.for("xml").generate({"key" => "value"}).should == "<?xml version=\"1.0\"?>\n<items>\n  <item>\n    <key>value</key>\n  </item>\n</items>\n"
    end
    
    describe "nokogiri inefficiencies" do
      it "should handle keys of id" do
        Transcoder.for("xml").generate({"id" => "value"}).should == "<?xml version=\"1.0\"?>\n<items>\n  <item>\n    <id>value</id>\n  </item>\n</items>\n"
      end
      
      it "should handle keys of type" do
        Transcoder.for("xml").generate({"type" => "value"}).should == "<?xml version=\"1.0\"?>\n<items>\n  <item>\n    <type>value</type>\n  </item>\n</items>\n"
      end
      
      it "should handle keys of class" do
        Transcoder.for("xml").generate({"class" => "value"}).should == "<?xml version=\"1.0\"?>\n<items>\n  <item>\n    <class>value</class>\n  </item>\n</items>\n"
      end
      
      it "should handle keys of fork" do
        Transcoder.for("xml").generate({"fork" => "value"}).should == "<?xml version=\"1.0\"?>\n<items>\n  <item>\n    <fork>value</fork>\n  </item>\n</items>\n"
      end
    end
    
    it "should accept an array" do
      lambda { Transcoder.for("xml").generate([1, 2, 3]) }.should_not raise_error
    end
    
    it "should accept a hash" do
      lambda { Transcoder.for("xml").generate({:key => "value"}) }.should_not raise_error
    end
    
    it "should not accept a string" do
      lambda { Transcoder.for("xml").generate("value") }.should raise_error
    end
    
    it "should not accept an object" do
      lambda { Transcoder.for("xml").generate(Object.new) }.should raise_error
    end
  end
end