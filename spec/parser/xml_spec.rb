require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::XML do
  it "should parse the xml and return a ruby object" do
    Transcoder.for("application/xml").parse("<key>value</key>").should == {"key" => "value"}
  end
end