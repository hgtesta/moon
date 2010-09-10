module ApplicationHelper

  def breadcrumb(*args)
    navigation = {
      :panels        => lambda { link_to "Panels", panels_path }
      :current_panel => lambda { link_to @panel.name, panel_path(@panel) }
    }
    links = args[0..-2].map { |place| navigation[place] }.join " | "
    %{
      <div class="breadcrumb">
        #{links}
      </div>
    }
  end

end
