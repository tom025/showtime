require 'spec_helper'

describe "movies/new.html.haml" do

  before(:each) do
    assigns[:movie] = mock_model(Movie).as_new_record.as_null_object
    assigns[:years] = [1980] 
    assigns[:genres] = [
      ["Action", 1],
      ["Comedy", 2],
      ["Drama",  3]
    ]
  end

  it "renders a top heading 'Create a Movie'" do
    render
    response.should have_selector("h1")
    response.should contain "Create a Movie"
  end

  it "renders a form for creating a new movie" do
    render 
    response.should have_selector("form",
      :method => "post",
      :action => movies_path
    ) do |form|
    form.should have_selector("input", :type => "submit")
    end
  end

  it "renders a text field for the title" do
    assigns[:movie].stub(:title).and_return("Caddyshack")
    render
    response.should have_selector("label",
      :for => "movie_title",
      :content => "Title"
    )

    response.should have_selector("input",
      :id => "movie_title",
      :type => "text",
      :name => "movie[title]",
      :value => "Caddyshack"
    )
  end
  
  it "renders a selectbox for the year of release" do
    assigns[:movie].stub(:release_year).and_return(1980)
    render
    response.should have_selector("label",
      :for => "movie_release_year"
    )

    response.should have_selector("select",
      :id => "movie_release_year",
      :name => "movie[release_year]"
    )

    response.should have_selector("option",
      :value => "1980",
      :selected => "selected"
    )
  end

  it "renders a selectbox for the genre" do
    assigns[:movie].stub(:genre).and_return(2)
    render
    response.should have_selector("label",
      :for => "movie_genre",
      :content => "Genre"
    )

    response.should have_selector("select",
      :id => "movie_genre",
      :name => "movie[genre]"
    )

    response.should have_selector("option",
      :value => '2',
      :selected => "selected",
      :content => "Comedy"
    )
  end
end
