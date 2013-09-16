def path_to(page_name)
  case page_name.downcase
  when /the converter form/
    root_path
  end
end
