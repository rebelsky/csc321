Sorting the List of Movies
--------------------------

* Update the controller to take a "sort by" parameter.
    * `app/controllers/movies_controller.rb`
* Update the HTML (haml) to add include a link that sets
  the "sort by" parameter
    * `app/views/movies/index.html.haml`

Filtering the List of Movies
----------------------------

* Update the model to include the list of ratings.
    * `app/models/movie.rb`
* Update the controller to take a "filter by" parameter.
    * `app/controllers/movies_controller.rb`
* Update the HTML (haml) to add the fields as specified.
    * `app/views/movies/index.html.haml`

Remembering Settings (1)
------------------------

_This is the second half of filtering_

* We need to keep track of the "sort by" parameter

Remembering Settings (2)
-----------------------

* We also need to add the "sort by" parameter to the session.
* We need to compare the session to the parameters.
    * If they are different, we should redirect

One Solution
------------

_Stolen from the SaaSbook folks._

### `app/models/movie.rb`

<pre>
class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end
</pre>

### `app/controllers/movies_controller`

<pre>
  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'title'
      ordering,@title_header = {:title => :asc}, 'hilite'
    when 'release_date'
      ordering,@date_header = {:release_date => :asc}, 'hilite'
    end
    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}
    
    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
    end
    
    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @selected_ratings
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end
    @movies = Movie.where(rating: @selected_ratings.keys).order(ordering)
  end
</pre>

### `app/views/movies/index.html.haml`

<pre>
%h1 All Movies

= form_tag movies_path, :method => :get, :id => 'ratings_form' do
  = hidden_field_tag "title_sort", true if @title_header
  = hidden_field_tag ":release_date_sort", true if @date_header
  Include: 
  - @all_ratings.each do |rating|
    = rating
    = check_box_tag "ratings[#{rating}]", 1, @selected_ratings.include?(rating), :id => "ratings_#{rating}"
  = submit_tag 'Refresh', :id => 'ratings_submit'

%table#movies
  %thead
    %tr
      %th{:class => @title_header}= link_to 'Movie Title', movies_path(:sort => 'title', :ratings => @selected_ratings), :id => 'title_header'
      %th Rating
      %th{:class => @date_header}= link_to 'Release Date', movies_path(:sort => 'release_date', :ratings => @selected_ratings), :id => 'release_date_header'
      %th More Info
  %tbody
    - @movies.each do |movie|
      %tr
        %td= movie.title 
        %td= movie.rating
        %td= movie.release_date
        %td= link_to "More about #{movie.title}", movie_path(movie)

= link_to 'Add new movie', new_movie_path

</pre>

Morals from the Assignment
--------------------------

* Very few changes to get lots of power.
* Most applications require that you master multiple languages.
* The Interweb is your friend.
