require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::Yaml do
  it "should parse the yaml and return a ruby object" do
    Transcoder.for("application/x-yaml").parse("key: value").should == {"key" => "value"}
  end
  
  describe "generate" do
    it "yaml from a ruby object" do
      Transcoder.for("yaml").generate({:key => "value"}).should == "--- \n:key: value\n"
    end
    
    it "should accept an array" do
      lambda { Transcoder.for("yaml").generate([1, 2, 3]) }.should_not raise_error
    end
    
    it "should accept a hash" do
      lambda { Transcoder.for("yaml").generate({:key => "value"}) }.should_not raise_error
    end
    
    it "should not accept a string" do
      lambda { Transcoder.for("yaml").generate("value") }.should raise_error
    end
    
    it "should not accept an object" do
      lambda { Transcoder.for("yaml").generate(Object.new) }.should raise_error
    end
  end
end