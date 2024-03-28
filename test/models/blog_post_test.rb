require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for the draft blog post" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? returns false for the published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for the scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end
end
