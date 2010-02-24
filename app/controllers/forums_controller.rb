class ForumsController < ApplicationController
  verify :method => :post, :only => [ :destroy, :create ],
   :redirect_to => { :action => :list }

# shortcut to the list method
def index
   list
   render :action => 'list'
end # method index

# set up the list web page that lists all forums
def list
   @forums = Forum.find( :all )
end # method list
# set up the new web page that adds a new forum

def new
   if ( session[ :user ] == nil ) # if user is not logged in
      flash[ :error ] = 'you must be logged in to complete this action'
      redirect_to :action => "index" and return
   end # if
   @forum = Forum.new
end # method new

# attempt to create a new forum with the parameters passed in
def create
   @forum = Forum.new( params[ :forum ] )
   @forum.administrator = session[ :user ].name
   if @forum.save # if save method was successful
      flash[ :notice ] = 'Forum was successfully created.'
      redirect_to :action => 'list'
            else # save was unsuccessful
         render :action => 'new' # go to new
      end # if...else
   end # method create
   # set up the delete web page
   def delete
      if ( session[ :user ] == nil ) # if user is not logged in
         flash[ :error ] = 'you must be logged in to complete this action'
         redirect_to :action => "index" and return
      else
         @forums = Forum.find( :all,
            :conditions => "administrator = '#{ session[:user].name }'" )
      end # if else
   end # method delete
   # delete a forum with a specified parameter
   def destroy
      # find the forum and delete it
      Forum.destroy( params[ :forum ][ :id ] ) # delete the forum
      redirect_to :action => 'list' # redirect to list
   end # method destroy
end # class ForumsController

