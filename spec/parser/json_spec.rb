require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::Json do
  it "should parse the json and return a ruby object" do
    Transcoder.for("application/json").parse('{"key": "value"}').should == {"key" => "value"}
  end
  
  
  describe "generate" do
    it "json from a ruby object" do
      Transcoder.for("json").generate({:key => "value"}).should == "{\"key\":\"value\"}"
    end
    
    it "should accept an array" do
      lambda { Transcoder.for("json").generate([1, 2, 3]) }.should_not raise_error
    end
    
    it "should accept a hash" do
      lambda { Transcoder.for("json").generate({:key => "value"}) }.should_not raise_error
    end
    
    it "should not accept a string" do
      lambda { Transcoder.for("json").generate("value") }.should raise_error
    end
    
    it "should not accept an object" do
      lambda { Transcoder.for("json").generate(Object.new) }.should raise_error
    end
  end
end