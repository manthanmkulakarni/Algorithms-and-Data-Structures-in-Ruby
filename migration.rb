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
  number_of_solutions = 0
  comment = [[]]
  code = [[]]
  reading_code_previously = false

  content.split("\n").each do |line|
    # previously processing code and found comments again
    if reading_code_previously && line.match(/^\s*#\s*(solution|approach)\b/i)
      reading_code_previously = false  # reset the flag so that we are now reading comment
      number_of_solutions += 1
      comment << []
      code << []
    end

    if !reading_code_previously
      if line.match?(/^\s*#/)
        comment[number_of_solutions] << line 
      else
        reading_code_previously = true
      end
    else
      code[number_of_solutions] << line
    end
  end
  return code, comment, number_of_solutions
end

def process_algorithm_file(dst_path, file_path)
  file_name = file_path.split('/').last
  #puts "Processing file: #{file_name}, in base path#{base_path}, dst path: #{dst_path}"
  #file_path = "#{base_path}/#{file_name}"
  dst_file_path = "#{dst_path}/#{file_name.sub('.rb','')}.md"
  code, comment, number_of_solutions = extract_code_and_comment(file_path)

  title = get_title(file_name)
  perm_link = get_path(dst_path.split('/').last, file_name)
  current_solution_index = 0

  File.open(dst_file_path, "w") do |f|
    perm_link.downcase[0] = perm_link[0].downcase
    comment_text = ''
    comment_text += '# ' if comment[current_solution_index] && comment[current_solution_index].length > 0
    comment_text += comment[current_solution_index].join('\n') if comment[current_solution_index] && comment[current_solution_index].length > 0
    file_content = <<~MD
---
layout: single
title:  "#{title}"
permalink: "#{get_path(dst_path, file_path)}"
date:   2024-11-17 00:00:00 +0000
---

MD
    (0..number_of_solutions).each do |current_solution_index|
      comment_text += '# ' if comment[current_solution_index] && comment[current_solution_index].length > 0
      comment_text += comment[current_solution_index].join('\n') if comment[current_solution_index] && comment[current_solution_index].length > 0
      file_content << <<~MD
    
Solution #{current_solution_index + 1}:

#{comment_text}

## Implementation
```ruby
#{code.join("\n")}
```
MD
    end
    f.write(file_content)
    #puts "Created file: #{dst_file_path}\n with content: #{file_content}"
    
  end
end

def process_algorithm_dir(base_dir, dst_dir, dir_name)
  Dir.mkdir("#{dst_dir}/_#{dir_name}") unless File.exist?("#{dst_dir}/_#{dir_name}")
  Dir.glob("#{base_dir}/#{dir_name}/*").each do |file_name|
    process_algorithm_file("#{dst_dir}/_#{dir_name}", file_name) if File.file?(file_name)
  end
end


# replace the following source and destination path
destination_dir = '/Users/manthanmkulakarni/Documents/rubyblog/algorithms/_temp'
source_dir = '/Users/manthanmkulakarni/Documents/Algorithms-and-Data-Structures-in-Ruby'
Dir.glob('**/*').select { |f| File.directory? f }.each do |dir|
  process_algorithm_dir(source_dir, destination_dir, dir)
end