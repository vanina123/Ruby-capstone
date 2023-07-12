requre 'json'

class Item
  def to_hash
    {
      name: @name
    }
  end
end

class Label
  def to_hash
    items_hash = @items.map(&:to_hash)
    { title: @title, items: items_hash }
  end
end

def save_labels_to_json(labels, filename)
  label_hashes = labels.map(&:to_hash)

  File.write(filename, JSON.pretty_generate(label_hashes))
end

def load_labels_from_json(filename)
  json_data = File.read(filename)

  label_hashes = JSON.parse(json_data)

  label_hashes.map do |hash|
    label = Label.new(hash['title'])
    items = hash['items'].map { |item_hash| Item.new(item_hash['name']) }
    items.each { |item| label.add_item(item) }
    label
  end
end
label1 = Label.new('Label 1')
label2 = Label.new('Label 2')

item1 = Item.new('Item 1')
item2 = Item.new('Item 2')

label1.add_item(item1)
label2.add_item(item2)

save_labels_to_json([label1, label2], 'labels.json')

loaded_labels = load_labels_from_json('labels.json')

loaded_labels.each do |label|
  puts "Label: #{label.title}"
  puts 'Items:'

  label.items.each do |item|
    puts "  - #{item.name}"
  end

  puts '---'
end
