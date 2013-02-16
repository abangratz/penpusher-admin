require 'spec_helper'

describe BlogAdmin do
  subject { BlogAdmin.new }
  let(:article) { subject.create_article('title', 'body')  }
  it "creates an article from a title and body" do
    article.should eq(OpenStruct.new(title: 'title', body: 'body'))
  end

  it "adds the newly created article to entries" do
    subject.entries.should include(article)
  end

end
