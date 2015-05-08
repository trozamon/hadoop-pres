def add_prompt(prompt, fname)
  raw = File.read(fname)
  final = Array.new
  raw.split("\n") do |line|
    final << "#{prompt} #{line}"
  end

  final.join("\n")
end
