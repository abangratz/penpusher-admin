require 'spec_helper'

describe ArticlesController do
  context "GET /index" do
    let(:articles) { [] }
    let(:blog) { OpenStruct.new(articles: articles) }
    it "succeeds" do
      get :index
      response.should be_success
    end

    context "retrieving articles" do
      before(:each) do
        controller.blog = blog
      end
      it "retrieves the articles from a blog instance" do
        get :index
      end

      it "sets the articles as @articles" do
        get :index
        assigns(:articles).should eq(articles)
      end

    end

  end

  context "#blog" do
    it "returns the blog instance" do
      controller.blog.should be_a(Blog)
    end

    it "caches the blog instance" do
      the_blog = controller.blog
      the_blog.should_not be_nil
      controller.blog.should == the_blog
    end

  end

end
