require 'spec_helper'

describe "movies/index.html.haml" do
  it "renders a link for the create movie page" do
    render
    response.should have_selector("a",
        :href => "/movies/new"
      )

    response.should contain("Add Movie")
  end
end
