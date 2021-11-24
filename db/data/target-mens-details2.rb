
@target_mens = []
mens.each do |product|
  productModel = {
    name: product["data"]["product"]["item"]["product_description"]["title"], 
    description: product["data"]["product"]["item"]["product_description"]["bullet_descriptions"].to_s, 
    image: product["data"]["product"]["item"]["enrichment"]["images"]["primary_image_url"], 
    price_cents: product["data"]["product"]["price"]["current_retail_max"], 
    rating: product["data"]["product"]["ratings_and_reviews"]["statistics"]["rating"]["average"], 
    sale: product["data"]["product"]["price"]["formatted_current_price_type"] === "sale", 
    url: product["data"]["product"]["item"]["enrichment"]["buy_url"],
    website: "Target"
  }
  
  @target_mens.push(productModel)
end



@target_mens_features = []
mens.each do |product|
  
  @target_mens_features.push(product["data"]["product"]["item"]["merchandise_type_attributes"]) 

end

#puts @target_mens_features.count
@target_mens_array = []
i = 153
@target_mens_features.each do |product|
  
  target_elec_object = {product_id: i}
  
  
  product.each do |attribute|
    
    if attribute["name"] == "Color Family"
      values = attribute["values"][0]
      target_elec_object["color"] = values["name"]
      
    end
    if attribute["name"] == "Fabric Weight Type"
      values = attribute["values"][0]
      target_elec_object["weightType"] = values["name"]
     
    end
    if attribute["name"] == "Pattern"
      values = attribute["values"][0]
      target_elec_object["pattern"] = values["name"]
      
    end
    if attribute["name"] == "Item Type"
      values = attribute["values"][0]
      target_elec_object["type"] = values["name"]
      
    end
    if attribute["name"] == "Targeted Audience"
      values = attribute["values"][0]
      target_elec_object["audience"] = values["name"]
      
    end
    if attribute["name"] == "Sheerness level"
      values = attribute["values"][0]
      target_elec_object["sheerness"] = values["name"]
      
    end
    if attribute["name"] == "Apparel material 1"
      values = attribute["values"][0]
      target_elec_object["material1"] = values["name"]
      
    end
    if attribute["name"] == "Apparel material 2"
      values = attribute["values"][0]
      target_elec_object["material2"] = values["name"]
      
    end
    if attribute["name"] == "Apparel material 3"
      values = attribute["values"][0]
      target_elec_object["material3"] = values["name"]
      
    end
    if attribute["name"] == "Apparel material 4"
      values = attribute["values"][0]
      target_elec_object["material4"] = values["name"]
      
    end
    if attribute["name"] == "Textile wash recommendation"
      values = attribute["values"][0]
      target_elec_object["machineWash"] = (values["name"] == "Machine Wash")
    
    end
    if attribute["name"] == "Garment sleeve length type"
      values = attribute["values"][0]
      target_elec_object["sleeveLength"] = values["name"]
    
    end
    if attribute["name"] == "Garment Fit"
      values = attribute["values"][0]
      target_elec_object["Fit"] = values["name"]
    
    end
    if attribute["name"] == "Number of Pockets"
      values = attribute["values"][0]
      target_elec_object["Pockets"] = values["name"]
    
    end
    if attribute["name"] == "Garment closure type, tops"
      values = attribute["values"][0]
      target_elec_object["Closures"] = values["name"]
    
    end
    if attribute["name"] == "Garment torso length"
      values = attribute["values"][0]
      target_elec_object["TorsoLength"] = values["name"]
    
    end
    if attribute["name"] == "Garment collar type"
      values = attribute["values"][0]
      target_elec_object["Collar"] = values["name"]
    
    end
    if attribute["name"] == "Garment lapel design"
      values = attribute["values"][0]
      target_elec_object["Lapel"] = values["name"]
    
    end
    if attribute["name"] == "Apparel lining material 1"
      values = attribute["values"][0]
      target_elec_object["LiningMaterial"] = values["name"]
    
    end
    if attribute["name"] == "Garment cuff type"
      values = attribute["values"][0]
      target_elec_object["Cuff"] = values["name"]
    
    end

  end
  i+=1
  @target_mens_array.push(target_elec_object)

end
puts "object count"
puts @target_mens_array