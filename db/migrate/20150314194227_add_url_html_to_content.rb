class AddUrlHtmlToContent < ActiveRecord::Migration
  def change
    add_column :contents, :url_html, :text
  end
end
