
category_brands = categories["brands"]

category_id = []

category_brands.each do |object|
category_id.push(object["children"])
end

puts category_id