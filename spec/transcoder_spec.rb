require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Transcoder" do
  describe "mime-types" do
    it "should parse json" do
      Transcoder::Parser.for('application/json').should == Transcoder::Json
    end
    
    it "should parse xml" do
      Transcoder::Parser.for('text/xml').should == Transcoder::XML
    end
    
    it "should parse rss or atom" do
      Transcoder::Parser.for('application/atom+xml').should == Transcoder::Feed
    end
  end
end
