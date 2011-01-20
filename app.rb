require "bundler"
Bundler.setup
Bundler.require :default

unless Sinatra::Templates.instance_methods.include?(:slim)
  module Sinatra::Templates
    def slim(template, options={}, locals={})
      render :slim, template, options, locals
    end
  end
end

get '/' do
  slim :index
end

get '/:text' do
  slim :show, {}, :text => params[:text], :source => 'en', :target => 'ja'
end