require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transcoder::Yaml do
  it "should parse the yaml and return a ruby object" do
    Transcoder.for("application/x-yaml").parse("key: value").should == {"key" => "value"}
  end
end