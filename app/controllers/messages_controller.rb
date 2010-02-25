class MessagesController < ApplicationController
   verify :method => :post, :only => [ :destroy, :create ],
      :redirect_to => { :action => :list }
   # sets up the list web page that lists all messages
   def list
      if ( params[ :seller_id ] ) # if parameter forum_id is provided
         session[ :seller_id ] = params[ :seller_id ]
      end # if
      if ( session[ :seller_id ] == nil ) # if no forum_id is provided
         flash[ :notice ] = 'there has been an error.'
         redirect_to :controller => "forums", :action => "list" and return
      end # if
      @messages = Message.find( :all, :order => "created_on desc",
         :conditions => "seller_id = #{ session[:seller_id ] }" )
      @forum = Forum.find( :first,
         :conditions => "id = #{ session[ :seller_id ] }" )
   end # method list
   # sets up the new web page that creates a message
   def new
      @message = Message.new
   end # method new
   # attempts to create a new message with the parameters passed in
   def create
      @message = Message.new( params[ :message ] )
      @message.seller_id = session[ :seller_id ]
      if @message.save # if save method was successful
         flash[ :notice ] = 'Message was successfully created.'
         redirect_to :action => 'list'
      else # save was unsuccessful
         render :action => 'new'
      end # if
   end # method create
end # class MessagesController

