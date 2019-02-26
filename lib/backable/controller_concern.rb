module Backable
  module ControllerConcern
    extend ActiveSupport::Concern

    included do
      if respond_to?(:helper_method)
        helper_method :backable_param
        helper_method :backable_history
        helper_method :backable_future
        helper_method :backable_back_path
        helper_method :backable_url_for
      end
    end

    def backable_param( history=nil)
      history ||= (backable_history + backable_future)
      history.map{ |bi| bi.to_s }.join("|")
    end

    def backable_history
      @backable_history ||= begin
        (params[:back] || "").split('|').map do |v|
          v
        end
      end
    end

    def backable_future
      @backable_future ||= []
    end

    def backable_back_path( fallback=nil )
      back = backable_history.last
      fallback = Backable.fallback_url
      return fallback unless back

      back_param = backable_param( backable_history[0..-2] )
      back.index('?') ? "#{back}&back=#{CGI::escape(back_param)}" : "#{back}?back=#{CGI::escape(back_param)}"
    end

    def backable_push(path)
      path = polymorphic_path(path) if !path.kind_of?( String )
      backable_future << path.to_s
    end

    def backable_url_for( link_options, extra_options = {} )
      args = extra_options.merge( back: backable_param )

      # support for strings
      if link_options.kind_of?( String )
        url = link_options
        url << ( link_options.index('?') ? '&' : '?' )
        url << args.to_query
        url
      else
        polymorphic_url( link_options, args )
      end
    end
  end
end
