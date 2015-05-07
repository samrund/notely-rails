json.extract! @note, :id, :title, :body_text, :body_html, :created_at, :updated_at

json.user @note.user.display_name
