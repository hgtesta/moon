module ApplicationHelper

  def breadcrumb(*args)
    navigation = {
      :panels          => lambda { link_to "Panels", panels_path },
      :current_panel   => lambda { link_to @panel.name, panel_path(@panel) },
      :current_service => lambda { link_to @service.name, panel_service_path(@panel, @service) }
    }
    button = (args.last.class == Hash and args.last[:button].present?) ? (args.pop)[:button] : nil
    links = args[0..-2].map { |place| navigation[place].call }
    last = "<span class='last'>#{args.last}</span>"
    navigation = (links << last).join " > "
    %{
      <div class="breadcrumb rounded_4">
        #{navigation}
        <div class="button">#{button}</div>
      </div>
    }.html_safe
  end

end
