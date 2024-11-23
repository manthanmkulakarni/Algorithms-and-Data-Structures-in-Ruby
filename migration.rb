def get_title(file_name)
  file_name = file_name.sub('.rb','')
  if file_name.include?('_')
    result = file_name.split('_').join(' ')
  else
    result = file_name.scan(/[A-Z][a-z]*/).join(' ')
  end
  result
end

def get_path(dst_path, file_name)
  sub_folder_name = dst_path.split('/').last
  file_name = file_name.sub('.rb','')
  if !file_name.include?('_')
    result = file_name.scan(/[A-Z][a-z]*/).join('_')
  end
  "#{sub_folder_name}/#{result}"
end

def extract_code_and_comment(file_path)
  content = File.read(file_path)
  comment = []
  code = []
  flg = false
  content.split("\n").each do |line|
    if !flg
      if line.match?(/^\s*#/)
        comment << line 
      else
        flg = true
      end
    else
      code << line
    end
  end
  return code, comment
end

def process_file(dst_path, file_path)
  file_name = file_path.split('/').last
  #puts "Processing file: #{file_name}, in base path#{base_path}, dst path: #{dst_path}"
  #file_path = "#{base_path}/#{file_name}"
  dst_file_path = "#{dst_path}/#{file_name.sub('.rb','')}.md"
  code, comment = extract_code_and_comment(file_path)

  title = get_title(file_name)
  perm_link = get_path(dst_path.split('/').last, file_name)

  File.open(dst_file_path, "w") do |f|
    perm_link.downcase[0] = perm_link[0].downcase
    comment_text = ''
    comment_text += '# ' if comment && comment.length > 0
    comment_text += comment.join('\n') if comment && comment.length > 0
    file_content = <<~MD
---
layout: single
title:  "#{title}"
permalink: "#{get_path(dst_path, file_path)}"
date:   2024-11-17 00:00:00 +0000
---
#{comment_text}

## Implementation
```ruby
#{code.join("\n")}
```
MD
    f.write(file_content)
    #puts "Created file: #{dst_file_path}\n with content: #{file_content}"
    
  end
end

def process_dir(base_dir, dst_dir, dir_name)
  Dir.mkdir("#{dst_dir}/_#{dir_name}") unless File.exist?("#{dst_dir}/_#{dir_name}")
  Dir.glob("#{base_dir}/#{dir_name}/*").each do |file_name|
    process_file("#{dst_dir}/_#{dir_name}", file_name) if File.file?(file_name)
  end
end

dst_dir = '/Users/mkulakar/Desktop/AllDesktopIcons/programs/algorithms/temp/_data'
base_dir = '/Users/mkulakar/Desktop/AllDesktopIcons/programs/Algorithms-and-Data-Structures-in-Ruby'
Dir.glob('**/*').select { |f| File.directory? f }.each do |dir|
  puts dir
  process_dir(base_dir, dst_dir, dir)
end