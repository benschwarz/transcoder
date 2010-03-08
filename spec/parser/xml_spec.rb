require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::XML do
  it "should parse the xml and return a ruby object" do
    Transcoder.for("application/xml").parse("<key>value</key>").should == {"key" => "value"}
  end
  
  it "should generate xml from a ruby object" do
    Transcoder.for("application/xml").generate({"key" => "value"}).should == "<?xml version=\"1.0\"?>\n<items>\n  <item>\n    <key></key>\n    <value></value>\n  </item>\n</items>\n"
  end
end