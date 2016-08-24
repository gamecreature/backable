module Backable
  module ViewHelpers

    def backable_form_item
      hidden_field_tag :back, backable_param
    end


    def backable_link_to(name = nil, options = nil, html_options = nil, &block)
      if block_given?
        link_to backable_url_for(name), options, &block
      else
        link_to name, backable_url_for(options), html_options
      end
    end


    def backable_link_to_back( name = nil, html_options = nil, &block) 
      if block_given?
        arg1 = backable_back_path
        arg2 = name
      else       
        if name.kind_of?(Hash) && !html_options
          arg1 = t('backable.back') 
          arg2 = backable_back_path
          arg3 = name
        else
          arg1 = name
          arg2 = backable_back_path
          arg3 = html_options
        end
      end
      link_to arg1, arg2, arg3, &block
    end

  end
end
