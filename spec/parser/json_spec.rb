require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::Json do
  it "should parse the json and return a ruby object" do
    Transcoder.for("application/json").parse('{"key": "value"}').should == {"key" => "value"}
  end
end