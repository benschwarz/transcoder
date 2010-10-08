require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Transcoder" do
  it "should alias Transcoder.for to Transcoder::Parser.for" do
    Transcoder::Parser.should_receive(:for).with("application/json")
    Transcoder.for("application/json")
  end
  
  it "should register a given kind to a parser" do
    lambda { Transcoder.for("foo/bar") }.should raise_error(Registry::NotRegistered)
    Transcoder.register("foo/bar", Transcoder::Json)
    Transcoder.for("foo/bar").should == Transcoder::Json
  end
  
  describe "mime-types" do
    it "should parse json" do
      Transcoder.for('application/json').should == Transcoder::Json
    end
    
    it "should parse xml" do
      Transcoder.for('text/xml').should == Transcoder::XML
    end
    
    it "should parse rss or atom" do
      Transcoder.for('application/atom+xml').should == Transcoder::Feed
    end
    
    it "should parse yaml" do
      Transcoder.for('application/x-yaml').should == Transcoder::Yaml
    end
  end
end
