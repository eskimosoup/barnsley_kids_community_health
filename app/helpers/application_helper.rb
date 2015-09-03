module ApplicationHelper
  def nested_menu_items(menu_items:, depth: 1)
    menu_items.map do |menu_item, sub_menu_items|
      render partial: "menu_items/menu_item",
             locals: { menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: sub_menu_items),
                       sub_menu_items: sub_menu_items, depth: depth }
    end.join.html_safe
  end

  def scan_for_links(text)
    result = ""
    for word in text.split(" ")
      if word.include?("http://") || word.include?("https://")
        result << link_to(word, word, :target => "_blank").to_s + " "
      elsif word.start_with?("#")
        result << link_to(word, "https://twitter.com/#{word}", :target => "_blank").to_s + " "
      elsif word.start_with?("@")
        result << link_to(word, "https://twitter.com/#{word[1..-1]}", :target => "_blank").to_s + " "
      else
        result << "#{word} "
      end
    end
    result
  end
end
